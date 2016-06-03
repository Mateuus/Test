private ["_cnt","_locationPlayer","_evacFieldID","_checkForChopper","_evacCallerID","_evacCallerUID","_evacFields","_heliHRescue","_routeFinished","_evacZone","_chopperStartPos","_getChopperStartPos","_evacZoneDistance","_startZoneWaypoint","_evacZoneWaypoint","_part","_damage","_hitpoints","_evacChopperFuel","_finishMarker","_evacZonePos","_dayTime"];

player removeAction s_player_callEvacChopper;
s_player_callEvacChopper = 1;
actionMenu = false;

if (!playerHasEvacField) then { 
	_evacFields = PVDZE_EvacChopperFields;
	if ((count _evacFields) > 0) then {
		{
			_evacFieldID = _x getVariable ["CharacterID", "0"];
			if (_evacCallerID == _evacFieldID || _evacCallerUID == _evacFieldID) then {
				playerHasEvacField = true;
				playersEvacField = _x;
			};
		} forEach _evacFields;
	};
};

call_evac_itemsPlayer = items player;
call_evac_hasRadio = "ItemRadio" in call_evac_itemsPlayer;
if (evac_needRadio == 1) then {
	if (!call_evac_hasRadio) then {
	cutText [format["Calling a Evac-Chopper needs a Radio - You dont have it!"], "PLAIN"];
	s_player_callEvacChopper = -1;
	actionMenu = true;
	breakOut "exit";
	};
};

if (!playerHasEvacField) then {
	cutText [format["Voce nao tem um Evac-Chopper!\n\n(Voce precisa de %1 Briefcases para criar um Evac-Chopper, e um heli com chave)", evac_chopperPrice], "PLAIN"];
	cutText [format["Se ja tiver os itens, eh so deixar o heli no local desejado e clicar em criar Evac-Chopper)", evac_chopperPrice], "PLAIN"];
	s_player_callEvacChopper = -1;
	actionMenu = true;
	breakOut "exit";
};

_checkForChopper = nearestObjects [playersEvacField, evac_AllowedChoppers, 10];
if ((count _checkForChopper) > 0 && (player distance playersEvacField) <= evac_MinDistance) then {
	cutText [format["Para chamar Evac-Chopper precisa estar a mais de %1m do Evac-Field!", evac_MinDistance], "PLAIN"];
	s_player_callEvacChopper = -1;
	actionMenu = true;
	breakOut "exit";
};

_cnt = 5;
_locationPlayer = (([player] call ON_fnc_GetPos));
for "_p" from 1 to 5 do
{
	systemChat(format ["Chamando Evac-Chopper em %1s - Se mova para cancelar!",_cnt]);
	if (player distance _locationPlayer > 0.2) then {
		systemChat("Cancelado!");
		s_player_callEvacChopper = -1;
		actionMenu = true;
		breakOut "exit";
	};
	sleep 1;
	_cnt = _cnt - 1;
};
systemChat ("Procurando seu Evac-Chopper - Espere...");
sleep 5;

_evacCallerID = (player getVariable ["CharacterID","0"]);
_evacCallerUID = ([player] call ON_fnc_convertUID);

_checkForChopper = nearestObjects [playersEvacField, evac_AllowedChoppers, 10];
if ((count _checkForChopper) > 0) then {
	evacChopper = _checkForChopper select 0;
} else {
	systemChat ("Nao tem nenhum helicoptero em seu Evac-Field");
	s_player_callEvacChopper = -1;
	actionMenu = true;
	breakOut "exit";
};

systemChat("Seu Evac-Chopper foi encontrado - Checando Combustivel e Dano");
sleep 3;

_evacChopperFuel = fuel evacChopper;
if (_evacChopperFuel < 0.2) then {
	systemChat("Nao tem combustivel suficiente no Evac-Chopper para voar ate voce");
	systemChat("Deixe seu helicoptero cheio da proxima vez!");
	s_player_callEvacChopper = -1;
	actionMenu = true;
	breakOut "exit";
};

_hitpoints = evacChopper call vehicle_getHitpoints;
{			
	_damage = [evacChopper,_x] call object_getHit;
	if(["Engine",_x,false] call fnc_inString) then {
		_part = "PartEngine";
	};

	if(["HRotor",_x,false] call fnc_inString) then {
		_part = "PartVRotor";
	};

	if (_damage >= 1 && (_part == "PartEngine" || _part == "PartVRotor")) then {
		if(_part == "PartEngine") then {
			systemChat("O motor do Evac-Chopper esta muito danificado para voar");
			systemChat("Repare seu Evac-Chopper da proxima vez!");
		};
		if (_part == "PartVRotor") then {
			systemChat("O Main-Rotor do Evac-Chopper esta muito danificado para voar");
			systemChat("Repare seu Evac-Chopper da proxima vez!");
		};
		s_player_callEvacChopper = -1;
		actionMenu = true;
		breakOut "exit";
	};
} forEach _hitpoints;
sleep 2;

