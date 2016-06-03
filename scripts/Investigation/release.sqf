_newCiv = cursorTarget;
_dist = player distance _newCiv;
_isMan = _newCiv isKindOf "Man";

if(_isMan && _dist < 10 && (count (nearestObjects [player, ['Plastic_Pole_EP1_DZ'], 65]) == 0)) then {
    _objects = nearestObjects [player, ["Can_Small"], 50];
    _objects = _objects select 0;
    deleteVehicle _objects;
    detach _newCiv;
    [objNull, _newCiv, rswitchmove,""] call RE;

    player forceWalk False;
    _newCiv setVariable ["Detain",0,true];
    PVDZ_ply_Arrst = _newCiv;
    publicVariable "PVDZ_ply_Arrst";
};