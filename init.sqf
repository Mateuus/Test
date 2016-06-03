startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

dayZ_instance =	11;
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

player setVariable ["BIS_noCoreConversations", true];
enableRadio false;
enableSentences false;

DZE_vehicleAmmo = 0; 
DZE_SelfTransfuse = true;
DZE_ForceNameTags = true;
DZE_GodModeBase = true;
DZE_PlayerZed = false;
DZE_BuildingLimit = 300;
DZE_PlotPole = [65,130];
DZE_R3F_WEIGHT = false;
DZE_BackpackGuard = false;
DZE_DeathMsgTitleText = true;
DZE_MissionLootTable = true;
DZE_DeathMsgGlobal = true;
DZE_DeathMsgSide = true;
dayz_zedsAttackVehicles = false;
DZE_ConfigTrader = true;
enableEngineArtillery false; 

setTerrainGrid 25;

DefaultMagazines = ["ItemMorphine","ItemBandage","ItemBandage","8Rnd_9x18_Makarov","8Rnd_9x18_Makarov"];
DefaultWeapons = ["Makarov","ItemCompass","ItemMap","ItemHatchet_DZE","ItemRadio","ItemToolbox"];
DefaultBackpack = "DZ_Patrol_Pack_EP1";
DefaultBackpackWeapon = "";

don_playerGM = false;
spawnShoremode = 1;
spawnArea= 1500;

MaxVehicleLimit = 100;
MaxDynamicDebris = 100;
dayz_MapArea = 14000;
dayz_zedSpawnVehCount = 0;
dayz_poleSafeArea = 60;
dayz_paraSpawn = false;
dayz_maxLocalZombies = 5;

dayz_minpos = -1; 
dayz_maxpos = 16000;

dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;

MaxAmmoBoxes = 10;
MaxHeliCrashes = 10;
dayz_spawnselection = 0;
dayz_maxAnimals = 1;
dayz_tameDogs = true;
DynamicVehicleDamageLow = 0;
DynamicVehicleDamageHigh = 50;
DZE_LootSpawnTimer = 10;

DZE_BuildOnRoads = false;
DZE_noRotate = [];
DZE_curPitch = 45;
DZE_AllowCargoCheck = false;

ELE_MaxRange = 100;
ELE_Speed = 5;
ELE_StopWaitTime = 0;
ELE_RequiredBuildTools = ["ItemToolbox", "ItemCrowbar"];
ELE_RequiredBuildItems = [["PartGeneric",4], ["PartEngine",2], "ItemGenerator", "ItemJerrycan"];
ELE_RequiredBuildStopItems = [["PartGeneric",4], "PartEngine"];
ELE_StopClass = "MetalFloor_Preview_DZ";

	EpochEvents = [
	["any","any","any","any",30,"crash_spawner"],
	["any","any","any","any",0,"crash_spawner"],
	["any","any","any","any",25,"crash_spawner"],
	["any","any","any","any",15,"supply_drop"],
	["any","any","any","any",50,"supply_drop"]
	];
	
dayz_fullMoonNights = false;

call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";
call compile preprocessFileLineNumbers "custom\JAEM\variables.sqf";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "dayz_code\init\compiles.sqf";
call compile preprocessFileLineNumbers "custom\lock_god.sqf";
call compile preprocessFileLineNumbers "addons\bike\init.sqf";
call compile preprocessFileLineNumbers "overwrites\click_actions\init.sqf";
call compile preprocessFileLineNumbers "ZSC\gold\ZSCinit.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "logistic\init.sqf";
call compile preprocessFileLineNumbers "server_traders.sqf";
progressLoadingScreen 1.0;
stream_locationCheck = {
};
"filmic" setToneMappingParams [0.153, 0.157, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
    call compile preProcessFileLineNumbers "\z\addons\dayz_server\maps\Arena.sqf";    
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = [] execVM "\z\addons\dayz_code\system\player_monitor.sqf";
	#include "custom\mon.sqf"
	[] execVM "custom\markers\chernobyl3.sqf";
    execVM "spawn\start.sqf";
	_nil = [] execVM "custom\remote.sqf";
	[] execVM "NOS\nitro.sqf";
    call vehicleManager;
	_nil = [] execVM "custom\JAEM\EvacChopper_init.sqf";	
};

execVM "bangs.sqf";

{
_adminated = _x getVariable ["adminated",0];
if( !isNil "_adminated" &&  _adminated != 0)then{
_x setObjectTexture [0, "custom\admin.jpg"];
};
}forEach playableUnits;

#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"