systemChat("Fuel and Damage check done - Your Evac-Chopper is starting");

if (evac_zoneMarker == 1) then {
	_heliHRescue = "SmokeshellGreen" createVehicle ([player] call ON_fnc_GetPos);
	_heliHRescue setPosATL (([player] call ON_fnc_GetPos));
} else {
	_heliHRescue = "HeliHRescue" createVehicle ([player] call ON_fnc_GetPos);
	_heliHRescue setDir (getDir player);
	_heliHRescue setPosATL (([player] call ON_fnc_GetPos));
};

evacZoneReached = false;
_routeFinished = false;

_evacZonePos = ([_heliHRescue] call ON_fnc_GetPos);
_evacZone = _evacZonePos;
_getChopperStartPos = ([evacChopper] call ON_fnc_GetPos);
_chopperStartPos = _getChopperStartPos;

evacChopper setVehicleLock "UNLOCKED";
evacChopperGroup = createGroup WEST;
evacChopperPilot = evacChopperGroup createUnit ["USMC_Soldier_pilot", evacChopper, [], 0,"LIEUTENANT"];
{[evacChopperPilot, _x, 1] call BIS_fnc_invRemove;}forEach items evacChopperPilot;
{[evacChopperPilot, _x, 1] call BIS_fnc_invRemove;}forEach magazines evacChopperPilot;
{[evacChopperPilot, _x, 1] call BIS_fnc_invRemove;}forEach weapons evacChopperPilot;
evacChopperPilot removeAllEventHandlers "HandleDamage";
evacChopperPilot addEventHandler ["HandleDamage", {false}];
evacChopperPilot allowDamage false;
evacChopperPilot assignAsDriver evacChopper;
evacChopperPilot moveInDriver evacChopper;
evacChopperPilot setSkill 1;
evacChopperGroup setBehaviour "CARELESS";
sleep 1;

evacChopper setVehicleLock "LOCKED";

evacChopper engineOn true;
evacChopper flyInHeight 200;

_startZoneWaypoint = evacChopperGroup addWaypoint [_chopperStartPos, 0];
_startZoneWaypoint setWaypointBehaviour "CARELESS";
_startZoneWaypoint setWaypointType "MOVE";
_startZoneWaypoint setWaypointCompletionRadius 5;
_startZoneWaypoint setWaypointSpeed "FULL";
_evacZoneWaypoint = evacChopperGroup addWaypoint [_evacZone, 0];
_evacZoneWaypoint setWaypointBehaviour "CARELESS";
_evacZoneWaypoint setWaypointType "MOVE";
_evacZoneWaypoint setWaypointCompletionRadius 5;
_evacZoneWaypoint setWaypointSpeed  "FULL" ;
_evacZoneWaypoint setWaypointStatements ["true", "evacZoneReached = true; evacChopper land 'LAND';"];
_evacZoneWaypoint setWaypointCombatMode "BLUE";

while {sleep 0.5; alive player && !_routeFinished && alive evacChopper} do {
	if (!evacZoneReached) then {
		_evacZoneDistance = format["%1m", round (evacChopper distance _evacZone)];
	} else {
		if ((([evacChopper] call ON_fnc_GetPos) select 2) < 1) then {
			waitUntil {sleep 0.1;!isEngineOn evacChopper};
			_routeFinished = true;
			_evacZoneDistance = "!!! ARRIVED !!!";
			_evacZoneWaypoint = evacChopperGroup addWaypoint [_evacZone, 0];
			_evacZoneWaypoint setWaypointType "GETOUT";
		} else {
			_evacZoneDistance = format["%1m", round (evacChopper distance _evacZone)];
		};
	};
	hintSilent parseText format ["
		<t size='1.15'	font='Bitstream'align='center' 	color='#5882FA'>EVAC-Chopper</t>			<br/>
		<t size='1'		font='Bitstream'align='center' 	color='#00FF00'>----------------------</t>	<br/>
		<t size='1'		font='Bitstream'align='left' 	color='#FFBF00'>Altura:</t>				<t size='1'		font='Bitstream'align='right'>%1</t><br/>
		<t size='1'		font='Bitstream'align='left' 	color='#FFBF00'>Velocidade:</t>				<t size='1'		font='Bitstream'align='right'>%2</t><br/>
		<t size='1'		font='Bitstream'align='left' 	color='#FFBF00'>Distancia:</t>				<t size='1'		font='Bitstream'align='right'>%3</t><br/>",
		(round (([evacChopper] call ON_fnc_GetPos) select 2)), (round (speed evacChopper)), _evacZoneDistance
	];
};

