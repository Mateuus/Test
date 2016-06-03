disableSerialization;

private ["_oldWpn", "_newWpn", "_backpack", "_wpnDump", "_cnt", "_muzzles", "_num", "_obj"];

[] call tmax_fnc_clearActions;

if (DZE_ActionInProgress) exitWith {cutText ["Ocupado...", "PLAIN DOWN"];};

_obj = nearestObjects [position player, AllPlayers, 3];
_cnt = 0;
{
	if (alive _x) then { _cnt = _cnt + 1; };
} forEach _obj;

if (_cnt > 1) exitWith {cutText ["Voce nao pode trocar de arma se outro jogador estiver perto", "PLAIN DOWN"];};

_oldWpn = (_this select 3) select 0; 
_newWpn = (_this select 3) select 1;
_backpack = unitbackpack player;
_wpnDump = getWeaponCargo _backpack;

if (!(_newWpn in (_wpnDump select 0))) exitWith {cutText ["Esta arma nao esta na Bag", "PLAIN DOWN"];};

DZE_ActionInProgress = true;
player setVariable ["tmax_weapons", [_oldWpn] + (_wpnDump select 0), true];

_num = (_wpnDump select 0) find _oldWpn;
if (_num >= 0) then {
	_numberArray = _wpnDump select 1;
	_numberArray set [_num, (_numberArray select _num) + 1];
	_wpnDump set [1, _numberArray];
}
else
{
	_wpnDump set [0, (_wpnDump select 0) + [_oldWpn]];
	_wpnDump set [1, (_wpnDump select 1) + [1]];
};
_num = (_wpnDump select 0) find _newWpn;
_numberArray = _wpnDump select 1;
if (_numberArray select _num > 1) then {
	_numberArray set [_num, (_numberArray select _num) - 1];
	_wpnDump set [1, _numberArray];
}
else
{
	_numberArray set [_num, 0];
	_wpnDump set [1, _numberArray];
};

clearWeaponCargoGlobal _backpack;

{
	_cnt = (_wpnDump select 1) select _forEachIndex;
	if (_cnt > 0) then {
		_backpack addWeaponCargoGlobal [_x, _cnt];
	};
} forEach (_wpnDump select 0);

player removeWeapon _oldWpn;
player playAction "PutDown";
playsound format ["z_open_backpack_%1", floor (random 5)];

sleep 1;

player addWeapon _newWpn;
_muzzles = getArray(configFile >> "cfgWeapons" >> _newWpn >> "muzzles"); 
if (count _muzzles > 1) then {
	player selectWeapon (_muzzles select 0);
}
else {
	player selectWeapon _newWpn;
};

call dayz_forceSave;
DZE_ActionInProgress = false;

sleep 2;
player setVariable ["tmax_weapons", [], true];