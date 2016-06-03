private ["_ct"];

if (isServer || isDedicated) exitWith {};
if (count _this != 1) exitWith {};


ELE_PlatformClass = "MetalFloor_DZ";
ELE_Size = 4; 
ELE_UpdatesPerSecond = 60;
ELE_Debug = false;

ELE_elevator = nil;

call compile preprocessFileLineNumbers ("elevator\vector.sqf");
call compile preprocessFileLineNumbers ("elevator\ac_functions.sqf");
call compile preprocessFileLineNumbers ("elevator\elevator_functions.sqf");

while {true} do {
	_ct = cursorTarget;
	if ((!isNull _ct) && {(player distance _ct) < ELE_Size}) then {
		if (typeOf _ct == ELE_PlatformClass) then {
			if ([_ct] call ELE_fnc_isElevator) then {
				if (s_player_elevator_next < 0 && {[_ct] call ELE_fnc_hasNextStop}) then {
					s_player_elevator_next = player addAction ["<t color=""#ffffff"">Elevador: Proxima parada</t>", "elevator\elevator_actions.sqf", ["next",_ct], 5, false];
				};
				if (s_player_elevator_previous < 0 && {[_ct] call ELE_fnc_hasPreviousStop}) then {
					s_player_elevator_previous = player addAction ["<t color=""#ffffff"">Elevador: Parada anterior</t>", "elevator\elevator_actions.sqf", ["previous",_ct], 5, false];
				};
				if (s_player_elevator_select < 0) then {
					s_player_elevator_select = player addAction ["<t color=""#ffffff"">Selecionar elevador</t>", "elevator\elevator_actions.sqf", ["select",_ct], 1, false];
				};
			} else {
				if (s_player_elevator_upgrade < 0) then {
					s_player_elevator_upgrade = player addAction ["<t color=""#ffffff"">Criar Elevador</t>", "elevator\elevator_build.sqf", ["build",_ct], 0, false];
				};
				if (s_player_elevator_upgrade_stop < 0) then {
					s_player_elevator_upgrade_stop = player addAction ["<t color=""#ffffff"">Criar parada do Elevador</t>", "elevator\elevator_build.sqf", ["build_stop",_ct], 0, false];
				};
			};
		};
		if ([_ct] call ELE_fnc_isElevatorStop) then {
			if (s_player_elevator_call < 0) then {
				s_player_elevator_call = player addAction ["<t color=""#ffffff"">Chamar Elevador</t>", "elevator\elevator_actions.sqf", ["call",_ct], 5, false];
			};
		};
		if (s_player_elevator_id < 0 && ELE_Debug) then {
			s_player_elevator_id = player addAction ["<t color=""#ddffffff"">Show Elevator ID</t>", "elevator\elevator_actions.sqf", ["id",_ct], 0, false];
		};
	} else {
		player removeAction s_player_elevator_next;
		s_player_elevator_next = -1;
		player removeAction s_player_elevator_previous;
		s_player_elevator_previous = -1;
		player removeAction s_player_elevator_select;
		s_player_elevator_select = -1;
		player removeAction s_player_elevator_upgrade;
		s_player_elevator_upgrade = -1;
		player removeAction s_player_elevator_upgrade_stop;
		s_player_elevator_upgrade_stop = -1;
		player removeAction s_player_elevator_call;
		s_player_elevator_call = -1;
		player removeAction s_player_elevator_id;
		s_player_elevator_id = -1;
	};
	sleep 1;
};
