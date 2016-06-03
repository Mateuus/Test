private ["_location","_dir","_classname","_item","_hasrequireditem","_missing","_hastoolweapon","_cancel","_reason","_started","_finished","_animState","_isMedic","_dis","_sfx","_hasbuilditem","_tmpbuilt","_onLadder","_isWater","_require","_text","_offset","_IsNearPlot","_isOk","_location1","_location2","_counter","_limit","_proceed","_num_removed","_position","_object","_canBuildOnPlot","_friendlies","_nearestPole","_ownerID","_findNearestPoles","_findNearestPole","_distance","_classnametmp","_ghost","_isPole","_needText","_lockable","_zheightchanged","_rotate","_combination_1","_combination_2","_combination_3","_combination_4","_combination","_combination_1_Display","_combinationDisplay","_zheightdirection","_abort","_isNear","_need","_needNear","_vehicle","_inVehicle","_requireplot","_objHDiff","_isLandFireDZ","_isTankTrap"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_40") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

if((count ((getPosATL player) nearObjects ["All",30])) >= DZE_BuildingLimit) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_41"), "PLAIN DOWN"];};

_onLadder =     (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_isWater =      dayz_isSwimming;
_cancel = false;
_reason = "";
_canBuildOnPlot = false;

_vehicle = vehicle player;
_inVehicle = (_vehicle != player);

DZE_Q = false;
DZE_Z = false;

DZE_Q_alt = false;
DZE_Z_alt = false;

DZE_Q_ctrl = false;
DZE_Z_ctrl = false;

DZE_5 = false;
DZE_4 = false;
DZE_6 = false;

DZE_cancelBuilding = false;

call gear_ui_init;
closeDialog 1;

if (_isWater) exitWith {DZE_ActionInProgress = false; cutText [localize "str_player_26", "PLAIN DOWN"];};
if (_inVehicle) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_42"), "PLAIN DOWN"];};
if (_onLadder) exitWith {DZE_ActionInProgress = false; cutText [localize "str_player_21", "PLAIN DOWN"];};
if (player getVariable["combattimeout", 0] >= time) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_43"), "PLAIN DOWN"];};

_item = _this;

_abort = false;
_reason = "";

private["_index"];
_index = _this call getDeployableIndex;
_needNear = _index call getDeployableNeedNearBy;

{
    switch(_x) do{
        case "fire":
        {
            _distance = 3;
            _isNear = {inflamed _x} count (getPosATL player nearObjects _distance);
            if(_isNear == 0) then {
                _abort = true;
                _reason = "fire";
            };
        };
        case "workshop":
        {
            _distance = 3;
            _isNear = count (nearestObjects [player, ["Wooden_shed_DZ","WoodShack_DZ","WorkBench_DZ"], _distance]);
            if(_isNear == 0) then {
                _abort = true;
                _reason = "workshop";
            };
        };
        case "fueltank":
        {
            _distance = 30;
            _isNear = count (nearestObjects [player, dayz_fuelsources, _distance]);
            if(_isNear == 0) then {
                _abort = true;
                _reason = "fuel tank";
            };
        };
    };
} forEach _needNear;


if(_abort) exitWith {
    cutText [format[(localize "str_epoch_player_135"),_reason,_distance], "PLAIN DOWN"];
    DZE_ActionInProgress = false;
};

_classname      = _index call getDeployableClass;
_classnametmp   = _classname;
_require        = [];
_text           = _index call getDeployableDisplay;
_ghost          = "";

_lockable = 0;
if(isNumber (configFile >> "CfgVehicles" >> _classname >> "lockable")) then {
    _lockable = getNumber(configFile >> "CfgVehicles" >> _classname >> "lockable");
};

_requireplot = 1;
if(isNumber (configFile >> "CfgVehicles" >> _classname >> "requireplot")) then {
    _requireplot = getNumber(configFile >> "CfgVehicles" >> _classname >> "requireplot");
};
if(_index call getDeployableRequirePlot) then {_requireplot = 1;} else {_requireplot = 0;};

_isAllowedUnderGround = 1;
if(isNumber (configFile >> "CfgVehicles" >> _classname >> "nounderground")) then {
    _isAllowedUnderGround = getNumber(configFile >> "CfgVehicles" >> _classname >> "nounderground");
};

_offset =   getArray (configFile >> "CfgVehicles" >> _classname >> "offset");
if((count _offset) <= 0) then {
    _offset = [0,1.5,0];
};
_offset = _index call getDeployableDistanceOffset;

_isPole = (_classname == "Plastic_Pole_EP1_DZ");
_isLandFireDZ = (_classname == "Land_Fire_DZ");

_distance = DZE_PlotPole select 0;
_needText = localize "str_epoch_player_246";

if(_isPole) then {
    _distance = DZE_PlotPole select 1;
};

_findNearestPoles = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], _distance];
_findNearestPole = [];

