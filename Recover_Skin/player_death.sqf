private ["_display","_camera","_camDistance","_body","_playerID","_array","_source","_method","_canHitFree","_isBandit","_punishment","_humanityHit","_myKills","_humanity","_kills","_killsV","_myGroup"];
disableSerialization;
if (deathHandled) exitWith {};
deathHandled = true;
if ((alive player) && {isNil {dayz_playerName}}) then {
	dayz_playerName = name player;
};
_display = findDisplay 49;
if(!isNull _display) then {_display closeDisplay 0;};
if (dialog) then {closeDialog 0;};
if (visibleMap) then {openMap false;};

_body = player;
_playerID = getPlayerUID player;

disableUserInput true;

_infected = 0;
if (r_player_infected && DZE_PlayerZed) then {
	_infected = 1;
};
PVDZE_plr_Died = [dayz_characterID,0,_body,_playerID,_infected, dayz_playerName];
publicVariableServer "PVDZE_plr_Died";

_id = [player,20,true,getPosATL player] call player_alertZombies;

sleep 0.5;

player setDamage 1;

player setVariable ["NORRN_unconscious", false, true];
player setVariable ["unconsciousTime", 0, true];
player setVariable ["USEC_isCardiac",false,true];
player setVariable ["medForceUpdate",true,true];
player setVariable ["startcombattimer", 0];
r_player_unconscious = false;
r_player_cardiac = false;

_array = _this;
if (count _array > 0) then {
	_source = _array select 0;
	_method = _array select 1;
	if ((!isNull _source) && (_source != player)) then {
		_canHitFree = player getVariable ["freeTarget",false];
		_isBandit = (player getVariable["humanity",0]) <= -2000;
		_punishment = _canHitFree || _isBandit;
		_humanityHit = 0;
		if (!_punishment) then {
			_myKills = ((player getVariable ["humanKills",0]) / 30) * 1000;
			_humanityHit = -(2000 - _myKills);
			_kills = _source getVariable ["humanKills",0];
			_source setVariable ["humanKills",(_kills + 1),true];
			PVDZE_send = [_source,"Humanity",[_source,_humanityHit,300]];
			publicVariableServer "PVDZE_send";
		} else {
			_killsV = _source getVariable ["banditKills",0];
			_source setVariable ["banditKills",(_killsV + 1),true];
		};
	};
	_body setVariable ["deathType",_method,true];
};

terminate dayz_musicH;
terminate dayz_slowCheck;
terminate dayz_animalCheck;
terminate dayz_monitor1;
terminate dayz_medicalH;
terminate dayz_gui;

r_player_dead = true;

1 cutRsc ["creditz","PLAIN DOWN",3];

playsound "emorreu";

_camDistance = 15;
showCinemaBorder true;
camUseNVG false;
_camera = "camera" camCreate [(position player select 0), position player select 1,(position player select 2)];
_camera cameraEffect ["internal","back"];
_camera camSetFOV 2.000;
_camera camCommit 0;
waitUntil {camCommitted _camera};
_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,15];
_camera camCommit 8;
sleep 0.1;
waitUntil {camCommitted _camera};
_camera cameraEffect ["terminate","back"];
camDestroy _camera;

"dynamicBlur" ppEffectEnable true;"dynamicBlur" ppEffectAdjust [4]; "dynamicBlur" ppEffectCommit 0.2;

"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.01],  [1, 1, 1, 0.0]];
"colorCorrections" ppEffectCommit 1;

call compile preprocessFileLineNumbers "Recover_Skin\Recoverskin.sqf";

1 cutRsc ["DeathScreen","BLACK OUT",3];

sleep 1;

dayz_originalPlayer enableSimulation true;

addSwitchableUnit dayz_originalPlayer;
setPlayable dayz_originalPlayer;
selectPlayer dayz_originalPlayer;

_body setVariable["combattimeout", 0, true];

1 fadeSound 0;

"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5;
"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5;

sleep 2;

for  "_x" from 5 to 1 step -1 do {
	titleText [format[localize "str_return_lobby", _x], "PLAIN DOWN", 1];
	sleep 1;
};

PVDZE_Server_Simulation = [_body, false];
publicVariableServer "PVDZE_Server_Simulation";

endMission "END1";
