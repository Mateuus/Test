donn_nitroOn = false;
donn_speedometer = false;
nitroCars = [
		"car_sedan",
		"Skoda",
		"SkodaBlue",
		"SkodaRed",
		"SkodaGreen",
		"datsun1_civil_1_open",
		"datsun1_civil_2_covered",
		"datsun1_civil_3_open",
		"car_hatchback",
		"GLT_M300_LT",
		"GLT_M300_ST",
		"Lada1",
		"Lada2",
		"LadaLM",
		"VWGolf",
		"Lada1_TK_CIV_EP1",
		"Lada2_TK_CIV_EP1",
		"Volha_1_TK_CIV_EP1",
		"Volha_2_TK_CIV_EP1",
		"VolhaLimo_TK_CIV_EP1",
		"VolhaLimo_TK_CIV_EP1_DZE1",
		"Volha_1_TK_CIV_EP1_DZE1",
		"Volha_2_TK_CIV_EP1_DZE1",
		"VolhaLimo_TK_CIV_EP1_DZE2",
		"Volha_1_TK_CIV_EP1_DZE2",
		"Volha_2_TK_CIV_EP1_DZE2",
		"VolhaLimo_TK_CIV_EP1_DZE3",
		"Volha_1_TK_CIV_EP1_DZE3",
		"Volha_2_TK_CIV_EP1_DZE3",
		"VolhaLimo_TK_CIV_EP1_DZE4",
		"Volha_1_TK_CIV_EP1_DZE4",
		"Volha_2_TK_CIV_EP1_DZE4",
		"VWGolf_DZE1",
		"VWGolf_DZE2",
		"VWGolf_DZE3",
		"VWGolf_DZE4",
		"Skoda_DZE1",
		"SkodaBlue_DZE1",
		"SkodaRed_DZE1",
		"SkodaGreen_DZE1",
		"Skoda_DZE2",
		"SkodaBlue_DZE2",
		"SkodaRed_DZE2",
		"SkodaGreen_DZE2",
		"Skoda_DZE3",
		"SkodaBlue_DZE3",
		"SkodaRed_DZE3",
		"SkodaGreen_DZE3",
		"Skoda_DZE4",
		"SkodaBlue_DZE4",
		"SkodaRed_DZE4",
		"SkodaGreen_DZE4",
		"car_hatchback_DZE1",
		"car_hatchback_DZE2",
		"car_hatchback_DZE3",
		"car_hatchback_DZE4",
		"car_sedan_DZE1",
		"car_sedan_DZE2",
		"car_sedan_DZE3",
		"car_sedan_DZE4",
		"datsun1_civil_1_open_DZE1",
		"datsun1_civil_2_covered_DZE1",
		"datsun1_civil_3_open_DZE1",
		"datsun1_civil_1_open_DZE2",
		"datsun1_civil_2_covered_DZE2",
		"datsun1_civil_3_open_DZE2",
		"datsun1_civil_1_open_DZE3",
		"datsun1_civil_2_covered_DZE3",
		"datsun1_civil_3_open_DZE3",
		"datsun1_civil_1_open_DZE4",
		"datsun1_civil_2_covered_DZE4",
		"datsun1_civil_3_open_DZE4",
		"Lada1_DZE1",
		"Lada2_DZE1",
		"LadaLM_DZE1",
		"Lada1_TK_CIV_EP1_DZE1",
		"Lada2_TK_CIV_EP1_DZE1",
		"Lada1_DZE2",
		"Lada2_DZE2",
		"LadaLM_DZE2",
		"Lada1_TK_CIV_EP1_DZE2",
		"Lada2_TK_CIV_EP1_DZE2",
		"Lada1_DZE3",
		"Lada2_DZE3",
		"LadaLM_DZE3",
		"Lada1_TK_CIV_EP1_DZE3",
		"Lada2_TK_CIV_EP1_DZE3",
		"Lada1_DZE4",
		"Lada2_DZE4",
		"LadaLM_DZE4",
		"Lada1_TK_CIV_EP1_DZE4",
		"Lada2_TK_CIV_EP1_DZE4",
		"hilux1_civil_1_open_DZE1",
		"hilux1_civil_2_covered_DZE1",
		"hilux1_civil_3_open_DZE1",
		"hilux1_civil_1_open_DZE2",
		"hilux1_civil_2_covered_DZE2",
		"hilux1_civil_3_open_DZE2",
		"hilux1_civil_1_open_DZE3",
		"hilux1_civil_2_covered_DZE3",
		"hilux1_civil_3_open_DZE3",
		"hilux1_civil_1_open_DZE4",
		"hilux1_civil_2_covered_DZE4",
		"hilux1_civil_3_open_DZE4",
		"UAZ_CDF_DZE1",
		"UAZ_INS_DZE1",
		"UAZ_RU_DZE1",
		"UAZ_Unarmed_TK_EP1_DZE1",
		"UAZ_Unarmed_UN_EP1_DZE1",
		"UAZ_Unarmed_TK_CIV_EP1_DZE1",
		"UAZ_CDF_DZE2",
		"UAZ_INS_DZE2",
		"UAZ_RU_DZE2",
		"UAZ_Unarmed_TK_EP1_DZE2",
		"UAZ_Unarmed_UN_EP1_DZE2",
		"UAZ_Unarmed_TK_CIV_EP1_DZE2",
		"UAZ_CDF_DZE3",
		"UAZ_INS_DZE3",
		"UAZ_RU_DZE3",
		"UAZ_Unarmed_TK_EP1_DZE3",
		"UAZ_Unarmed_UN_EP1_DZE3",
		"UAZ_Unarmed_TK_CIV_EP1_DZE3",
		"UAZ_CDF_DZE4",
		"UAZ_INS_DZE4",
		"UAZ_RU_DZE4",
		"UAZ_Unarmed_TK_EP1_DZE4",
		"UAZ_Unarmed_UN_EP1_DZE4",
		"UAZ_Unarmed_TK_CIV_EP1_DZE4",
		"SUV_TK_CIV_EP1_DZE1",
		"SUV_Camo_DZE1",
		"SUV_Blue_DZE1",
		"SUV_Green_DZE1",
		"SUV_Yellow_DZE1",
		"SUV_Red_DZE1",
		"SUV_White_DZE1",
		"SUV_Pink_DZE1",
		"SUV_Charcoal_DZE1",
		"SUV_Orange_DZE1",
		"SUV_Silver_DZE1",
		"SUV_TK_CIV_EP1_DZE2",
		"SUV_Camo_DZE2",
		"SUV_Blue_DZE2",
		"SUV_Green_DZE2",
		"SUV_Yellow_DZE2",
		"SUV_Red_DZE2",
		"SUV_White_DZE2",
		"SUV_Pink_DZE2",
		"SUV_Charcoal_DZE2",
		"SUV_Orange_DZE2",
		"SUV_Silver_DZE2",
		"SUV_TK_CIV_EP1_DZE3",
		"SUV_Camo_DZE3",
		"SUV_Blue_DZE3",
		"SUV_Green_DZE3",
		"SUV_Yellow_DZE3",
		"SUV_Red_DZE3",
		"SUV_White_DZE3",
		"SUV_Pink_DZE3",
		"SUV_Charcoal_DZE3",
		"SUV_Orange_DZE3",
		"SUV_Silver_DZE3",
		"SUV_TK_CIV_EP1_DZE4",
		"SUV_Camo_DZE4",
		"SUV_Blue_DZE4",
		"SUV_Green_DZE4",
		"SUV_Yellow_DZE4",
		"SUV_Red_DZE4",
		"SUV_White_DZE4",
		"SUV_Pink_DZE4",
		"SUV_Charcoal_DZE4",
		"SUV_Orange_DZE4",
		"SUV_Silver_DZE4"
];
kDownFunc = {
	private ["_theCar","_keyDown"];
	_keyDown = _this;
	if (_keyDown == 42 && donn_nitroOn) then {
		_theCar = vehicle player;
		if (isEngineOn _theCar && ((getPosATL _theCar) select 2) < 0.1 && speed _theCar >= 50) then {
			private ["_vel","_dir"];
			_dir = direction _theCar;
			_vel = velocity _theCar;
			_theCar setVelocity [
				(_vel select 0) + (sin _dir * 0.2),
				(_vel select 1) + (cos _dir * 0.2),
				(_vel select 2)
			];
			_theCar setFuel ((fuel _theCar) - 0.000555);
			if ((diag_tickTime - donn_airStarted) >= donn_airWait) then {
				[nil,_theCar, rSAY,["suction", 100]] call RE;		
				if (donn_airWait == 3.5) then {
					[nil,_theCar, rSAY,["exhaustor", 100]] call RE;
					donn_airStarted = diag_tickTime;
					donn_airWait = 3;
					donn_problem = true;
					[] spawn {
						private ["_theCar","_vel","_calcDir","_magnitude","_dir","_intensity"];
						_theCar = vehicle player;
						for "_x" from 1 to 200 do {
							if (vehicle player == _theCar && isEngineOn _theCar && ((getPosATL _theCar) select 2) < 0.1 && speed _theCar >= 50) then {
								_vel = velocity _theCar;
								_dir = direction _theCar;
								_magnitude = sqrt((_vel select 0)^2 + (_vel select 1)^2);
								if ((_vel select 0) < 0) then {_calcDir = 360 - aCos ((_vel select 1)/_magnitude);} else {_calcDir = aCos ((_vel select 1)/_magnitude);};
								if (abs(_dir-_calcDir) <= 5) then {
									_theCar setVelocity [(_vel select 0) * 1.1, (_vel select 1) * 1.1, (_vel select 2)];
								};
							};
							uiSleep 0.01;
							if (!donn_problem) exitWith {};
						};
					};
				} else {
					donn_airStarted = diag_tickTime;
					donn_airWait = random 3.5;
					if (donn_airWait > 3) then {donn_airWait = 3.5;};
				};
			};
		};
	};
};
kUpFunc = {
	private ["_keyUp"];
	_keyUp = _this;
	if (_keyUp == 41) then {
		donn_problem = false;
	};
	if (_keyUp == 57) then {
		if (donn_nitroOn) then {
			donn_nitroOn = false;
			systemChat ("Nitro Off!");
		} else {
			donn_nitroOn = true;
			systemChat ("Nitro On!");
			if (donn_speedometer) then {
				[] spawn {
					while {donn_nitroOn} do {
						cutText [format ["Speed in Km/h: %1", round (speed (vehicle player))], "PLAIN"];
						uiSleep 0.5;
					};
				};			
			};
		};
	};
};
[] spawn {
	while {true} do {
		waitUntil {sleep 0.25; vehicle player != player && (driver (vehicle player)) == player};
		if ((typeOf (vehicle player)) in nitroCars) then {
			donn_nosOk = true;
			donn_airStarted = diag_tickTime;
			donn_airWait = 1.5;
			donn_problem = false;
			[nil, (vehicle player), rSAY, ["nitro", 100]] call RE;
			[player,25,true,(getPosATL player)] spawn player_alertZombies;
			systemChat ("Precione Barra de Espaco para ligar o Nitro!");
			nosKeyDown = (findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call kDownFunc; false;"];
			nosKeyUp = (findDisplay 46) displayAddEventHandler ["KeyUp","_this select 1 call kUpFunc; false;"];
		} else {
			donn_nosOk = false;
		};
		waitUntil {sleep 0.25; vehicle player == player || (driver (vehicle player)) != player};
		if (donn_nosOk) then {
			donn_nitroOn = false;
			donn_airStarted = nil;
			donn_airWait = nil;
			donn_problem = nil;
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", nosKeyDown];
			(findDisplay 46) displayRemoveEventHandler ["KeyUp", nosKeyUp];
		};
	};
};