private ["_location","_dir","_classname","_text","_object","_objectID","_objectUID","_newclassname","_refund","_obj","_upgrade","_objectCharacterID","_canBuildOnPlot","_friendlies","_nearestPole","_ownerID","_distance","_needText","_findNearestPoles","_findNearestPole","_IsNearPlot","_i","_invResult","_itemOut","_countOut","_abortInvAdd","_addedItems"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_48") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

player removeAction s_player_downgrade_build;
s_player_downgrade_build = 1;

_distance = 30;
_needText = localize "str_epoch_player_246";

_findNearestPoles = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], _distance];
_findNearestPole = [];

{
	if (alive _x) then {
		_findNearestPole set [(count _findNearestPole),_x];
	};
} count _findNearestPoles;

_IsNearPlot = count (_findNearestPole);

_canBuildOnPlot = false;

if(_IsNearPlot == 0) then {
	_canBuildOnPlot = true;
} else {

	_nearestPole = _findNearestPole select 0;

	_ownerID = _nearestPole getVariable["CharacterID","0"];


	if(dayz_characterID == _ownerID) then {
		_canBuildOnPlot = true;
	} else {
		_friendlies = _nearestPole getVariable ["plotfriends",[]];
		_fuid  = [];
		{
		_friendUID = _x select 0;
		_fuid  =  _fuid  + [_friendUID];
		} forEach _friendlies;
		_builder  = getPlayerUID player;
		
		if(_builder in _fuid) then {
			_canBuildOnPlot = true;
		};
	};
};

if(!_canBuildOnPlot) exitWith {  DZE_ActionInProgress = false; cutText [format[(localize "str_epoch_player_141"),_needText,_distance] , "PLAIN DOWN"]; };

_obj = _this select 3;

_objectCharacterID 	= _obj getVariable ["CharacterID","0"];

if(DZE_Lock_Door != _objectCharacterID) exitWith {  DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_49") , "PLAIN DOWN"]; };

_objectID 	= _obj getVariable ["ObjectID","0"];

_objectUID	= _obj getVariable ["ObjectUID","0"];

if(_objectID == "0" && _objectUID == "0") exitWith {DZE_ActionInProgress = false; s_player_upgrade_build = -1; cutText [(localize "str_epoch_player_50"), "PLAIN DOWN"];};

_classname = typeOf _obj;

_text = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");

_upgrade = getArray (configFile >> "CfgVehicles" >> _classname >> "downgradeBuilding");

if ((count _upgrade) > 0) then {

	_newclassname = _upgrade select 0;

	_refund = _upgrade select 1;
	[1,1] call dayz_HungerThirst;
	player playActionNow "Medic";
	[player,20,true,(getPosATL player)] spawn player_alertZombies;

	_invResult = false;
	_abortInvAdd = false;
	_i = 0;
	_addedItems = [];

	{
		_itemOut = _x select 0;
		_countOut = _x select 1;

		for "_x" from 1 to _countOut do {
			_invResult = [player,_itemOut] call BIS_fnc_invAdd;
			if(!_invResult) exitWith {
				_abortInvAdd = true;
			};
			if(_invResult) then {
				_i = _i + 1;
				_addedItems set [(count _addedItems),[_itemOut,1]];
			};
		};

		if (_abortInvAdd) exitWith {};

	} count _refund;

	if(_i != 0) then {

		_location	= _obj getVariable["OEMPos",(getposATL _obj)];

		_dir = getDir _obj;

		_vector = [(vectorDir _obj),(vectorUp _obj)];
		
		if (_classname in DZE_DoorsLocked) then {
			_obj setVariable ["CharacterID",dayz_characterID,true];
			_objectCharacterID = dayz_characterID;
		};

		_classname = _newclassname;

		_object = createVehicle [_classname, [0,0,0], [], 0, "CAN_COLLIDE"];
		
		if ((typeOf _object) in indestructible) then {
			_object addEventHandler ["HandleDamage", {false}];
			_object enableSimulation false;
		};

		_object setDir _dir;

		_object setVectorDirAndUp _vector;
		
		_object setPosATL _location;

		cutText [format[(localize "str_epoch_player_142"),_text], "PLAIN DOWN", 5];

		PVDZE_obj_Swap = [_objectCharacterID,_object,[_dir,_location,_vector],_classname,_obj,player];
		publicVariableServer "PVDZE_obj_Swap";

		player reveal _object;

	} else {
		cutText [format[(localize "str_epoch_player_143"), _i,(getText(configFile >> "CfgMagazines" >> _itemOut >> "displayName"))], "PLAIN DOWN"];
		{
			[player,(_x select 0),(_x select 1)] call BIS_fnc_invRemove;
		} count _addedItems;

	};

} else {
	cutText [(localize "str_epoch_player_51"), "PLAIN DOWN"];
};

DZE_ActionInProgress = false;
s_player_downgrade_build = -1;
