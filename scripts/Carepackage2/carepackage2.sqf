private ["_boxvel","_height","_downspeed","_display","_distance","_boxtype","_unit","_getPos","_position","_box","_chute","_smoke","_var","_textt","_tools","_items","_walls","_supplies","_weapon","_weapon2","_weapon3","_weapon4","_weapon5","_weapon6","_giveWep","_possibleMags","_mag","_whichBuild","_crateItems","_text"];

_downspeed = -5;
_boxtype = "USVehicleBox_EP1";
_height = 150;
_timeToDelete = 500;
_vixe = false;
_playerName = name player;

_tools = ["ItemEtool","ItemKnife","ItemGPS","ItemFishingPole","ItemHatchet_DZE","ItemMatchbox_DZE","ItemCrowbar"];
_items = ["ItemSodaPepsi","FoodCanCorn","FoodNutmix","ItemSodaClays","FoodCanSardines","ItemKiloHemp"];
_walls = ["ItemWoodWallGarageDoor","ItemWoodWallWithDoorLg","ItemWoodWallLg","ItemWoodWallGarageDoor","metal_floor_kit","metal_floor_kit"];
_supplies = ["CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","MortarBucket","MortarBucket","ItemTankTrap","PartWoodPlywood","PartWoodLumber","ItemPole","ItemPole","ItemPole","ItemPole","PartGlass"];

_weapon = "DMR";
_weapon2 = "AK_47_M";
_weapon3 = "BAF_L85A2_RIS_Holo";
_weapon4 = "RPK_74";
_weapon5 = "M14_EP1";
_weapon6 = "M249_DZ";
_giveWep = [_weapon,_weapon2,_weapon3,_weapon4,_weapon5,_weapon6] call BIS_fnc_selectRandom;
_possibleMags = getArray (configfile >> "cfgWeapons" >> _giveWep >> "magazines");
_mag = _possibleMags select 0;

_crateItems = [_walls,_supplies,_items] call BIS_fnc_selectRandom;

lastpack = time;
_textt = format ["\nPedido realizado. Informaremos quando estiver chegando!",10];
titleText [_textt,"PLAIN DOWN"];

sleep 5;

_message = format["%1 fez um pedido de Suprimentos!",_playerName];
[nil,nil,rTitleText,_message, "PLAIN",6] call RE;

_plane = createVehicle ["AN2_DZ", [0,0,500], [], 0, "FLY"];
_plane setVariable ["ObjectID", _objectID, true];
_plane setVariable ["ObjectUID", _objectID, true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _plane];
_plane engineOn true;
_plane flyInHeight 150;
_plane forceSpeed 175;

clearMagazineCargoGlobal _plane;
clearWeaponCargoGlobal _plane;

_aiGrp = creategroup east;

_pilot = _aiGrp createUnit ["SurvivorW2_DZ",getPos _plane,[],0,"FORM"];
_pilot moveindriver _plane;
_pilot assignAsDriver _plane;

