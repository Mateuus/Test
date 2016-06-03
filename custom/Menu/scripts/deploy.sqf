private ["_finished","_finishedTime","_bikera","_bikeras","_posplr","_display","_dirplr","_object"];
disableSerialization;
_display = findDisplay 106;
if(!(isNull _display)) then {
    _display closeDisplay 0;
};
if (dayz_combat == 1) exitWith {
    cutText [format["Nao pode construir a bike em combate."], "PLAIN DOWN"];
};
if ("ItemToolbox" in weapons Player) then {
	player removeWeapon "ItemToolbox";
	closeDialog 845167;

	player playActionNow "Medic";
	[player,"repair",0,false,10] call dayz_zombieSpeak;
	[player,10,true,(getPosATL player)] spawn player_alertZombies;
	closeDialog 845167;
	
	r_doLoop = true;

	_finished = false;
	_finishedTime = diag_tickTime+3;
	while {r_doLoop} do {
		if (diag_tickTime >= _finishedTime) then {
			r_doLoop = false;
			_finished = true;
		};
	};
	if (_finished) then {
		_posplr = [((getPos player) select 0) + 2, ((getPos player) select 1) + 2, 0];

		_object = "MMT_Civ" createVehicle (_posplr);
		_object setVariable ["ObjectID", "1", true];
		_object setVariable ["ObjectUID", "1", true];

		player reveal _object;

		cutText [format["Voce construiu uma bike com sua toolbox."], "PLAIN DOWN"];
		sleep 10;
		cutText [format["Aviso: Bicicletas somem com o restart!"], "PLAIN DOWN"];
	};
} else {
cutText [format["Voce esta sem toolbox"], "PLAIN DOWN"];
};
