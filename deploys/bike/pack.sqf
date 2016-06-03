private ["_cursorTarget","_sfx","_dis"];
player removeAction s_player_packbike;
_dis=20;
_sfx = "repair";
[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
player playActionNow "Medic";
_cursorTarget = cursorTarget;
if (typeOf _cursorTarget in ["MMT_Civ"]) then {
	deletevehicle _cursorTarget;
	player addWeapon "ItemToolbox";
	sleep 6;
	cutText [format["Sua Bike foi guardada com sucesso."], "PLAIN DOWN"];
	player switchMove "";
	player playActionNow "stop";
};