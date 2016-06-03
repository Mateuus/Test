if (!isServer) then {
        [] spawn {
                waitUntil {!isNil 'dayz_animalCheck'};
                _antiWall = {
                        private ['_vehicle','_vehiclePos','_playerPos','_activated','_id','_intersectsWith'];
                        _activated = false;
                        _vehicle = _this;
                        _vehiclePos = aimpos _vehicle;
                        _playerPos = visiblePositionASL player;
                        if((_playerPos distance _vehiclePos) > 10) exitWith {};
                        _playerPos set [2,(_playerPos select 2)+1];
                        _intersectsWith = lineIntersectsWith [_playerPos, _vehiclePos, player, _vehicle];
                        if ((count _intersectsWith) > 0) then
                        {
                                {
                                        if ((typeOf _x) == '' and {['Wall_DZ', str _x, false] call fnc_inString}) exitWith {
                                                _activated = true;
                                        };
                                        if ((typeOf _x) == '' and {['DoorLocked_DZ', str _x, false] call fnc_inString}) exitWith {
                                                _activated = true;
                                        };
                                        if ((typeOf _x) == '' and {['Floor_DZ', str _x, false] call fnc_inString}) exitWith {
                                                _activated = true;
                                        };
                                } forEach _intersectsWith;
                        };
                        if(_activated) then {
                                _vehiclePos set [2,0];
                                player setPos _vehiclePos;
                        };
                };
                while {1 == 1} do
                {
                        (vehicle player) call _antiWall;
                        sleep 0.5;
                };
        };
};