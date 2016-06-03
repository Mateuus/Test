private["_exitWith","_position","_display","_object","_handle"];

_exitWith = "nil";

disableSerialization;
_display = findDisplay 106;
if(!(isNull _display)) then {
    _display closeDisplay 0;
};

{
    if(_x select 0) exitWith {
        _exitWith = (_x select 1);
    };
} forEach [
    [(getPlayerUID player) in DZE_DEPLOYABLE_ADMINS,          "admin"],
    [!([player,_this] call getHasDeployableParts),     format["Voce precisa %1 para construir %2",str (_this call getDeployableParts),(_this call getDeployableDisplay)]],
    [!(call fnc_can_do),                               format["Nao pode construir um %1 agora.",(_this call getDeployableDisplay)]],
    [(player getVariable["combattimeout", 0]) >= time, format["Nao pode construir %1 enquanto estiver em combate!",(_this call getDeployableDisplay)]],
    [DZE_DEPLOYING,                                           "Voce ja esta construindo algo!"],
    [DZE_PACKING,                                             "Voce ja esta empacotando algo!"]
];

if(_exitWith != "nil" && _exitWith != "admin") exitWith {
    taskHint [_exitWith, DZE_COLOR_DANGER, "taskFailed"];
};

DZE_DEPLOYING = true;
DZE_DEPLOYING_SUCCESSFUL = false;
_handle = (_this call getDeployableClass) spawn player_deploy;
waitUntil{scriptDone _handle;};

DZE_DEPLOYING = false;
if(!DZE_DEPLOYING_SUCCESSFUL) then {
    taskHint ["Deploying Failed!", DZE_COLOR_DANGER, "taskFailed"];
} else {
    taskHint [format["You've built a %1!",(_this call getDeployableDisplay)], DZE_COLOR_PRIMARY, "taskDone"];

    sleep 10;

    if (!(_this call getPermanent)) then { 
        cutText ["Warning: Deployed vehicles DO NOT SAVE after server restart!", "PLAIN DOWN"]; 
    } else {
        cutText ["Objeto fixo. Se for uma metralhadora RELOGUE para poder utiliza-la!", "PLAIN DOWN"]; 
    };
};

