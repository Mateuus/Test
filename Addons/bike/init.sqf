call compile preprocessFileLineNumbers "addons\bike\config.sqf";
call compile preprocessFileLineNumbers "addons\bike\wrapper.sqf";
call compile preprocessFileLineNumbers "addons\bike\functions.sqf";

DZE_DEPLOYABLE_VERSION = "2.5.1";
DZE_CRV_DEPLOYABLE = 3;

diag_log text format["BIKE: loading version %1 ...",DZE_DEPLOYABLE_VERSION];

player_deploy = compile preprocessFileLineNumbers "addons\bike\player_deploy.sqf";

DZE_DEPLOYABLES = [];
{
    private["_class","_distance","_deployables","_packDist","_packOthers","_clearCargo","_clearAmmo","_permanent","_damage","_needNear","_parts","_requirePlot","_enableSim","_road","_condition"];
    _class       = _x select 0;
    _distance    = _x select 1;
    _packDist    = _x select 2;
    _damage      = _x select 3;
    _packOthers  = _x select 4;
    _clearCargo  = _x select 5;
    _clearAmmo   = _x select 6;
    _permanent   = _x select 7;
    _requirePlot = _x select 8;
    _enableSim   = _x select 9;
    _road        = _x select 10;
    _deployables = _x select 11;
    _needNear    = _x select 12;
    _parts       = _x select 13;
    _condition   = _x select 14;
    {
        DZE_DEPLOYABLES set [count DZE_DEPLOYABLES,[_class,_distance,_packDist,_damage,_packOthers,_clearAmmo,_permanent,_x,_needNear,_parts,_requirePlot,_enableSim,_road,_condition,_clearCargo]];
    } forEach _deployables;
} forEach DZE_DEPLOYABLES_CONFIG;

if (isServer) exitWith {
    diag_log text "BIKE: adding bike to safe vehicle list...";
    {
        DZE_safeVehicle = DZE_safeVehicle + [(_forEachIndex call getDeployableClass)];
        if(!(_forEachIndex call getDeployableSimulation)) then {
            dayz_allowedObjects set [count dayz_allowedObjects,(_forEachIndex call getDeployableClass)];
        };
    } forEach DZE_DEPLOYABLES;
};

[] spawn {

    call compile preprocessFileLineNumbers "overwrites\click_actions\init.sqf";
    if (!(isServer) && {isNil "DZE_CLICK_ACTIONS_BUILD"}) exitWith {
        diag_log text "BIKE: ERROR -- Click Actions Handler missing!";
    };
    if (!(isServer) && {DZE_CLICK_ACTIONS_BUILD != DZE_CRV_DEPLOYABLE}) exitWith {
        diag_log text format["BIKE: ERROR -- Click Actions Handler loaded build #%1! Required build #%2!",DZE_CLICK_ACTIONS_BUILD,DZE_CRV_DEPLOYABLE];
    };

    {DZE_CLICK_ACTIONS = DZE_CLICK_ACTIONS + [[(_forEachIndex call getDeployableKitClass),format["Deploy %1",(_forEachIndex call getDeployableDisplay)],format["%1 execVM 'addons\bike\deploy.sqf';",_forEachIndex],(_forEachIndex call getDeployableCondition)]];} forEach DZE_DEPLOYABLES;
    DZE_DEPLOYING      = false;
    DZE_PACKING        = false;
    
    DZE_COLOR_PRIMARY = [(51/255),(181/255),(229/255),1];
    DZE_COLOR_SUCCESS = [(153/255),(204/255),0,1];
    DZE_COLOR_DANGER  = [1,(68/255),(68/255),1];
    

    diag_log text "BIKE: waiting for login...";
    waitUntil{!isNil "PVDZE_plr_LoginRecord"};

    [] spawn {
        waitUntil {sm_done;};
        {
            if((local _x) && (parseNumber(_x getVariable["CharacterID","0"]) > 500000)) then {
                _x setVehicleLock "UNLOCKED";
            };
        } forEach (allMissionObjects "allVehicles");
    };

};