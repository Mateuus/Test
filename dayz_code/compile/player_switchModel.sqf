private ["_weapons","_backpackWpn","_backpackMag","_currentWpn","_isWeapon","_backpackWpnTypes","_backpackWpnQtys","_countr","_class","_position","_dir","_currentAnim","_tagSetting","_playerUID","_countMags","_magazines","_primweapon","_secweapon","_newBackpackType","_muzzles","_oldUnit","_group","_newUnit","_playerObjName","_wpnType","_ismelee"];

_class 			= _this;
_position 		= getPosATL player;
_dir 			= getDir player;
_currentAnim 	= animationState player;
_tagSetting = player getVariable["DZE_display_name",false];
_playerUID = getPlayerUID player;
_weapons 	= weapons player;
_countMags = call player_countMagazines; 
_magazines = _countMags select 0;
_Chernobyl = player getVariable["Chernobyl",0];

if ((_playerUID == dayz_playerUID) && (count _magazines == 0) && (count (magazines player) > 0 )) exitWith {cutText [(localize "str_epoch_player_17"), "PLAIN DOWN"]};

///////////////teste
disableuserinput true;disableuserinput true;disableuserinput true;
///////////////teste

_primweapon	= primaryWeapon player;
_secweapon	= secondaryWeapon player;

if(!(_primweapon in _weapons) && _primweapon != "") then {
	_weapons = _weapons + [_primweapon];
};

if(!(_secweapon in _weapons) && _secweapon != "") then {
	_weapons = _weapons + [_secweapon];
};

dayz_myBackpack = unitBackpack player;
_newBackpackType = (typeOf dayz_myBackpack);
if(_newBackpackType != "") then {
	_backpackWpn = getWeaponCargo unitBackpack player;
	_backpackMag = _countMags select 1;
};

_currentWpn = currentWeapon player;
_muzzles = getArray(configFile >> "cfgWeapons" >> _currentWpn >> "muzzles");
if (count _muzzles > 1) then {
	_currentWpn = currentMuzzle player;
};

player setPosATL dayz_spawnPos;

_oldUnit = player;
_oldGroup = group player;

_group = createGroup west;
_newUnit = _group createUnit [_class,dayz_spawnPos,[],0,"NONE"];
[_newUnit] joinSilent createGroup WEST;
_newUnit setPosATL _position;
_newUnit setDir _dir;
_newUnit setVariable ["Chernobyl",_Chernobyl,true];

{_newUnit removeMagazine _x;} count  magazines _newUnit;
removeAllWeapons _newUnit;	

{
	if (typeName _x == "ARRAY") then {if ((count _x) > 0) then {_newUnit addMagazine [(_x select 0), (_x select 1)]; }; } else { _newUnit addMagazine _x; };
} count _magazines;

{
	_newUnit addWeapon _x;
} count _weapons;

if(str(_weapons) != str(weapons _newUnit)) then {
	{
		_weapons = _weapons - [_x];
	} count (weapons _newUnit);
	
	{
		_newUnit addWeapon _x;
	} count _weapons;
};

if(_primweapon !=  (primaryWeapon _newUnit)) then {
	_newUnit addWeapon _primweapon;		
};
if (_primweapon == "MeleeCrowbar") then {
	_newUnit addMagazine 'crowbar_swing';
};
if (_primweapon == "MeleeSledge") then {
	_newUnit addMagazine 'sledge_swing';
};
if (_primweapon == "MeleeHatchet_DZE") then {
	_newUnit addMagazine 'Hatchet_Swing';
};
if (_primweapon == "MeleeMachete") then {
	_newUnit addMagazine 'Machete_swing';
};
if (_primweapon == "MeleeFishingPole") then {
	_newUnit addMagazine 'Fishing_Swing';
};

if(_secweapon != (secondaryWeapon _newUnit) && _secweapon != "") then {
	_newUnit addWeapon _secweapon;		
};
_switchUnit = {
	addSwitchableUnit _newUnit;
	setPlayable _newUnit;
	selectPlayer _newUnit;
	if ((count units _oldGroup > 1) && {!isNil "PVDZE_plr_LoginRecord"}) then {
  	  [_newUnit] join _oldGroup;
  	  if (count units _group < 1) then {deleteGroup _group;};
	};
	removeAllWeapons _oldUnit;
	{_oldUnit removeMagazine _x;} count  magazines _oldUnit;
	deleteVehicle _oldUnit;
	if(_currentWpn != "") then {_newUnit selectWeapon _currentWpn;};
};
if (!isNil "_newBackpackType") then {
	if (_newBackpackType != "") then {
		_newUnit addBackpack _newBackpackType;
		dayz_myBackpack = unitBackpack _newUnit;
		_backpackWpnTypes = [];
		_backpackWpnQtys = [];
		if (count _backpackWpn > 0) then {
			_backpackWpnTypes = _backpackWpn select 0;
			_backpackWpnQtys = _backpackWpn select 1;
		};
		[] call _switchUnit;
		if (gear_done) then {sleep 0.001;};
		["1"] call gearDialog_create;
		_countr = 0;
		{
			if ((typeName _x) != "STRING") then {
				_isWeapon = (isClass(configFile >> "CfgWeapons" >> (_x select 0)));
			} else {
				_isWeapon = (isClass(configFile >> "CfgWeapons" >> _x));
			};
			if (!_isWeapon) then {
				_countr = _countr + 1;
				if ((typeName _x) != "STRING") then {
					(unitBackpack player) addMagazineCargoGlobal [(_x select 0), 1];
					_idc = 4999 + _countr;
					_idc setIDCAmmoCount (_x select 1);
				} else {
					(unitBackpack player) addMagazineCargoGlobal [_x, 1];
				};
			};
		} count _backpackMag;
		(findDisplay 106) closeDisplay 0;
		_countr = 0;
		{
			(unitBackpack player) addWeaponCargoGlobal [_x,(_backpackWpnQtys select _countr)];
			_countr = _countr + 1;
		} count _backpackWpnTypes;
	} else { [] call _switchUnit; };
} else { [] call _switchUnit; };
[objNull, player, rSwitchMove,_currentAnim] call RE;
player disableConversation true;

if (_tagSetting) then {
	DZE_ForceNameTags = true;
};

_playerUID = getPlayerUID player;
_playerObjName = format["PVDZE_player%1",_playerUID];
call compile format["%1 = player;",_playerObjName];
publicVariableServer _playerObjName;

_wpnType = primaryWeapon player;
_ismelee = (gettext (configFile >> "CfgWeapons" >> _wpnType >> "melee"));
if (_ismelee == "true") then {
	call dayz_meleeMagazineCheck; 
};

{player reveal _x} count (nearestObjects [getPosATL player, dayz_reveal, 50]);
player setVariable ["Chernobyl",_Chernobyl,true];

///////////////teste
disableuserinput false;disableuserinput false;disableuserinput false;
///////////////teste