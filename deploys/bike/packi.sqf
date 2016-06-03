private ["_cursorTarget"];
player removeAction s_player_infeite;
player playActionNow "Medic";
_cursorTarget = cursorTarget;
if (typeOf _cursorTarget in ["ASC_EU_BulbBLUP","ASC_EU_BulbPURP","ASC_EU_BulbPURB","ASC_runway_YellowlightB","LAND_ASC_runway_Yellowlight","ASC_EU_BulbYELB","ASC_EU_BulbGRNB","LAND_ASC_runway_Bluelight","ASC_runway_BluelightB","ASC_EU_BulbYELP","ASC_EU_BulbGRNP","ASC_EU_BulbREDP","ASC_EU_BulbREDB","ASC_EU_BulbWHTB","ASC_EU_BulbBLUB"]) then {
	PVDZE_obj_Delete = [_cursorTarget getVariable["ObjectID","0"],_cursorTarget getVariable["ObjectUID","0"],player];
    publicVariableServer "PVDZE_obj_Delete";
	deletevehicle _cursorTarget;
	sleep 6;
	cutText [format["infeite desmontado com sucesso."], "PLAIN DOWN"];
	player switchMove "";
	player playActionNow "stop";
};