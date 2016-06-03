private ["_vehicle","_args","_servicePoint","_costs","_repairTime","_type","_name","_hitpoints","_allRepaired","_textMissing"];

_vehicle = _this select 0;
if (!local _vehicle) exitWith { diag_log format["Error: called service_point_repair.sqf with non-local vehicle: %1", _vehicle] };

_args = _this select 3;
_servicePoint = _args select 0;
_costs = _args select 1;
_repairTime = _args select 2;

if !([ player,_costs select 1] call SC_fnc_removeCoins) then {
	_repair_cost = _costs select 1;
	cutText [format["Voce precisa de %1 coins",_repair_cost,CurrencyName] , "PLAIN DOWN"];
} else {

	_type = typeOf _vehicle;
	_name = getText(configFile >> "cfgVehicles" >> _type >> "displayName");
	
	_vehicle engineOn false;
	[_vehicle,"repair",0,false] call dayz_zombieSpeak;
	
	_hitpoints = _vehicle call vehicle_getHitpoints;
	_allRepaired = true;
	{
		private ["_damage","_selection"];
		if ((vehicle player != _vehicle) || (!local _vehicle) || ([0,0,0] distance (velocity _vehicle) > 1)) exitWith {
			_allRepaired = false;
			titleText [format["Reparo do %1 parou", _name], "PLAIN DOWN"];
		};
		_damage = [_vehicle,_x] call object_getHit;
		if (_damage > 0) then {
			if (_repairTime > 0) then {
				private "_partName";
				_partName = toArray _x;
				_partName set [0,20];
				_partName set [1,45];
				_partName set [2,20];
				_partName = toString _partName;
				titleText [format["Reparando %1 ...", _partName], "PLAIN DOWN", _repairTime];
				sleep _repairTime;
			};
			_selection = getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> _x >> "name");
			[_vehicle,_selection,0] call object_setFixServer;
		};
	} forEach _hitpoints;
	
	if (_allRepaired) then {
		_vehicle setDamage 0;
		_vehicle setVelocity [0,0,1];
		titleText [format["%1 Reparado", _name], "PLAIN DOWN"];
	};
};