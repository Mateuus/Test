private ["_squad1","_CENTER","_aiGroup","_target","","_squad2","_squad3","_squad4","_squad5","_squad6","_squad7","_squad8","_squad9","_squad10","_squad11","_squad12","_squad13","_squad14","_squad15","_squad16","_squad17","_squad18","_squad19","_squad20"];

_CENTER = createCenter east;
_aiGroup = createGroup east;
EAST setFriend [WEST,0];
_target = (position player);

_squad1 = _aiGroup createUnit ["Policeman",[6961.0615, 7661.4253, 0], [], 10, "PRIVATE"];
_squad2 = _aiGroup createUnit ["Policeman",[6952.8257, 7658.9414, 0], [], 10, "PRIVATE"];
_squad3 = _aiGroup createUnit ["Policeman",[7031.1577, 7628.9253, 0], [], 10, "PRIVATE"];
_squad4 = _aiGroup createUnit ["Policeman",[7030.2744, 7633.1851, 0], [], 10, "PRIVATE"];
_squad5 = _aiGroup createUnit ["Policeman",[7029.9312, 7638.7476, 0], [], 10, "PRIVATE"];
_squad6 = _aiGroup createUnit ["Policeman",[7028.8037, 7641.9746, 0], [], 10, "PRIVATE"];
_squad7 = _aiGroup createUnit ["Policeman",[7026.5835, 7646.4673, 0], [], 10, "PRIVATE"];
_squad8 = _aiGroup createUnit ["Policeman",[7028.9585, 7651.4248, 0], [], 10, "PRIVATE"];
_squad9 = _aiGroup createUnit ["Policeman",[7023.9878, 7656.5625, 0], [], 10, "PRIVATE"];
_squad10 = _aiGroup createUnit ["Policeman",[7022.709, 7660.1987, 0], [], 10, "PRIVATE"];
_squad11 = _aiGroup createUnit ["Policeman",[7021.3481, 7664.5303, 0], [], 10, "PRIVATE"];
_squad12 = _aiGroup createUnit ["Policeman",[7016.354, 7664.8223, 0], [], 10, "PRIVATE"];
_squad13 = _aiGroup createUnit ["Policeman",[7013.3467, 7663.7314, 0], [], 10, "PRIVATE"];
_squad14 = _aiGroup createUnit ["Policeman",[6997.1733, 7658.5913, 0], [], 10, "PRIVATE"];
_squad15 = _aiGroup createUnit ["Policeman",[6992.2402, 7655.0337, 0], [], 10, "PRIVATE"];
_squad16 = _aiGroup createUnit ["Policeman",[6983.9692, 7664.5972, 0], [], 10, "PRIVATE"];
_squad17 = _aiGroup createUnit ["Policeman",[6978.2456, 7664.4097, 0], [], 10, "PRIVATE"];
_squad18 = _aiGroup createUnit ["Policeman",[6971.0371, 7663.7861, 0], [], 10, "PRIVATE"];
_squad19 = _aiGroup createUnit ["Policeman",[7021.937, 7676.5503, 0], [], 10, "PRIVATE"];
_squad20 = _aiGroup createUnit ["Policeman",[7015.5586, 7679.8584, 0], [], 10, "PRIVATE"];

_squad1 setVariable ["Chernobyl", 2 , true];
_squad2 setVariable ["Chernobyl", 2 , true];
_squad3 setVariable ["Chernobyl", 2 , true];
_squad4 setVariable ["Chernobyl", 2 , true];
_squad5 setVariable ["Chernobyl", 2 , true];
_squad6 setVariable ["Chernobyl", 2 , true];
_squad7 setVariable ["Chernobyl", 2 , true];
_squad8 setVariable ["Chernobyl", 2 , true];
_squad9 setVariable ["Chernobyl", 2 , true];
_squad10 setVariable ["Chernobyl", 2 , true];
_squad12 setVariable ["Chernobyl", 2 , true];
_squad12 setVariable ["Chernobyl", 2 , true];
_squad13 setVariable ["Chernobyl", 2 , true];
_squad14 setVariable ["Chernobyl", 2 , true];
_squad15 setVariable ["Chernobyl", 2 , true];
_squad16 setVariable ["Chernobyl", 2 , true];
_squad17 setVariable ["Chernobyl", 2 , true];
_squad18 setVariable ["Chernobyl", 2 , true];
_squad19 setVariable ["Chernobyl", 2 , true];
_squad20 setVariable ["Chernobyl", 2 , true];

[_squad1,_squad2,_squad3,_squad4,_squad5,_squad6,_squad7,_squad8,_squad9,_squad10,_squad11,_squad12,_squad13,_squad14,_squad15,_squad16,_squad17,_squad18,_squad19,_squad20] joinSilent _aiGroup;

