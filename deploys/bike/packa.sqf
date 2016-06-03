private ["_cursorTarget"];
player removeAction s_player_arvoro;
player playActionNow "Medic";
_cursorTarget = cursorTarget;
if (typeOf _cursorTarget in ["MAP_t_picea1s","MAP_t_picea2s"]) then {
    PVDZE_obj_Delete = [_cursorTarget getVariable["ObjectID","0"],_cursorTarget getVariable["ObjectUID","0"],player];
    publicVariableServer "PVDZE_obj_Delete";
	deletevehicle _cursorTarget;
	sleep 6;
	cutText [format["Arvore desmontada com sucesso."], "PLAIN DOWN"];
	player switchMove "";
	player playActionNow "stop";
};