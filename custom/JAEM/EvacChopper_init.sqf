private ["_evacCallerID","_evacCallerUID","_evacFields","_evacFieldID"];

evac_chopperPrice = 1;
evac_needRadio = 0;
evac_zoneMarker = 0;
evac_minDistance = 500;
evac_AllowedChoppers = [
	"AH1Z","AH64D_EP1","AH64D","AH64D_Sidewinders","AH6X_DZ",
	"AH6X_EP1","AH6J_EP1","AW159_Lynx_BAF","BAF_Apache_AH1_D","BAF_Merlin_HC3_D",
	"CH_47F_BAF","CH_47F_EP1","CH_47F_EP1_DZ","CH_47F_EP1_DZE","CSJ_GyroC",
	"CSJ_GyroCover","CSJ_GyroP","Ka137_MG_PMC","Ka137_PMC","Ka52",
	"Ka52Black","Ka60_GL_PMC","Ka60_PMC","Mi17_CDF","Mi17_Civilian",
	"Mi17_Civilian_DZ","Mi17_DZ","Mi17_Ins","Mi17_medevac_CDF","Mi17_medevac_INS",
	"Mi17_medevac_RU","Mi17_rockets_RU","Mi17_TK_EP1","Mi17_UN_CDF_EP1","Mi171Sh_CZ_EP1",
	"Mi171Sh_rockets_CZ_EP1","Mi24_D","Mi24_D_TK_EP1","Mi24_P","Mi24_V",
	"MH60S","MH60S_DZE","MH6J_DZ","MH6J_EP1","MV22","MV22_DZ",
	"pook_H13_medevac","pook_H13_medevac_CDF","pook_H13_medevac_TAK","pook_H13_medevac_INS","pook_H13_medevac_UNO",
	"pook_H13_medevac_PMC","pook_H13_medevac_GUE","pook_H13_medevac_CIV","pook_H13_medevac_CIV_RU","pook_H13_gunship",
	"pook_H13_gunship_CDF","pook_H13_gunship_UNO","pook_H13_gunship_PMC","pook_H13_gunship_GUE","pook_H13_gunship_TAK",
	"pook_H13_gunship_INS","pook_H13_transport","pook_H13_transport_CDF","pook_H13_transport_UNO","pook_H13_transport_PMC",
	"pook_H13_transport_GUE","pook_H13_transport_TAK","pook_H13_transport_INS","pook_H13_civ","pook_H13_civ_white",
	"pook_H13_civ_slate","pook_H13_civ_black","pook_H13_civ_yellow","pook_H13_civ_ru","pook_H13_civ_ru_white",
	"pook_H13_civ_ru_slate","pook_H13_civ_ru_black","pook_H13_civ_ru_yellow","UH1H_DZ","UH1H_DZE",
	"UH1H_TK_EP1","UH1H_TK_GUE_EP1","UH1Y_DZ","UH1Y_DZE","UH60M_EP1",
	"UH60M_EP1_DZ","UH60M_EP1_DZE","UH60M_MEV_EP1",
	"CH53_DZE","USEC_ch53_E"
];

ON_fnc_GetPos = {
	private ["_pos","_obj"];
	
	if (isNil {_this select 0}) exitWith {[0,0,0]};

	_obj = _this select 0;
	_pos = getPosASL _obj;

	if !(surfaceIsWater _pos) then {
		_pos =  ASLToATL _pos;
	};
	_pos
};

ON_fnc_convertUID = {
	private["_number_string","_string_array","_result","_num", "_playertemp"]; 

	_playertemp = _this select 0;
	_number_string = getPlayerUIDOld _playertemp ; 
	_string_array = toArray _number_string; 
	_result = ""; 

	for "_i" from 0 to ((count _string_array) - 1) step 1 do {
		_num = ((_string_array select _i) - 48);

		if (_num > 9) then { 
			_num = 9;
		};

		_result = _result + str(_num);
	};
	_result 
};
  