_wp = _aiGrp addWaypoint [[_this select 0, (_this select 1), 150], 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
_wp_pos = waypointPosition [_aiGrp,1];

_pilot addWeapon 'NVGoggles';
_pilot addWeapon 'ItemCompass';
_pilot addWeapon 'ItemRadio';
_pilot addWeapon 'ItemMap';
_pilot addWeapon 'ItemGPS';

_loop = true;
_half = false;
_vixe = false;

while {_loop} do {
	if (!Alive _plane OR !Alive _pilot) then {
		sleep 5;
		deleteVehicle _plane;
		deleteVehicle _pilot;

		_textt1 = format ["\nO aviao de entrega foi abatido, entrega nao pode ser realizada!",10];
		titleText [_textt1,"PLAIN DOWN"];
		
		_loop = false;
		_vixe = true;
	};
	
	if ((Alive _plane) AND (Alive _pilot) AND ((_plane distance _wp_pos) <= 1500) AND (!(_half))) then {
				
		_textt2 = format ["\nO aviao de entrega de suprimentos esta a 1500 metros do local combinado!",10];
		titleText [_textt2,"PLAIN DOWN"];
		
		_plane forceSpeed 175;
		_plane flyInHeight 135;
		_plane setspeedmode "LIMITED";
		_half = true;
		_vixe = false;
	};
	
	if ((Alive _plane) AND (Alive _pilot) AND ((_plane distance _wp_pos) <= 150)) then {
	
		_dropDir = getDir _plane;
		_newPos = [(getPosATL _plane select 0) - 15*sin(_dropDir), (getPosATL _plane select 1) - 15*cos(_dropDir), (getPosATL _plane select 2) - 10];

		_textt3 = format ["\nO aviao de suprimentos chegou no local combinado e deixou a carga!",10];
		titleText [_textt3,"PLAIN DOWN"];
		
		_chute = createVehicle ["ParachuteMediumEast", _newPos, [], 0, "FLY"];
		_chutePos = getPos _chute;
		_box = createVehicle [_boxtype, _chutePos, [], 0, "FLY"];
		_box attachTo [_chute, [0, 0, 1]];
		_box setVariable ["ObjectID", "1"];
		_chute setVariable ["ObjectID", "1"];
		_smoke = "SmokeShellBlue" createVehicle (getPos _box);
		_smoke attachTo [_box, [0, 0, 0]];
												
		deleteWaypoint [_aiGrp, 1];
		_wp2 = _aiGrp addWaypoint [[0,0,150], 0];
		_wp2 setWaypointType "MOVE";
		_wp2 setWaypointBehaviour "CARELESS";
		_plane forceSpeed 350;
		_plane setSpeedmode "FULL";
		
		_loop = false;
		_vixe = false;
	};
};
	
if (_vixe) exitwith {
lastpack = time;
_vixe = false;

_message2 = format["O aviao de entrega dos suprimentos foi abatido!",_playerName];
[nil,nil,rTitleText,_message2, "PLAIN",6] call RE;
};

_var = floor((random 2) + 1);
lastpack = time;

_message2 = format["A entrega dos suprimentos foi realizada!",_playerName];
[nil,nil,rTitleText,_message2, "PLAIN",6] call RE;

waitUntil {getPos _box select 2 < 4};

detach _smoke;
detach _box;

while {getPos _box select 2 > 0} do {
_box setPos [getPos _box select 0, getPos _box select 1, (getPos _box select 2) - .25]
};

deleteVehicle _smoke;
deleteVehicle _chute;
_posATL = getPosATL _box;
deleteVehicle _box;
_boxx = _boxtype createVehicle _posATL;
_objectID = str(round(random 999999));
_boxx setVariable ["ObjectID", _objectID, true];
_boxx setVariable ["ObjectUID", _objectID, true];
_boxx setVariable ["permaLoot",true];
_smokex = "SmokeShellBlue" createVehicle (getPos _boxx);
_smokex attachTo [_boxx, [0, 0, 0]];
_objectID = str(round(random 999999));
_smokex setVariable ["ObjectID", _objectID, true];
_smokex setVariable ["ObjectUID", _objectID, true];
_lampx = "ASC_EU_BulbREDB" createVehicle (getPos _boxx);
_lampx attachTo [_boxx, [0, 0, 0.7]];
_objectID = str(round(random 999999));
_lampx setVariable ["ObjectID", _objectID, true];
_lampx setVariable ["ObjectUID", _objectID, true];

clearweaponcargoglobal _boxx;
clearmagazinecargoglobal _boxx;

{_boxx addMagazineCargoGlobal [_x, _var];} forEach _crateItems;
{_boxx addWeaponCargoGlobal [_x, 1];} forEach _tools;
_boxx addMagazineCargoGlobal [_mag, _var];
_boxx addWeaponCargoGlobal [_giveWep, 1];

uisleep 700;
deleteVehicle _lampx;
deleteVehicle _smokex;
deleteVehicle _boxx;

