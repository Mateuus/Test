if (isServer) then {
	"cad_pvar_set_veh" addPublicVariableEventHandler {
		private ["_veh","_godOn"];
		_veh = _this select 1 select 0;
		_godOn = _this select 1 select 1;
		if (_godOn) then {
			_veh allowDamage false;
			_veh RemoveAllEventHandlers "handleDamage";
			_veh addEventHandler ["handleDamage",{0}];
		} else {
			_veh allowDamage true;
			_veh RemoveAllEventHandlers "handleDamage";
			_veh addEventHandler ["handleDamage",{_this call vehicle_handleDamage;}];
		};
	};
};
local_lockUnlock = {
	private ["_vehicle","_status","_canbuild"];
	_vehicle = _this select 0;
	_status = _this select 1;
	_canbuild = _this select 2;

	if (local _vehicle || isServer) then {
		if(_status) then {
			_vehicle setVehicleLock "LOCKED";
			if (count (crew _vehicle) == 0 && _vehicle isKindOf "Air") then{
				_vehicle allowDamage false;
				_vehicle RemoveAllEventHandlers "handleDamage";
				_vehicle addEventHandler ["handleDamage",{0}];
				cad_pvar_set_veh = [_vehicle,true];
				publicVariableServer "cad_pvar_set_veh";
			};

		} else {
			_vehicle setVehicleLock "UNLOCKED";
			if (_canbuild && _vehicle isKindOf "Air") then {
				_vehicle allowDamage true;
				_vehicle RemoveAllEventHandlers "handleDamage";
				_vehicle addEventHandler ["handleDamage",{_this call vehicle_handleDamage;}];
				cad_pvar_set_veh = [_vehicle,false];
				publicVariableServer "cad_pvar_set_veh";
			};
		};
	};
};