private ["_dikCode","_handled","_primaryWeapon","_secondaryWeapon","_nearbyObjects","_nill","_shift","_ctrl","_alt","_dropPrimary","_dropSecondary","_iItem","_removed","_iPos","_radius","_item"];
_dikCode = 	_this select 1;

_proneActions = ["amovpercmsprslowwrfldf_amovppnemstpsraswrfldnon","AmovPercMsprSlowWpstDf_AmovPpneMstpSrasWpstDnon","AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon","AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon_2","AmovPercMsprSlowWpstDf_AmovPpneMstpSrasWpstDnon_2","amovpercmsprslowwrfldf_amovppnemstpsraswrfldnon_2","AmovPercMrunSlowWrflDf_AmovPpneMstpSrasWrflDnon"];
if ((animationState player) in _proneActions) then {
	player switchMove "";
	player switchMove "amovpercmstpsraswpstdnon_amovppnemstpsraswpstdnon";
};

_handled = false;

if (_dikCode in[0x02,0x03,0x04,0x58,0x57,0x44,0x43,0x42,0x41,0x40,0x3F,0x3E,0x3D,0x3C,0x3B,0x0B,0x0A,0x09,0x08,0x07,0x06,0x05]) then {
	_handled = true;
};

if ((_dikCode == 0x3E or _dikCode == 0x0F or _dikCode == 0xD3)) then {
	if(diag_tickTime - dayz_lastCheckBit > 10) then {
		dayz_lastCheckBit = diag_tickTime;
		call dayz_forceSave;
	};
	call dayz_EjectPlayer;
};

if (_dikCode == 0x01) then {
    _nill = execvm "scripts\esc.sqf";
	DZE_cancelBuilding = true;
	call dayz_EjectPlayer;
};
if (_dikCode == 0x01 && r_player_dead) then {
	_handled = true;
};

if (_dikCode in actionKeys "Surrender") then {
	
	_vehicle = vehicle player;
	_inVehicle = (_vehicle != player);
	_onLadder =	(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
	_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder and !_inVehicle);
	
	if (_canDo and !DZE_Surrender and !(player isKindOf  "PZombie_VB")) then {
		DZE_Surrender = true;
		_dropPrimary = false;
		_dropSecondary = false;

		_primaryWeapon = primaryWeapon player;
		if (_primaryWeapon != "") then {_dropPrimary = true;};
		_secondaryWeapon = "";
		{
			if ((getNumber (configFile >> "CfgWeapons" >> _x >> "Type")) == 2) exitWith {
					_secondaryWeapon = _x;
			};
		} forEach (weapons player);
		if (_secondaryWeapon != "") then {_dropSecondary = true;};

		if (_dropPrimary or _dropSecondary) then {
			player playActionNow "PutDown";
			_iPos = getPosATL player;
			_radius = 1;
			_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
			_item setposATL _iPos;
			if (_dropPrimary) then {
				_iItem = _primaryWeapon;
				_removed = ([player,_iItem,1] call BIS_fnc_invRemove);
				if (_removed == 1) then {
					_item addWeaponCargoGlobal [_iItem,1];
				};
			};
			if (_dropSecondary) then {
				_iItem = _secondaryWeapon;
				_removed = ([player,_iItem,1] call BIS_fnc_invRemove);
				if (_removed == 1) then {
					_item addWeaponCargoGlobal [_iItem,1];
				};
			};
			player reveal _item;
		};

		player setVariable ["DZE_Surrendered", true, true];
		player playMove "AmovPercMstpSsurWnonDnon";
	};
	_handled = true;
};

if (_dikCode in actionKeys "MoveForward") exitWith {r_interrupt = true; if (DZE_Surrender) then {call dze_surrender_off};};
if (_dikCode in actionKeys "MoveLeft") exitWith {r_interrupt = true; if (DZE_Surrender) then {call dze_surrender_off};};
if (_dikCode in actionKeys "MoveRight") exitWith {r_interrupt = true; if (DZE_Surrender) then {call dze_surrender_off};};
if (_dikCode in actionKeys "MoveBack") exitWith {r_interrupt = true; if (DZE_Surrender) then {call dze_surrender_off};};

if ((_dikCode in actionKeys "Prone") and r_drag_sqf) exitWith { force_dropBody = true; };
if ((_dikCode in actionKeys "Crouch") and r_drag_sqf) exitWith { force_dropBody = true; };

_shift = 	_this select 2;
_ctrl = 	_this select 3;
_alt =		_this select 4;

