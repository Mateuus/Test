private["_vehicle"];
_vehicle = _this select 3;

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_37") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

{player removeAction _x} count s_player_lockunlock;s_player_lockunlock = [];
s_player_lockUnlock_crtl = 1;

PVDZE_veh_Lock = [_vehicle,true];
if(player distance _vehicle < 10) then {
	if (local _vehicle) then {
		PVDZE_veh_Lock spawn local_lockUnlock
	} else {
		publicVariable "PVDZE_veh_Lock";
	};
		player action ["lightOn", _vehicle];
		_nul = [objNull, _vehicle, rSAY, "carLock", 5] call RE;
		sleep 0.2;
		player action ["lightOff", _vehicle];
		sleep 0.1;
		player action ["lightOn", _vehicle];
		sleep 0.2;
		player action ["lightOff", _vehicle];
};

s_player_lockUnlock_crtl = -1;
DZE_ActionInProgress = false;