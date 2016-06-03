private["_bp", "_wpns", "_primary", "_num", "_primaryIsRifle", "_targetIsRifle", "_tmax_EZ_compare_arrays"];

tmax_wpn_arr = [[], []];
tmax_actions_in_use = 0;
tmax_fnc_clearActions = {
	{
		player removeAction _x;
	} forEach (tmax_wpn_arr select 1);
	tmax_wpn_arr set [0, []];
	tmax_wpn_arr set [1, []];
	tmax_actions_in_use = 0;
};

_tmax_EZ_compare_arrays = {
	private ["_arr1", "_arr2"];
	_arr1 = _this select 0;
	_arr2 = _this select 1;
	count (_arr1 - _arr2) == 0;
};

while {true} do {
	_bp = unitBackpack player;
	
	if (!isNull _bp) then {
		_wpns = getWeaponCargo _bp;
		if (count (_wpns select 0) != 0) then {
			_primary = primaryWeapon player;
			{
				_primaryIsRifle = (getNumber(configFile >> "cfgWeapons" >> _primary >> "type") == 1);
				_targetIsRifle = (getNumber(configFile >> "cfgWeapons" >> _x >> "type") == 1);
				if ( _primaryIsRifle && _targetIsRifle && _x != _primary && !(_x in (tmax_wpn_arr select 0))) then {
					tmax_actions_in_use = 1;
					
					_num = player addAction [format [("<t color=""#5882FA"">" + ("[Tirar da Bag]: ") +"</t>" + "%1"), getText(configFile >> "cfgWeapons" >> _x >> "displayName")], "custom\switch\switch_weapon.sqf", [_primary, _x], -9, false];
					
					
					tmax_wpn_arr set [0, (tmax_wpn_arr select 0) + [_x]];
					tmax_wpn_arr set [1, (tmax_wpn_arr select 1) + [_num]];
				};
			} forEach (_wpns select 0);
			waitUntil { tmax_actions_in_use == 0 || _bp != unitBackpack player || _primary != primaryWeapon player || !([_wpns select 0, (getWeaponCargo _bp) select 0] call _tmax_EZ_compare_arrays) || !([_wpns select 1, (getWeaponCargo _bp) select 1] call _tmax_EZ_compare_arrays) };
			[] call tmax_fnc_clearActions;
		};
	};
	sleep 0.5;
};