if ((_dikCode in actionKeys "Gear") and (vehicle player != player) and !_shift and !_ctrl and !_alt && !dialog) then {
			createGearDialog [player, "RscDisplayGear"];
			_handled = true;
};
if (_dikCode == 0x0F) then {  
   _handle=createdialog "CCDMenu";
};
if (_dikCode in (actionKeys "GetOver")) then {
	
	if (player isKindOf  "PZombie_VB") then {
		_handled = true;
		DZE_PZATTACK = true;
	} else {
		_nearbyObjects = nearestObjects[getPosATL player, dayz_disallowedVault, 8];
		if (count _nearbyObjects > 0) then {
			if((diag_tickTime - dayz_lastCheckBit > 4)) then {
				[objNull, player, rSwitchMove,"GetOver"] call RE;
				player playActionNow "GetOver";
				dayz_lastCheckBit = diag_tickTime;
			} else {
				_handled = true;
			};
		};
	};
};

if (_dikCode in actionKeys "ForceCommandingMode") then {_handled = true};
if (_dikCode in actionKeys "PushToTalk" and (diag_tickTime - dayz_lastCheckBit > 10)) then {
	dayz_lastCheckBit = diag_tickTime;
	[player,50,true,(getPosATL player)] spawn player_alertZombies;
};
if (_dikCode in actionKeys "VoiceOverNet" and (diag_tickTime - dayz_lastCheckBit > 10)) then {
	dayz_lastCheckBit = diag_tickTime;
	[player,50,true,(getPosATL player)] spawn player_alertZombies;
};
if (_dikCode == 0x03) then {
	player playMoveNow "ActsPercMrunSlowWrflDf_FlipFlopPara";
};
if (_dikCode in actionKeys "PushToTalkDirect" and (diag_tickTime - dayz_lastCheckBit > 10)) then {
	dayz_lastCheckBit = diag_tickTime;
	[player,15,false,(getPosATL player)] spawn player_alertZombies;
};
if (_dikCode in actionKeys "Chat" and (diag_tickTime - dayz_lastCheckBit > 10)) then {
	dayz_lastCheckBit = diag_tickTime;
	[player,15,false,(getPosATL player)] spawn player_alertZombies;
};
if (_dikCode in actionKeys "User20" and (diag_tickTime - dayz_lastCheckBit > 5)) then {
    dayz_lastCheckBit = diag_tickTime;
};

if ((_dikCode == 0xC9 and (!_alt or !_ctrl)) or (_dikCode in actionKeys "User15")) then {
	DZE_Q = true;
};
if ((_dikCode == 0xD1 and (!_alt or !_ctrl)) or (_dikCode in actionKeys "User16")) then {
	DZE_Z = true;
};


if ((_dikCode == 0xC9 and (_alt and !_ctrl)) or (_dikCode in actionKeys "User13")) then {
	DZE_Q_alt = true;
};
if ((_dikCode == 0xD1 and (_alt and !_ctrl)) or (_dikCode in actionKeys "User14")) then {
	DZE_Z_alt = true;
};


if ((_dikCode == 0xC9 and (!_alt and _ctrl)) or (_dikCode in actionKeys "User7")) then {
	DZE_Q_ctrl = true;
};
if ((_dikCode == 0xD1 and (!_alt and _ctrl)) or (_dikCode in actionKeys "User8")) then {
	DZE_Z_ctrl = true;
};

if (_dikCode == 0x10 or (_dikCode in actionKeys "User17")) then {
	DZE_4 = true;
};		
if (_dikCode == 0x12 or (_dikCode in actionKeys "User18")) then {
	DZE_6 = true;
};
if (_dikCode == 0x39 or (_dikCode in actionKeys "User19")) then {
	DZE_5 = true;
};

if ((_dikCode == 0x21 and (!_alt and !_ctrl)) or (_dikCode in actionKeys "User6")) then {
	DZE_F = true;
};

// Dayz Group Management
if (_dikCode == 0xDB) then {
    if (tagName) then {tagName = false;titleText ["Group name tags OFF","PLAIN DOWN"];titleFadeOut 4;} else {tagName = true;titleText ["Group name tags ON","PLAIN DOWN"];titleFadeOut 4;};
    _handled = true;
};
if (_dikCode in actionKeys "TacticalView") then {
execVM "addons\dzgm\noTactical.sqf";
};
if (_dikCode == 0xDC) then {
if (dialog) then {closeDialog 0;groupManagementActive = false;} else {execVM "addons\dzgm\loadGroupManagement.sqf";};
};

if ((_dikCode in actionKeys "PushToTalk") ||(_dikCode in actionKeys "VoiceOverNet")) then
{
	player spawn player_disableSide;
};
if (_dikCode == 0x41) then {
	execVM "custom\menu\scripts\deploy.sqf";
};

if (_dikCode == 0x40) then {
	execVM "custom\menu\scripts\Earplugs.sqf";
};

_handled