waitUntil {!isNil "dayz_animalCheck"};

waitUntil {!isNil "PVDZE_EvacChopperFields"};

_evacFields = PVDZE_EvacChopperFields;

_evacCallerID = (player getVariable ["CharacterID","0"]);
_evacCallerUID = ([player] call ON_fnc_convertUID);
playerHasEvacField = false;
playersEvacField = objNull;
if ((count _evacFields) > 0) then
{
	{
		_evacFieldID = _x getVariable ["CharacterID", "0"];
		if (_evacCallerID == _evacFieldID || _evacCallerUID == _evacFieldID) then {
			playerHasEvacField = true;
			playersEvacField = _x;
		};
	} forEach _evacFields;
};

s_player_createEvacChopper = -1;
s_player_changeEvacChopper = -1;
s_player_clearEvacChopper = -1;
s_player_callEvacChopper = -1;
actionMenu = true;
createEvac = false;
changeEvac = false;
clearEvac = false;

while {true} do {
	if (createEvac) then {
		if (s_player_createEvacChopper < 0) then {
			s_player_createEvacChopper = player addAction [("<t color=""#0000FF"">" + ("Criar Evac-Chopper") + "</t>"),"custom\JAEM\SetEvacChopper.sqf",evac_cTarget,-1000,false,false,"",""];
		};
	} else {
		player removeAction s_player_createEvacChopper;
		s_player_createEvacChopper = -1;
	};
	
	if (changeEvac) then {
		if (s_player_changeEvacChopper < 0) then {
			s_player_changeEvacChopper = player addAction [("<t color=""#00FFFF"">" + ("Trocar Evac-Chopper") + "</t>"),"custom\JAEM\SetEvacChopper.sqf",evac_cTarget,-1000,false,false,"",""];
		};
	} else {
		player removeAction s_player_changeEvacChopper;
		s_player_changeEvacChopper = -1;
	};

	if (clearEvac) then {
		if (s_player_clearEvacChopper < 0) then {
			s_player_clearEvacChopper = player addAction [("<t color=""#c70000"">" + ("Remover Evac-Chopper") + "</t>"),"custom\JAEM\ClearEvacChopper.sqf",[],-1001,false,false,"",""];
		};
	} else {
		player removeAction s_player_clearEvacChopper;
		s_player_clearEvacChopper = -1;
	};


	if (!isNull cursorTarget && (typeOf cursorTarget) in evac_AllowedChoppers && player distance cursorTarget <= 10 && !isEngineOn cursorTarget && actionMenu) then {
		evac_cTarget = cursorTarget;
		evac_vehicleKey = evac_cTarget getVariable ["CharacterID","0"];

		if (evac_vehicleKey != "0") then {
			evac_key_colors = ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];
			evac_temp_keys = [];
			evac_itemsPlayer = items player;

			{

				if (configName(inheritsFrom(configFile >> "CfgWeapons" >> _x)) in evac_key_colors) then {
					evac_ownerKeyId = getNumber(configFile >> "CfgWeapons" >> _x >> "keyid");
					evac_keyName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
					evac_temp_keys set [count evac_temp_keys,str(evac_ownerKeyId)];
				};
			} forEach evac_itemsPlayer;

			evac_hasKey = evac_vehicleKey in evac_temp_keys;

			if (evac_hasKey) then {
				if (!playerHasEvacField) then {
					createEvac = true;
				} else {
					createEvac = false;
					if ((evac_cTarget distance playersEvacField) > 10) then {
						changeEvac = true;
					} else {
						changeEvac = false;
					};
				};
			} else {
				createEvac = false;
				changeEvac = false;
			};
		} else {
			createEvac = false;
			changeEvac = false;
		};
	} else {
		createEvac = false;
		changeEvac = false;
	};


	if (playerHasEvacField) then {
		if ((player distance playersEvacField) <= 10) then {
			clearEvac = true;
		} else {
			clearEvac = false;
		};
	} else {
		clearEvac = false;
	};
};