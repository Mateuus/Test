player removeAction act4;
player forceWalk false;
_newCiv = cursorTarget;
_dist = player distance _newCiv;
_newCiv setVariable ["Detain",0,true];
sleep 1;
if (count (nearestObjects [player, ['Plastic_Pole_EP1_DZ'], 65]) == 0) then {
detach _newCiv;
_newCiv setVariable ["Detain",1,true];
PVDZ_ply_Arrst = _newCiv;
publicVariable "PVDZ_ply_Arrst";
[objNull, _newCiv, rswitchmove ,"ActsPsitMstpSnonWunaDnon_sceneNikitinDisloyalty_Sykes"] call RE;
[objNull, _newCiv, rDisableuserinput,true] call RE;
};