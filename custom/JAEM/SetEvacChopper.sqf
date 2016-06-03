private ["_allNearRescueFields","_locationPlayer","_cnt","_objectID","_objectUID","_targetVehicle","_playerUID","_magazinesPlayer","_hasBriefcase","_location","_dir","_object","_dis","_sfx","_animState","_loop","_started","_finished","_isMedic"];

player removeAction s_player_changeEvacChopper;
s_player_changeEvacChopper = 1;
player removeAction s_player_createEvacChopper;
s_player_createEvacChopper = 1;
actionMenu = false;

_allNearRescueFields = (nearestObjects [player,["HeliHRescue","HeliHCivil","HeliHEmpty"],50]);
if (count _allNearRescueFields > 0) then {
	{
		if (((_x getVariable["ObjectID","0"]) == "0") && ((_x getVariable["ObjectUID","0"]) == "0")) then {
			systemChat ("Voce nao pode construir um Evac-Chopper perto de um sinal de resgate que esta no mapa ou em uma trade city!");
			systemChat ("Fique a menos de 50m se for criar ou mudar um Evac-Chopper!");
			s_player_changeEvacChopper = -1;
			s_player_createEvacChopper = -1;
			actionMenu = true;
			breakOut "exit";
		};
	} forEach _allNearRescueFields;
};

_targetVehicle = _this select 3;
_location = ([_targetVehicle] call ON_fnc_GetPos);
_dir = getDir _targetVehicle;
_playerUID = ([player] call ON_fnc_convertUID);
_magazinesPlayer = magazines player;

if ((_location) select 2 >= 3) then {
	systemChat("Evac-Chopper precisa estar na terra");
	systemChat("Certifique se que voce nao esta em um edificio ou em um objeto construido!");
	s_player_changeEvacChopper = -1;
	s_player_createEvacChopper = -1;
	actionMenu = true;
	breakOut "exit";
};

_hasBriefcase = {_x == "ItemBriefcase100oz"} count _magazinesPlayer;
if (_hasBriefcase < evac_chopperPrice) then {
	if (playerHasEvacField) then {
		systemChat(format["Mudando Evac-Chopper... ira custar %1 Briefcases... Voce nao tem!", evac_chopperPrice]);
	} else {
		systemChat(format["Criando um Evac-Chopper... ira custar %1 Briefcases... Voce nao tem!", evac_chopperPrice]);
	};
	s_player_changeEvacChopper = -1;
	s_player_createEvacChopper = -1;
	actionMenu = true;
	breakOut "exit";
};

if (playerHasEvacField) then {
	systemChat("AVISO! Evac-Choppers precisam de visao livre para todos os lados");
	sleep 2;
	systemChat("AVISO! Tenha certeza de nao ter arvores ou construções por perto!");
	sleep 2;
	_cnt = 10;
	_locationPlayer = (([player] call ON_fnc_GetPos));
	for "_p" from 1 to 10 do
	{
		systemChat(format ["Trocando Evac-Chopper comeca em %1s - Se mova para cancelar",_cnt]);
		if (player distance _locationPlayer > 0.2) then {
			systemChat("Troca do Evac-Chopper cancelado");
			s_player_changeEvacChopper = -1;
			actionMenu = true;
			breakOut "exit";
		};
		sleep 1;
		_cnt = _cnt - 1;
	};
};

if (!playerHasEvacField) then {
	systemChat("AVISO! Evac-Choppers precisam de visao livre para todos os lados");
	sleep 2;
	systemChat("AVISO! Tenha certeza de nao ter arvores ou construções por perto!");
	sleep 2;
	_cnt = 10;
	_locationPlayer = (([player] call ON_fnc_GetPos));
	for "_i" from 1 to 10 do
	{
		systemChat(format ["Construcao do Evac-Chopper comeca em %1s - Se mova para cancelar",_cnt]);
		if (player distance _locationPlayer > 0.2) then {
			systemChat("Creating of Evac-Chopper canceled");
			s_player_createEvacChopper = -1;
			actionMenu = true;
			breakOut "exit";
		};
		sleep 1;
		_cnt = _cnt - 1;
	};
};

_magazinesPlayer = magazines player;
_hasBriefcase = {_x == "ItemBriefcase100oz"} count _magazinesPlayer;
if (_hasBriefcase < evac_chopperPrice) then {
	if (playerHasEvacField) then {
		systemChat(format["Mudando Evac-Chopper... ira custar %1 Briefcases... Voce nao tem!", evac_chopperPrice]);
	} else {
		systemChat(format["Criando Evac-Chopper... ira custar %1 Briefcases... Voce nao tem!", evac_chopperPrice]);
	};
	s_player_changeEvacChopper = -1;
	s_player_createEvacChopper = -1;
	actionMenu = true;
	breakOut "exit";
} else {
	[player, "ItemBriefcase100oz", evac_chopperPrice] call BIS_fnc_invRemove;
	if (playerHasEvacField) then {
		systemChat(format["Mudando Evac-Chopper... ira custar %1 Briefcases... Obrigado pelo pagamento!", evac_chopperPrice]);
	} else {
		systemChat(format["Criando Evac-Chopper... ira custar %1 Briefcases... Obrigado pelo pagamento!", evac_chopperPrice]);
	};
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
	if (_loop && playerHasEvacField) then {
		cutText["~~ Trocando Evac-Chopper ~~\n~~ Espere por favor ~~","PLAIN",0.5];
	};
	if (_loop && !playerHasEvacField) then {
		cutText["~~ Criando Evac-Chopper ~~\n~~ Espere por favor ~~","PLAIN",0.5];
	};
	if (_started && !_isMedic) then {
		_loop = false;
		_finished = true;
	};
	sleep 1;
};

if (_finished) then {
	if (playerHasEvacField) then {
		_objectID = playersEvacField getVariable["ObjectID","0"];
		_objectUID = playersEvacField getVariable["ObjectUID","0"];
		PVDZE_obj_Delete = [_objectID,_objectUID,player];
		publicVariableServer "PVDZE_obj_Delete";
		PVDZE_EvacChopperFieldsUpdate = ["rem",playersEvacField];
		publicVariableServer "PVDZE_EvacChopperFieldsUpdate";
		deleteVehicle playersEvacField;
		playerHasEvacField = false;
		playersEvacField = nil;
		cutText["~~ Troca de Evac-Chopper - OK ~~","PLAIN",1];
	};
	if (!playerHasEvacField) then {
		_object = createVehicle ["HeliHRescue", _location, [], 0, "CAN_COLLIDE"];
		_object addEventHandler ["HandleDamage", {false}];
		_object enableSimulation false;
		_object setDir _dir;
		_object setPosATL _location;
		player reveal _object;
		_object setVariable ["CharacterID",_playerUID,true];
		_object setVariable ["Classname", "HeliHRescue",true];
		PVDZE_obj_Publish = [_playerUID,_object,[_dir,_location],"HeliHRescue"];
		publicVariableServer "PVDZE_obj_Publish";
		PVDZE_EvacChopperFieldsUpdate = ["add",_object];
		publicVariableServer "PVDZE_EvacChopperFieldsUpdate";
		playerHasEvacField = true;
		playersEvacField = _object;
		cutText["~~ Criando Evac-Chopper - OK ~~","PLAIN",1];
	};
};

s_player_changeEvacChopper = -1;
s_player_createEvacChopper = -1;
actionMenu = true;