private ["_cnt","_locationPlayer","_objectID","_objectUID","_dis","_sfx","_animState","_loop","_started","_finished","_isMedic"];

player removeAction s_player_clearEvacChopper;
s_player_clearEvacChopper = 1;

systemChat("AVISO! Evac-Chopper sera removido!");
sleep 2;
_cnt = 10;
_locationPlayer = (([player] call ON_fnc_GetPos));
for "_p" from 1 to 10 do
{
	systemChat(format ["AVISO! Evac-Chopper sera removido em %1s - SEM REEMBOLSOS! - Se mova para cancelar!!",_cnt]);
	if (player distance _locationPlayer > 0.2) then {
		systemChat("Remover Evac-Chopper cancelado");
		s_player_clearEvacChopper = -1;
		breakOut "exit";
	};
	sleep 1;
	_cnt = _cnt - 1;
};

[1,1] call dayz_HungerThirst;
player playActionNow "Medic";

_dis = 20;
_sfx = "repair";
[player,_sfx,0,false,_dis] call dayz_zombieSpeak;  
[player,_dis,true,(getPosATL player)] spawn player_alertZombies;

_animState = animationState player;
_loop = true;
_started = false;
_finished = false;

while {_loop} do {
	_animState = animationState player;
	_isMedic = ["medic",_animState] call fnc_inString;
	if (_isMedic) then {
		_started = true;
	};
	if (_loop) then {
		cutText["~~ Removendo Evac-Chopper ~~\n~~ Espere por favor ~~","PLAIN",0.5];
	};
	if (_started && !_isMedic) then {
		_loop = false;
		_finished = true;
	};
	sleep 1;
};

if (_finished) then {
	_objectID = playersEvacField getVariable["ObjectID","0"];
	_objectUID = playersEvacField getVariable["ObjectUID","0"];
	PVDZE_obj_Delete = [_objectID,_objectUID,player];
	publicVariableServer "PVDZE_obj_Delete";
	deleteVehicle playersEvacField;
	PVDZE_EvacChopperFieldsUpdate = ["rem",playersEvacField];
	publicVariableServer "PVDZE_EvacChopperFieldsUpdate";
	playerHasEvacField = false;
	playersEvacField = nil;
	cutText["~~ Remover Evac-Chopper - OK ~~","PLAIN",1];
};

s_player_clearEvacChopper = -1;