_squad1 addWeapon "M4A3_CCO_EP1";
_squad1 addMagazine "30Rnd_556x45_Stanag";
_squad1 addMagazine "30Rnd_556x45_Stanag";
_squad2 addWeapon "M4A1_Aim";
_squad2 addMagazine "30Rnd_556x45_Stanag";
_squad2 addMagazine "30Rnd_556x45_Stanag";
_squad3 addWeapon "M240_DZ";
_squad3 addMagazine "100Rnd_762x51_M240";
_squad3 addMagazine "100Rnd_762x51_M240";
_squad4 addWeapon "M240_DZ";
_squad4 addMagazine "100Rnd_762x51_M240";
_squad4 addMagazine "100Rnd_762x51_M240";
_squad5 addWeapon "M240_DZ";
_squad5 addMagazine "100Rnd_762x51_M240";
_squad5 addMagazine "100Rnd_762x51_M240";
_squad6 addWeapon "M4A1_Aim";
_squad6 addMagazine "30Rnd_556x45_Stanag";
_squad6 addMagazine "30Rnd_556x45_Stanag";
_squad7 addWeapon "DMR";
_squad7 addMagazine "20Rnd_762x51_DMR";
_squad7 addMagazine "20Rnd_762x51_DMR";
_squad8 addWeapon "DMR";
_squad8 addMagazine "20Rnd_762x51_DMR";
_squad8 addMagazine "20Rnd_762x51_DMR";
_squad9 addWeapon "M4A3_CCO_EP1";
_squad9 addMagazine "30Rnd_556x45_Stanag";
_squad9 addMagazine "30Rnd_556x45_Stanag";
_squad10 addWeapon "M4A3_CCO_EP1";
_squad10 addMagazine "30Rnd_556x45_Stanag";
_squad10 addMagazine "30Rnd_556x45_Stanag";
_squad11 addWeapon "M4A3_CCO_EP1";
_squad11 addMagazine "30Rnd_556x45_Stanag";
_squad11 addMagazine "30Rnd_556x45_Stanag";
_squad12 addWeapon "M4A1_Aim";
_squad12 addMagazine "30Rnd_556x45_Stanag";
_squad12 addMagazine "30Rnd_556x45_Stanag";
_squad13 addWeapon "M240_DZ";
_squad13 addMagazine "100Rnd_762x51_M240";
_squad13 addMagazine "100Rnd_762x51_M240";
_squad14 addWeapon "M4A3_CCO_EP1";
_squad14 addMagazine "30Rnd_556x45_Stanag";
_squad14 addMagazine "30Rnd_556x45_Stanag";
_squad15 addWeapon "M4A1_Aim";
_squad15 addMagazine "30Rnd_556x45_Stanag";
_squad15 addMagazine "30Rnd_556x45_Stanag";
_squad16 addWeapon "M4A3_CCO_EP1";
_squad16 addMagazine "30Rnd_556x45_Stanag";
_squad16 addMagazine "30Rnd_556x45_Stanag";
_squad17 addWeapon "M4A1_Aim";
_squad17 addMagazine "30Rnd_556x45_Stanag";
_squad17 addMagazine "30Rnd_556x45_Stanag";
_squad18 addWeapon "M4A3_CCO_EP1";
_squad18 addMagazine "30Rnd_556x45_Stanag";
_squad18 addMagazine "30Rnd_556x45_Stanag";
_squad19 addWeapon "M4A1_Aim";
_squad19 addMagazine "30Rnd_556x45_Stanag";
_squad19 addMagazine "30Rnd_556x45_Stanag";
_squad20 addWeapon "M4A1_Aim";
_squad20 addMagazine "30Rnd_556x45_Stanag";
_squad20 addMagazine "30Rnd_556x45_Stanag";

_suvFirstWP = (position player);
_suvWP = _aiGroup addWaypoint [_suvFirstWP, 20,2];
_suvWP setWaypointType "MOVE";

sleep 60;

_suvsecWP = (position player);
_suvWP5 = _aiGroup addWaypoint [_suvsecWP, 2,2];
_suvWP5 setWaypointType "MOVE";

sleep 60;

_suvsecWP1 = (position player);
_suvWP1 = _aiGroup addWaypoint [_suvsecWP1, 2,2];
_suvWP1 setWaypointType "MOVE";

sleep 60;

_suvsecWP2 = (position player);
_suvWP2 = _aiGroup addWaypoint [_suvsecWP2, 2,2];
_suvWP2 setWaypointType "MOVE";

sleep 60;

_suvsecWP3 = (position player);
_suvWP3 = _aiGroup addWaypoint [_suvsecWP3, 2,2];
_suvWP3 setWaypointType "MOVE";