[] execVM "custom\safezonet.sqf";
[] execVM "custom\safezone.sqf";

if (!isDedicated) then {
	[] spawn compile preprocessFileLineNumbers "addons\dzgm\init.sqf";
	execVM "custom\switch\init.sqf"; 
	execVM "custom\map.sqf";
	execVM "custom\kill_msg.sqf";
	["elevator"] execVM "elevator\elevator_init.sqf";
	_nil = [] execVM "custom\JAEM\EvacChopper_init.sqf";	
	[] execVM "custom\weed\news.sqf";	
	[] execVM "custom\base_SafeArea.sqf";
	_picy = "custom\chernob.paa";
    [
    '<img align=''left'' size=''1.0'' shadow=''1'' image='+(str(_picy))+' />',
    safeZoneX+0.027,
    safeZoneY+safeZoneH-0.1,
    99999,
    0,
    0,
    3090
    ] spawn bis_fnc_dynamicText;
	[] execVM 'custom\mining\init.sqf';
	[] execVM "scripts\gambling\slotmachine\slots.sqf";
	
	[] execVM "service_point\service_point.sqf";
	nam_luces = [
		[[5606,7445],"Camp Splinter","ColorGreen","Camp"],
		[[2896, 4503],"Base Bor 7","ColorBlue","Headquarters"],
		[[9325, 11505],"Novy Bastion","ColorBlue","Headquarters"],
		[[4455, 8284],"Dichina Paste","ColorBlue","Headquarters"],
		[[6559, 14199],"Terminus (Bots)","ColorOrange","Headquarters"],
		[[7159, 9111],"Mina(PVP On)","ColorBlack","mil_dot"],
		[[3789, 2751],"Mina(PVP 0n)","ColorBlack","mil_dot"],
        [[7499, 3491],"Arena Eventos(PVP)","ColorRed","Headquarters"]		
	];
	{
		private ["_nam_doit"];
		_nam_doit = createMarker ["nam_mark_" + (_x select 1), _x select 0];
		_nam_doit setMarkerShape "Icon";
		_nam_doit setMarkerType (_x select 3);
		_nam_doit setMarkerText (_x select 1);
		_nam_doit setMarkerColor (_x select 2);
	} forEach nam_luces;
};

waitUntil {!isNil "DZE_safeVehicle"};
DZE_safeVehicle = DZE_safeVehicle + ["MMT_Civ","TT650_TK_EP1","TT650_Gue","M1030","Old_moto_TK_Civ_EP1","TT650_Civ","CSJ_GyroC","Old_bike_TK_INS_EP1","Old_bike_TK_CIV_EP1"];