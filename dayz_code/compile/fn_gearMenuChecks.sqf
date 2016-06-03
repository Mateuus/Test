private ["_cTarget","_isOk","_display","_inVehicle","_isUnconscious"];
disableSerialization;
_display = (_this select 0);
_inVehicle = (vehicle player) != player;
_cTarget = cursorTarget;

_isUnconscious = player getVariable ["NORRN_unconscious",false];
if (_isUnconscious) exitWith {
	if (alive player) then {
		if (isPlayer player && _isUnconscious) then {
			_display closeDisplay 1;
			[player,25,true,(getPosATL player)] spawn player_alertZombies;
			systemChat ( "Voce esta Inconsciente." );
			player setVariable["combattimeout", time + 10, true];
			player setVariable["startcombattimer", 0];
			dayz_combat = 1; 
		};
	};
};

if(_inVehicle) then {
	_cTarget = (vehicle player);
};

_isOk = false;
{
	if(!_isOk) then {
		_isOk = _cTarget isKindOf _x;
	};
} count ["LandVehicle","Air", "Ship"];

if((locked _cTarget) && _isOk && (((vehicle player) distance _cTarget) < 12)) then {
	cutText [(localize "str_epoch_player_7") , "PLAIN DOWN"];
	_display closeDisplay 1;
};

if (isNil "inSafeZone") then {inSafeZone = false;};
if ((!canbuild || inSafeZone) and _cTarget isKindOf "Man" and alive _cTarget and (((vehicle player) distance _cTarget) < 12)) then {
	cutText ["Proibido acessar a gear de outros players na safe." , "PLAIN DOWN"];
	_display closeDisplay 1;
};

if (!canbuild) then {
	private ["_don_iscar","_don_ismycar","_don_crew"];
	_don_iscar = false; _don_ismycar = false;
	if (_cTarget isKindOf "LandVehicle" || _cTarget isKindOf "Air" || _cTarget isKindOf "Ship" ) then {
		_don_crew = _cTarget getVariable ["don_crew", nil]; if (isNil "_don_crew") then {_don_crew = [getPlayerUID player];};
		_don_iscar = true; if ((getPlayerUID player) in _don_crew) then {_don_ismycar = true;};
	};
	if (_don_iscar && !_don_ismycar) then {
		[objNull, player, rSAY, ["error1", 100]] call RE;
		cutText ["Voce nao pode acessar a gear deste veiculo!" , "PLAIN DOWN"];
		_display closeDisplay 1;
	};
};