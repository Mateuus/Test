private ["_loot","_ObjVault","_ObjVault2","_ObjSign","_robComplete","_nearVault","_playerPos","_objectID","_objectUID"];
_playerPos = getPosATL player;
_nearVault = count nearestObjects [_playerPos, ["VaultStorage"], 15] > 0;
_nearbagui = count nearestObjects [_playerPos, ["Sign_sphere100cm_EP1"], 15] > 0;
_meters = player distance [7014.4897, 7645.3999, 1.6962879];

if (_nearVault) exitWith {
	cutText [format["O banco ja foi roubado!"], "PLAIN DOWN"];
};

if (_nearbagui) exitWith {
	cutText [format["O banco ja foi ou ja esta sendo roubado!"], "PLAIN DOWN"];
};

if(isNil "script_in_progress")then{
        script_in_progress = false;
};

if(isNil "_robtemp")then{
        _robtemp = 0;
};
 
if(script_in_progress)exitwith{
        systemChat "O banco ja foi ou ja esta sendo roubado!";
};
script_in_progress = true;

	[nil,nil,rTitleText,"O Banco esta sendo roubado!", "PLAIN",6] call RE;
	systemChat "Voce esta roubando o banco! O alarme silencioso foi acionado.";
	sleep 2;
	systemChat "Voce conseguira seu dinheiro em 5 minutos !";
	sleep 2;
	
	if (true) then
   {
   _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
   sleep 10;
   systemChat "O cofre que flecha esta apontando ira abrir...";
   _ObjSign = createVehicle ["Sign_arrow_down_large_EP1", [7020.83,7637.97,1.550], [], 0, "CAN_COLLIDE"];
   sleep 10;
   deleteVehicle _ObjSign;
   deleteVehicle _Objexplo;
   };
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
    if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
	cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
    deleteVehicle _Objexplo;
    script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	execVM "rob\ai.sqf"; 
	//execVM "rob\ai_suv.sqf"; 
	cutText [format["Faltam 4 minutos..."], "PLAIN DOWN"];
	systemChat "Faltam 4 minutos...";
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	cutText [format["Faltam 3 minutos..."], "PLAIN DOWN"];
	systemChat "Faltam 3 minutos...";
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	cutText [format["Faltam 2 minutos..."], "PLAIN DOWN"];
	systemChat "Faltam 2 minutos...";
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	cutText [format["Falta 1 minuto..."], "PLAIN DOWN"];
	systemChat "Falta 1 minuto...";
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	sleep 10;
    deleteVehicle _Objexplo;
    _Objexplo = createVehicle ["Sign_sphere100cm_EP1", [7021.36,7637.94,0.405], [], 0, "CAN_COLLIDE"];
	if((player distance [7014.4897, 7645.3999, 1.6962879]) >= 20) exitwith {
		cutText [format["Roubo cancelado!"], "PLAIN DOWN"];
		deleteVehicle _Objexplo;
		script_in_progress = false;
	};
	cutText [format["O cofre esta abrindo."], "PLAIN DOWN"];
	sleep 5;
	_robComplete = 1;
	
	