if (!alive evacChopper) then {
	{deleteWaypoint _x} forEach waypoints evacChopperGroup;
	deleteVehicle evacChopperPilot;
	waitUntil{sleep 5; count units group evacChopperPilot == 0};
	deleteGroup evacChopperGroup;
	deleteVehicle _heliHRescue;
	hintSilent parseText format ["
		<t size='1.15'	font='Bitstream'align='center' 	color='#5882FA'>EVAC-Chopper</t>			<br/>
		<t size='1'		font='Bitstream'align='center' 	color='#00FF00'>----------------------</t>	<br/>
		<t size='1.15'	font='Bitstream'align='center' 	color='#FFBF00'>!!! Derrubado !!!</t>			<br/>"
	];
	s_player_callEvacChopper = -1;
	actionMenu = true;
	breakOut "exit";
};

if (!alive player) then {
	deleteVehicle _heliHRescue;
	evacChopper engineOn false;
	evacChopper setPosATL _chopperStartPos;
	evacChopper setVelocity [0,0,0.01];
	{deleteWaypoint _x} forEach waypoints evacChopperGroup;
	_evacZoneWaypoint = evacChopperGroup addWaypoint [_chopperStartPos, 0];
	_evacZoneWaypoint setWaypointType "GETOUT";
	waitUntil{sleep 0.1;{_x in evacChopper} count units group evacChopperPilot == 0};
	{deleteWaypoint _x} forEach waypoints evacChopperGroup;
	deleteVehicle evacChopperPilot;
	waitUntil{sleep 5; count units group evacChopperPilot == 0};
	deleteGroup evacChopperGroup;
	evacChopper setVehicleLock "LOCKED";
	s_player_callEvacChopper = -1;
	actionMenu = true;
	breakOut "exit";
};

_dayTime = dayTime;
if (_dayTime > 6 && _dayTime < 18.5) then {
	_finishMarker = "SmokeShellGreen" createVehicle ([evacChopper] call ON_fnc_GetPos);
	_finishMarker setPosATL ([evacChopper] call ON_fnc_GetPos);
	_finishMarker attachTo [evacChopper,[0,0,0]];
};
if (_dayTime > 18.5 && _dayTime < 6) then {
	_finishMarker = "ARTY_Flare_Medium" createVehicle ([evacChopper] call ON_fnc_GetPos);
	_finishMarker setPosATL ([evacChopper] call ON_fnc_GetPos);
	_finishMarker attachTo [evacChopper, [0,0,0]];
};

waitUntil{sleep 0.1;{_x in evacChopper} count units group evacChopperPilot == 0};
{deleteWaypoint _x} forEach waypoints evacChopperGroup;
deleteVehicle evacChopperPilot;

waitUntil{sleep 0.5; count units group evacChopperPilot == 0};
deleteGroup evacChopperGroup;

deleteVehicle _heliHRescue;

waitUntil {sleep 1; (player distance evacChopper) < 10 || !alive player || !alive evacChopper};

if (!alive player) then {
	deleteVehicle _finishMarker;
	deleteVehicle _heliHRescue;
	evacChopper setPosATL _chopperStartPos;
	evacChopper setVelocity [0,0,0.01];
	{deleteWaypoint _x} forEach waypoints evacChopperGroup;
	_evacZoneWaypoint = evacChopperGroup addWaypoint [_chopperStartPos, 0];
	_evacZoneWaypoint setWaypointType "GETOUT";
	waitUntil{sleep 0.1;{_x in evacChopper} count units group evacChopperPilot == 0};
	{deleteWaypoint _x} forEach waypoints evacChopperGroup;
	deleteVehicle evacChopperPilot;
	waitUntil{sleep 5; count units group evacChopperPilot == 0};
	deleteGroup evacChopperGroup;
	evacChopper setVehicleLock "LOCKED";
	s_player_callEvacChopper = -1;
	actionMenu = true;
	breakOut "exit";
};

systemChat("Dono detectado - ACESSO GARANTIDO!");
evacChopper setVehicleLock "UNLOCKED";

deleteVehicle _finishMarker;

s_player_callEvacChopper = -1;
actionMenu = true;