{
    if (alive _x) then {
        _findNearestPole set [(count _findNearestPole),_x];
    };
} count _findNearestPoles;

_IsNearPlot = count (_findNearestPole);

if(_isPole && _IsNearPlot > 0) exitWith {  DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_44") , "PLAIN DOWN"]; };

private["_exitWith"];
if(_IsNearPlot == 0) then {

    if(_requireplot == 0 || _isLandFireDZ) then {
        _canBuildOnPlot = true;
    } else {
        _exitWith = (localize "STR_EPOCH_PLAYER_135");
    };

} else {

    _nearestPole = _findNearestPole select 0;

    _ownerID = _nearestPole getVariable ["CharacterID","0"];


    if(dayz_characterID == _ownerID) then {  
        if(!_isPole) then {
            _canBuildOnPlot = true;
        } else {
            _exitWith = "You can't build a plot within your plot!";
        };

    } else {
        if(!_isPole) then {
            _friendlies     = player getVariable ["friendlyTo",[]];
            if(_ownerID in _friendlies) then {
                _canBuildOnPlot = true;
            } else {
                _exitWith = "Voce nao pode construir no plot de alguem!";
            };
        };
    };
};

if(!_canBuildOnPlot) exitWith {  DZE_ActionInProgress = false; cutText [format[_exitWith,_needText,_distance] , "PLAIN DOWN"]; };

_missing = "";
_hasrequireditem = true;
{
    _hastoolweapon = _x in weapons player;
    if(!_hastoolweapon) exitWith { _hasrequireditem = false; _missing = getText (configFile >> "cfgWeapons" >> _x >> "displayName"); };
} count _require;
    _hastoolweapon = (_index call getDeployableKitClass) in ((weapons player) + (magazines player));
    if(!_hastoolweapon) then { _hasrequireditem = false; _missing = (_index call getDeployableKitDisplay); };
	
_hasbuilditem = [player,_index] call getHasDeployableParts;
if (!_hasbuilditem) exitWith {DZE_ActionInProgress = false; cutText [format[(localize "str_player_31"),str (_index call getDeployableParts),"build"] , "PLAIN DOWN"]; };

if (!_hasrequireditem) exitWith {DZE_ActionInProgress = false; cutText [format[(localize "str_epoch_player_137"),_missing] , "PLAIN DOWN"]; };
if (_hasrequireditem) then {

    _location = [0,0,0];
    _isOk = true;

    _location1 = getPosATL player;
    _dir = getDir player;

    if (_ghost != "") then {
        _classname = _ghost;
    };

    _object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
    _object setVariable["ObjectUID","1",true];

    _object attachTo [player,_offset];
    
    _dir = 0;
    _object setDir _dir;

    _position = getPosATL _object;

    cutText [(localize "str_epoch_player_45"), "PLAIN DOWN"];

    _objHDiff = 0;

    while {_isOk} do {

        _zheightchanged = false;
        _zheightdirection = "";
        _rotate = false;

        if (DZE_Q) then {
            DZE_Q = false;
            _zheightdirection = "up";
            _zheightchanged = true;
        };
        if (DZE_Z) then {
            DZE_Z = false;
            _zheightdirection = "down";
            _zheightchanged = true;
        };
        if (DZE_Q_alt) then {
            DZE_Q_alt = false;
            _zheightdirection = "up_alt";
            _zheightchanged = true;
        };
        if (DZE_Z_alt) then {
            DZE_Z_alt = false;
            _zheightdirection = "down_alt";
            _zheightchanged = true;
        };
        if (DZE_Q_ctrl) then {
            DZE_Q_ctrl = false;
            _zheightdirection = "up_ctrl";
            _zheightchanged = true;
        };
        if (DZE_Z_ctrl) then {
            DZE_Z_ctrl = false;
            _zheightdirection = "down_ctrl";
            _zheightchanged = true;
        };
        if (DZE_4) then {
            _rotate = true;
            DZE_4 = false;
            _dir = _dir + 30;
        };
        if (DZE_6) then {
            _rotate = true;
            DZE_6 = false;
            _dir = _dir - 30;
        };

        if(_rotate) then {
            _object setDir _dir;
            _object setPosATL _position;
        };

        if(_zheightchanged) then {
            detach _object;

            _position = getPosATL _object;

            if(_zheightdirection == "up") then {
                _position set [2,((_position select 2)+0.1)];
                _objHDiff = _objHDiff + 0.1;
            };
            if(_zheightdirection == "down") then {
                _position set [2,((_position select 2)-0.1)];
                _objHDiff = _objHDiff - 0.1;
            };

            if(_zheightdirection == "up_alt") then {
                _position set [2,((_position select 2)+1)];
                _objHDiff = _objHDiff + 1;
            };
            if(_zheightdirection == "down_alt") then {
                _position set [2,((_position select 2)-1)];
                _objHDiff = _objHDiff - 1;
            };

            if(_zheightdirection == "up_ctrl") then {
                _position set [2,((_position select 2)+0.01)];
                _objHDiff = _objHDiff + 0.01;
            };
            if(_zheightdirection == "down_ctrl") then {
                _position set [2,((_position select 2)-0.01)];
                _objHDiff = _objHDiff - 0.01;
            };

            if((_isAllowedUnderGround == 0) && ((_position select 2) < 0)) then {
                _position set [2,0];
            };

            _object setPosATL _position;

            _object attachTo [player];

            _object setDir _dir;

        };

        sleep 0.5;

        _location2 = getPosATL player;

        if(DZE_5) exitWith {
            _isOk = false;
            detach _object;
            _dir = getDir _object;
            _position = getPosATL _object;
            _object setPos[0,0,0];
            hideObject _object;
            deleteVehicle _object;
        };

        if(_location1 distance _location2 > 5) exitWith {
            _isOk = false;
            _cancel = true;
            _reason = "Voce se deslocou de mais de onde come�ou a construir (5 metros)";
            detach _object;
            _object setPos[0,0,0];
            hideObject _object;
            deleteVehicle _object;
        };

        if(abs(_objHDiff) > 40) exitWith {
            _isOk = false;
            _cancel = true;
            _reason = "Nao pode colocar para cima|baixo mais do que 40 meters";
            detach _object;
            _object setPos[0,0,0];
            hideObject _object;
            deleteVehicle _object;
        };

        if (player getVariable["combattimeout", 0] >= time) exitWith {
            _isOk = false;
            _cancel = true;
            _reason = (localize "str_epoch_player_43");
            detach _object;
            _object setPos[0,0,0];
            hideObject _object;
            deleteVehicle _object;
        };

        if (DZE_cancelBuilding) exitWith {
            _isOk = false;
            _cancel = true;
            _reason = "Cancelado.";
            detach _object;
            _object setPos[0,0,0];
            hideObject _object;
            deleteVehicle _object;
        };
    };

    if (!(_index call getDeployableBuildOnRoad)) then {
        if (isOnRoad [_position select 0, _position select 1, 0]) then { _cancel = true; _reason = "Nao pode construir em estradas."; };
    };

    if(!canbuild) then { _cancel = true; _reason = "Cannot build in a city."; };

    if(!_cancel) then {

        _classname = _classnametmp;

        _tmpbuilt = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];

        if (!(_index call getDeployableSimulation)) then {
            _tmpbuilt enableSimulation false;
        };
        _tmpbuilt setVariable ["ObjectUID", "1", true];

        _tmpbuilt setdir _dir;

        _location = _position;

        if((_isAllowedUnderGround == 0) && ((_location select 2) < 0)) then {
            _location set [2,0];
        };

        _tmpbuilt setPosATL _location;


        cutText [format[(localize "str_epoch_player_138"),_text], "PLAIN DOWN"];

        _limit = 1;

        if (DZE_StaticConstructionCount > 0) then {
            _limit = DZE_StaticConstructionCount;
        }
        else {
            if (isNumber (configFile >> "CfgVehicles" >> _classname >> "constructioncount")) then {
                _limit = getNumber(configFile >> "CfgVehicles" >> _classname >> "constructioncount");
            };
        };

        _isOk = true;
        _proceed = false;
        _counter = 0;

        while {_isOk} do {

            [10,10] call dayz_HungerThirst;
            player playActionNow "Medic";

            _dis=20;
            _sfx = "repair";
            [player,_sfx,0,false,_dis] call dayz_zombieSpeak;
            [player,_dis,true,(getPosATL player)] spawn player_alertZombies;

            r_interrupt = false;
            r_doLoop = true;
            _started = false;
            _finished = false;

            while {r_doLoop} do {
                _animState = animationState player;
                _isMedic = ["medic",_animState] call fnc_inString;
                if (_isMedic) then {
                    _started = true;
                };
                if (_started && !_isMedic) then {
                    r_doLoop = false;
                    _finished = true;
                };
                if (r_interrupt || (player getVariable["combattimeout", 0] >= time)) then {
                    r_doLoop = false;
                };
                if (DZE_cancelBuilding) exitWith {
                    r_doLoop = false;
                };
                sleep 0.1;
            };
            r_doLoop = false;


            if(!_finished) exitWith {
                _isOk = false;
                _proceed = false;
            };

            if(_finished) then {
                _counter = _counter + 1;
            };

            cutText [format[(localize "str_epoch_player_139"),_text, _counter,_limit], "PLAIN DOWN"];

            if(_counter == _limit) exitWith {
                _isOk = false;
                _proceed = true;
            };

        };

        if (_proceed) then {

            if([player,_index] call getHasDeployableParts) then {
                [player,_index] call removeDeployableParts;

                cutText [format[localize "str_build_01",_text], "PLAIN DOWN"];

                if (_isPole) then {
                    [] spawn player_plotPreview;
                };

                _tmpbuilt setVariable ["OEMPos",_location,true];

                if(_lockable > 1) then {

                    _combinationDisplay = "";

                    switch (_lockable) do {

                        case 2: { 
                            _combination_1 = (floor(random 3)) + 100; 
                            _combination_2 = floor(random 10);
                            _combination_3 = floor(random 10);
                            _combination = format["%1%2%3",_combination_1,_combination_2,_combination_3];
                            dayz_combination = _combination;
                            if (_combination_1 == 100) then {
                                _combination_1_Display = "Red";
                            };
                            if (_combination_1 == 101) then {
                                _combination_1_Display = "Green";
                            };
                            if (_combination_1 == 102) then {
                                _combination_1_Display = "Blue";
                            };
                            _combinationDisplay = format["%1%2%3",_combination_1_Display,_combination_2,_combination_3];
                        };

                        case 3: {
                            _combination_1 = floor(random 10);
                            _combination_2 = floor(random 10);
                            _combination_3 = floor(random 10);
                            _combination = format["%1%2%3",_combination_1,_combination_2,_combination_3];
                            dayz_combination = _combination;
                            _combinationDisplay = _combination;
                        };

                        case 4: {
                            _combination_1 = floor(random 10);
                            _combination_2 = floor(random 10);
                            _combination_3 = floor(random 10);
                            _combination_4 = floor(random 10);
                            _combination = format["%1%2%3%4",_combination_1,_combination_2,_combination_3,_combination_4];
                            dayz_combination = _combination;
                            _combinationDisplay = _combination;
                        };
                    };

                    _tmpbuilt setVariable ["CharacterID",_combination,true];


                    PVDZE_obj_Publish = [_combination,_tmpbuilt,[_dir,_location],_classname];
                    publicVariableServer "PVDZE_obj_Publish";

                    cutText [format[(localize "str_epoch_player_140"),_combinationDisplay,_text], "PLAIN DOWN", 5];


                } else {
                    if (_index call getPermanent) then {
                        _tmpbuilt call fnc_set_temp_deployable_id;
                        if(_index call getDeployableSimulation) then {
                            PVDZE_veh_Publish = [_tmpbuilt,[_dir,_position],(_index call getDeployableClass),true,call fnc_perm_deployable_id];
                            publicVariableServer "PVDZE_veh_Publish";
                        } else {
                            PVDZE_obj_Publish = [call fnc_perm_deployable_id,_tmpbuilt,[_dir,_position],(_index call getDeployableClass)];
                            publicVariableServer "PVDZE_obj_Publish";
                        };
                    } else {
                        _tmpbuilt call fnc_set_temp_deployable_id;
                    };
                    if(_index call getClearCargo) then {
                        clearWeaponCargoGlobal _tmpbuilt;
                        clearMagazineCargoGlobal _tmpbuilt;
                    };
                    if(_index call getDeployableClearAmmo) then {
                        _tmpbuilt setVehicleAmmo 0;
                    };
                    player reveal _tmpbuilt;
                    DZE_DEPLOYING_SUCCESSFUL = true;
                };
            } else {
                _tmpbuilt setPos[0,0,0];
                hideObject _tmpbuilt;
                deleteVehicle _tmpbuilt;
                cutText [(localize "str_epoch_player_46") , "PLAIN DOWN"];
            };

        } else {
            r_interrupt = false;
            if (vehicle player == player) then {
                [objNull, player, rSwitchMove,""] call RE;
                player playActionNow "stop";
            };

            _tmpbuilt setPos[0,0,0];
            hideObject _tmpbuilt;
            deleteVehicle _tmpbuilt;

            cutText [(localize "str_epoch_player_46") , "PLAIN DOWN"];
        };

    } else {
        cutText [format[(localize "str_epoch_player_47"),_text,_reason], "PLAIN DOWN"];
    };
};

DZE_ActionInProgress = false;