if (_robComplete == 1) then {
		
	_loot=floor(random 10);
		if (_loot == 0) then {
			systemChat "O banco perdeu 1 Briefcase durante o roubo!";
			[nil,nil,rTitleText,"O banco perdeu 1 Briefcase durante o roubo!", "PLAIN",6] call RE;
			
		if (true) then {
        _ObjVault = objNull;
        _ObjVault = createVehicle ["VaultStorage", [7020.77,7638.14,0.666], [], 0, "CAN_COLLIDE"];
        _ObjVault setPos [7020.77,7638.14,0.666];  
        _ObjVault setDir 73;
        clearWeaponCargoGlobal _ObjVault;
        clearMagazineCargoGlobal _ObjVault;

        _ObjVault addMagazineCargoGlobal ["ItemBriefcase100oz",1];
		_ObjVault setVariable ["ObjectID","1",true];
        _ObjVault setVariable ["permaLoot",true,true];  
		  
         };
		};
		if (_loot == 1) then {
			systemChat "O banco perdeu 1 Briefcases durante o roubo!";
			[nil,nil,rTitleText,"O banco perdeu 1 Briefcase durante o roubo!", "PLAIN",6] call RE;
			
			if (true) then {
        _ObjVault = objNull;
        _ObjVault = createVehicle ["VaultStorage", [7020.77,7638.14,0.666], [], 0, "CAN_COLLIDE"];
        _ObjVault setPos [7020.77,7638.14,0.666];  
        _ObjVault setDir 73;
        clearWeaponCargoGlobal _ObjVault;
        clearMagazineCargoGlobal _ObjVault;

        _ObjVault addMagazineCargoGlobal ["ItemBriefcase100oz",1];
		_ObjVault setVariable ["ObjectID","1",true];
        _ObjVault setVariable ["permaLoot",true,true];
		  
         };
		};	
		if (_loot == 2) then {
			systemChat "O banco perdeu 1 briefcase durante o roubo!";
			[nil,nil,rTitleText,"O banco perdeu 1 Briefcase Misteriosa durante o roubo!", "PLAIN",6] call RE;
			
			if (true) then {
        _ObjVault = objNull;
        _ObjVault = createVehicle ["VaultStorage", [7020.77,7638.14,0.666], [], 0, "CAN_COLLIDE"];
        _ObjVault setPos [7020.77,7638.14,0.666];  
        _ObjVault setDir 73;
        clearWeaponCargoGlobal _ObjVault;
        clearMagazineCargoGlobal _ObjVault;

        _ObjVault addMagazineCargoGlobal ["ItemBriefcase_base",1];
		_ObjVault setVariable ["ObjectID","1",true];
        _ObjVault setVariable ["permaLoot",true,true];
		  
         };
		};
		if (_loot == 3) then {
			systemChat "O banco perdeu 2 Briefcases durante o roubo!";
			[nil,nil,rTitleText,"O banco perdeu 2 Briefcases durante o roubo!", "PLAIN",6] call RE;
			
			if (true) then {
        _ObjVault = objNull;
        _ObjVault = createVehicle ["VaultStorage", [7020.77,7638.14,0.666], [], 0, "CAN_COLLIDE"];
        _ObjVault setPos [7020.77,7638.14,0.666];  
        _ObjVault setDir 73;
        clearWeaponCargoGlobal _ObjVault;
        clearMagazineCargoGlobal _ObjVault;

        _ObjVault addMagazineCargoGlobal ["ItemBriefcase100oz",2];
		_ObjVault setVariable ["ObjectID","1",true];
        _ObjVault setVariable ["permaLoot",true,true];
		  
         };
		};		
		if (_loot == 4) then {
			systemChat "O banco perdeu 2 Briefcase durante o roubo!";
			[nil,nil,rTitleText,"O banco perdeu 2 Briefcase durante o roubo!", "PLAIN",6] call RE;
			
			if (true) then {
        _ObjVault = objNull;
        _ObjVault = createVehicle ["VaultStorage", [7020.77,7638.14,0.666], [], 0, "CAN_COLLIDE"];
        _ObjVault setPos [7020.77,7638.14,0.666];  
        _ObjVault setDir 73;
        clearWeaponCargoGlobal _ObjVault;
        clearMagazineCargoGlobal _ObjVault;

        _ObjVault addMagazineCargoGlobal ["ItemBriefcase100oz",2];
		_ObjVault setVariable ["ObjectID","1",true];
        _ObjVault setVariable ["permaLoot",true,true];
		  
         };
		};
		if (_loot == 5) then {
			systemChat "O banco perdeu 3 Briefcases durante o roubo!";
			[nil,nil,rTitleText,"O banco perdeu 3 Briefcases durante o roubo!", "PLAIN",6] call RE;
			
			if (true) then {
        _ObjVault = objNull;
        _ObjVault = createVehicle ["VaultStorage", [7020.77,7638.14,0.666], [], 0, "CAN_COLLIDE"];
        _ObjVault setPos [7020.77,7638.14,0.666];  
        _ObjVault setDir 73;
        clearWeaponCargoGlobal _ObjVault;
        clearMagazineCargoGlobal _ObjVault;

        _ObjVault addMagazineCargoGlobal ["ItemBriefcase100oz",3];
		_ObjVault setVariable ["ObjectID","1",true];
        _ObjVault setVariable ["permaLoot",true,true];
		  
         };
		};
		if (_loot == 6) then {
			systemChat "O banco perdeu 3 Briefcases durante o roubo!";
			[nil,nil,rTitleText,"O banco perdeu 3 Briefcases durante o roubo!", "PLAIN",6] call RE;
			
			if (true) then {
        _ObjVault = objNull;
        _ObjVault = createVehicle ["VaultStorage", [7020.77,7638.14,0.666], [], 0, "CAN_COLLIDE"];
        _ObjVault setPos [7020.77,7638.14,0.666];  
        _ObjVault setDir 73;
        clearWeaponCargoGlobal _ObjVault;
        clearMagazineCargoGlobal _ObjVault;

        _ObjVault addMagazineCargoGlobal ["ItemBriefcase100oz",3];
		_ObjVault setVariable ["ObjectID","1",true];
        _ObjVault setVariable ["permaLoot",true,true];
		  
         };
		};
		if (_loot == 7) then {
			systemChat "O banco perdeu 3 Briefcases durante o roubo!";
			[nil,nil,rTitleText,"O banco perdeu 3 Briefcases durante o roubo!", "PLAIN",6] call RE;
			
			if (true) then {
        _ObjVault = objNull;
        _ObjVault = createVehicle ["VaultStorage", [7020.77,7638.14,0.666], [], 0, "CAN_COLLIDE"];
        _ObjVault setPos [7020.77,7638.14,0.666];  
        _ObjVault setDir 73;
        clearWeaponCargoGlobal _ObjVault;
        clearMagazineCargoGlobal _ObjVault;

        _ObjVault addMagazineCargoGlobal ["ItemBriefcase100oz",3];
		_ObjVault setVariable ["ObjectID","1",true];
        _ObjVault setVariable ["permaLoot",true,true];
		  
         };
		};
		if (_loot == 8) then {
			systemChat "O banco perdeu 3 Briefcases durante o roubo!";
			[nil,nil,rTitleText,"O banco perdeu 3 Briefcases durante o roubo!", "PLAIN",6] call RE;
			
			if (true) then {
        _ObjVault = objNull;
        _ObjVault = createVehicle ["VaultStorage", [7020.77,7638.14,0.666], [], 0, "CAN_COLLIDE"];
        _ObjVault setPos [7020.77,7638.14,0.666];  
        _ObjVault setDir 73;
        clearWeaponCargoGlobal _ObjVault;
        clearMagazineCargoGlobal _ObjVault;

        _ObjVault addMagazineCargoGlobal ["ItemBriefcase100oz",3];
		_ObjVault setVariable ["ObjectID","1",true];
        _ObjVault setVariable ["permaLoot",true,true];
		  
         };
		};
		if (_loot == 9) then {
			systemChat "O banco perdeu 2 Briefcases durante o roubo!";
			[nil,nil,rTitleText,"O banco perdeu 2 Briefcases durante o roubo!", "PLAIN",6] call RE;
			
		if (true) then {
        _ObjVault = objNull;
        _ObjVault = createVehicle ["VaultStorage", [7020.77,7638.14,0.666], [], 0, "CAN_COLLIDE"];
        _ObjVault setPos [7020.77,7638.14,0.666];  
        _ObjVault setDir 73;
        clearWeaponCargoGlobal _ObjVault;
        clearMagazineCargoGlobal _ObjVault;

        _ObjVault addMagazineCargoGlobal ["ItemBriefcase100oz",2];
		_ObjVault setVariable ["ObjectID","1",true];
        _ObjVault setVariable ["permaLoot",true,true];
		  
        };
		};
		
	};

