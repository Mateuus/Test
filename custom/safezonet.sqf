USE_CANBUILD = true;
USE_POSITIONS = false;
USE_AI_REMOVER = true;
USE_AntiSteal = true;
USE_SIGNS = true;
LOG_EnterLeave = true;
_infiSZ =
[
        [[6110.6772,7737.7412,0],330,true],
        [[4063.4226,11664.19,0],160,true],
        [[11447.472,11364.504,0],160,true],
        [[1606.6443,7803.5156,0],160,true],
        [[12944.227,12766.889,0],160,true],
        [[12060.471,12638.533,0],180,true],
        [[4361.4937,2259.9526,0],30,true],
        [[13532.614,6355.9497,0],30,true],
        [[13293.614,6107.9497,0],30,true]
];
if (isServer) exitWith
{
        if (USE_SIGNS) then
        {
                {
                        _center = _x select 0;
                        _radius = _x select 1;
                        _lSign = _x select 2;
                        if (_lSign) then
                        {
                                for '_i' from 0 to 360 step (270 / _radius)*2 do
                                {
                                        _location = [(_center select 0) + ((cos _i) * _radius), (_center select 1) + ((sin _i) * _radius),0];
                                        _dir = ((_center select 0) - (_location select 0)) atan2 ((_center select 1) - (_location select 1));
                                        _object = createVehicle ['Sign_sphere100cm_EP1', _location, [], 0, 'CAN_COLLIDE'];
                                        _object setDir _dir;
                                };
                        };
                } forEach _infiSZ;
        };
};
waitUntil {((!isNil 'dayz_animalCheck') || (!isNil 'dayz_medicalH') || (!isNil 'dayz_slowCheck') || (!isNil 'dayz_gui'))};
if (isNil 'inSafeZone') then { inSafeZone = false; } else { if (typename inSafeZone != 'BOOL') then { inSafeZone = false; }; };
[_infiSZ] spawn {
        _infiSZ = _this select 0;
        _startSafeZone =
        {
                if (isNil 'outNow') then
                {
                        _msg = 'You entered a Safe Zone!';
                        hint _msg;
                        taskHint [_msg, [0,1,0,1], 'taskDone'];
                        inNow = nil;
                        outNow = true;
                       
                        if (LOG_EnterLeave) then
                        {
                                PVDZE_send = [player,'SafeZoneState',[1]];
                                publicVariableServer 'PVDZE_send';
                        };
                };
                player_fired = {
                        deleteVehicle (nearestObject [_this select 0,_this select 4]);
                        cutText ['You can not fire in a SafeZone!','WHITE IN'];
                };
                wild_spawnZombies = {};
                zombie_generate = {};
               
                fnc_usec_damageHandler = {};
                player removeAllEventHandlers 'handleDamage';
                player addEventHandler ['handleDamage', {false}];
                player allowDamage false;
                _veh = vehicle player;
                _szs = _veh getVariable ['inSafeZone',0];
                if (_szs == 0) then
                {
                        _veh setVariable ['inSafeZone',1,true];
                        if (player != _veh) then
                        {
                                _veh removeAllEventHandlers 'Fired';
                                _veh addEventHandler ['Fired', {_this call player_fired;}];
                                {
                                        _x removeAllEventHandlers 'Fired';
                                        _x addEventHandler ['Fired', {_this call player_fired;}];
                                } forEach (crew _veh);
                                vehicle_handleDamage = {false};
                                _veh removeAllEventHandlers 'HandleDamage';
                                _veh addeventhandler ['HandleDamage',{ _this call vehicle_handleDamage } ];
                                _veh allowDamage false;
                        };
                };
                _notInSafeZone =
                [
                        'MAAWS','RPG7V','M136','RPG18','STINGER',
                        'MeleeHatchet_DZE','MeleeHatchet','MeleeCrowbar','MeleeMachete','MeleeFishingPole','MeleeSledge',
                        'MeleeBaseBallBatNails','MeleeBaseBallBatBarbed','MeleeBaseBallBat'
                ];
                _cwep = currentWeapon player;
                if (_cwep in _notInSafeZone) then
                {
                        _swep = '';
                        {
                                if ((getNumber (configFile >> 'CfgWeapons' >> _x >> 'Type')) == 2) exitWith
                                {
                                        _swep = _x;
                                };
                        } forEach (weapons player);
                        if (_swep == '') then
                        {
                                player playActionNow 'PutDown';
                                _iPos = getPosATL player;
                                _radius = 1;
                                _removed = ([player,_cwep,1] call BIS_fnc_invRemove);
                                if (_removed == 1) then
                                {
                                        _item = createVehicle ['WeaponHolder', _iPos, [], _radius, 'CAN_COLLIDE'];
                                        _item addWeaponCargoGlobal [_cwep,1];
                                };
                        }
                        else
                        {
                                player selectweapon _swep;
                        };
                };
        };
        _endSafeZone =
        {
                if (isNil 'inNow') then
                {
                        if (str fnc_usec_damageHandler == '{}') then
                        {
                                _msg = 'You left the Safe Zone!';
                                hint _msg;
                                taskHint [_msg, [1,0,0.1,1], 'taskFailed'];
                        };
                        inNow = true;
                        outNow = nil;
                       
                        if (LOG_EnterLeave) then
                        {
                                PVDZE_send = [player,'SafeZoneState',[0]];
                                publicVariableServer 'PVDZE_send';
                        };
                };
                wild_spawnZombies = compile preprocessFileLineNumbers 'custom\walkers\wild_spawnZombies.sqf';
                zombie_generate = compile preprocessFileLineNumbers 'custom\walkers\zombie_generate.sqf';
               
               
                player_fired = {
                        _this call compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_fired.sqf';
                        _unit = _this select 0;
                        _weapon = _this select 1;
                        _muzzle = _this select 2;
                        _mode = _this select 3;
                        _ammo = _this select 4;
                        _magazine = _this select 5;
                        _projectile = _this select 6;
                        _screenToWorld = screenToWorld [0.5,0.5];
                        _near = _screenToWorld nearEntities ['AllVehicles',100];
                        {
                                if (isPlayer _x) then
                                {
                                        _szs = _x getVariable ['inSafeZone',0];
                                        if (_szs == 1) then
                                        {
                                                deleteVehicle (nearestObject [_unit,_ammo]);
                                        };
                                };
                        } forEach _near;
                };
               
                fnc_usec_unconscious = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_unconscious.sqf';
                object_monitorGear = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\object_monitorGear.sqf';
                vehicle_handleDamage = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\vehicle_handleDamage.sqf';
               
                _veh = vehicle player;
                _szs = _veh getVariable ['inSafeZone',0];
                if (_szs == 1) then
                {
                        _veh setVariable ['inSafeZone',0,true];
                        if (player != _veh) then
                        {
                                _veh removeAllEventHandlers 'HandleDamage';
                                _veh addeventhandler ['HandleDamage',{ _this call vehicle_handleDamage } ];
                                _veh allowDamage true;
                        };
                };
        };
        while {1 == 1} do
        {
                if (isNil 'inSafeZone') then { inSafeZone = false; } else { if (typename inSafeZone != 'BOOL') then { inSafeZone = false; }; };
                _state = false;
                if (isNil 'USE_POSITIONS') then { USE_POSITIONS = false; } else { if (typename USE_POSITIONS != 'BOOL') then { USE_POSITIONS = false; }; };
                if (USE_POSITIONS) then
                {
                        {
                                _z = _x select 0;
                                _r = _x select 1;
                                if ((vehicle player) distance _z < _r) then {_state = true;};
                        } forEach _infiSZ;
                };
                if (isNil 'USE_CANBUILD') then { USE_CANBUILD = true; } else { if (typename USE_CANBUILD != 'BOOL') then { USE_CANBUILD = true; }; };
                if (USE_CANBUILD) then
                {
                        if (isNil 'canbuild') then { canbuild = true; } else { if (typename canbuild != 'BOOL') then { canbuild = true; }; };
                        if (!canbuild) then {_state = true;};
                };
                if (_state) then
                {
                        inSafeZone = true;
                        call _startSafeZone;
                        {
                                if (!isNull _x) then
                                {
                                        if !(isPlayer _x) then
                                        {
                                                deletevehicle _x;
                                        };
                                };
                        } forEach ((vehicle player) nearEntities ['zZombie_Base',100]);
                       
                        if (isNil 'USE_AI_REMOVER') then { USE_AI_REMOVER = false; } else { if (typename USE_AI_REMOVER != 'BOOL') then { USE_AI_REMOVER = false; }; };
                        if (USE_AI_REMOVER) then
                        {
                                {
                                        if ((!isNull group _x) && (getPlayerUID _x == '')) then
                                        {
                                                deleteVehicle _x;
                                        };
                                } forEach (player nearEntities ['Man',150]);
                        };
                }
                else
                {
                        inSafeZone = false;
                };
                uiSleep 2;
                if (!inSafeZone) then
                {
                        call _endSafeZone;
                };
        };
};
if (USE_AntiSteal) then
{
        [] spawn {
                _USE_AntiSteal = USE_AntiSteal;
                while {1 == 1} do
                {
                        if (inSafezone) then
                        {
                                if (_USE_AntiSteal) then
                                {
                                        _cnt = {isPlayer _x && _x != player} count (player nearEntities [['CAManBase'],4]);
                                        if ((_cnt > 0) && (!isNull (findDisplay 106))) then
                                        {
                                                (findDisplay 106) closedisplay 0;
                                                closeDialog 0;closeDialog 0;closeDialog 0;
                                                _log = format['%1 You are not allowed to open Gear while near another player!',name player];
                                                cutText [_log,'PLAIN'];
                                                hint _log;
                                        };
                                };
                        }
                        else
                        {
                                uiSleep 2;
                        };
                        uiSleep .01;
                };
        };
};