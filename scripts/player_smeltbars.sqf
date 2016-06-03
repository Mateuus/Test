private ["_bars_count","_max_bars","_abort","_animState","_started","_finished","_isMedic","_rate"];

player removeAction s_smelt_bars;
s_smelt_bars = -1;
player removeAction s_smelt_10bars;
s_smelt_10bars = -1;
player removeAction s_smelt_brif;
s_smelt_brif = -1;

_type = _this select 3;
	
if (!(_type in ["ItemGoldBar", "ItemGoldBar10oz", "ItemBriefcase100oz"])) exitWith {};

if (isNil "SmeltingInProgress") then {
	SmeltingInProgress = false;
};

if (SmeltingInProgress) exitWith {
	cutText ["Ja esta em progresso...", "PLAIN DOWN"];
};

if (_type == "ItemBriefcase100oz") then {
	_rate = SmeltingGoldBarsToCoinsRate * 100;
} else {
	if (_type == "ItemGoldBar10oz") then {
		_rate = SmeltingGoldBarsToCoinsRate * 10;
	} else {
		_rate = SmeltingGoldBarsToCoinsRate;
	};
};

SmeltingInProgress = true;

_bars_count = 0;

_max_bars = {_x == _type} count magazines player;

// Check player has gold bars
if(_max_bars < 1) exitWith { 
	cutText ["Nao tem nenhum Gold no seu inventario.", "PLAIN DOWN"];
	SmeltingInProgress = false;
};

_abort = false;

for "_x" from 1 to _max_bars do {
	_bars_count = _bars_count + 1;
	if(_max_bars == 1) then { 
		cutText ["Transformando, fique parado para continuar." , "PLAIN DOWN"];
	} else {
		cutText [format["Transformando, fique parado para continuar %1 de %2 %3.",_bars_count,_max_bars,_type] , "PLAIN DOWN"];
	};

	player playActionNow "Medic";

	r_interrupt = false;
	_animState = animationState player;
	r_doLoop = true;
	_started = false;
	_finished = false;

	while {r_doLoop} do {
		_animState = animationState player;
		_isMedic = ["medic",_animState] call fnc_inString;
		if (_isMedic) then {
			_started = true;
		};
		if (_started and !_isMedic) then {
			r_doLoop = false;
			_finished = true;
		};
		if (r_interrupt) then {
			r_doLoop = false;
		};
		sleep 0.1;
	};
	r_doLoop = false;

	if (!_finished) exitWith { 
		r_interrupt = false;
		if (vehicle player == player) then {
			[objNull, player, rSwitchMove,""] call RE;
			player playActionNow "stop";
		};
		cutText ["Processo cancelado." , "PLAIN DOWN"];
	};

	if (_finished) then {
		_removed = [player,_type,1] call BIS_fnc_invRemove;
		if (_removed > 0) then {
			_player_wealth = player getVariable ["Chernobyl",0];
			player setVariable["Chernobyl",(_player_wealth + _rate),true];
			cutText [format["Transformou %3 em %1 coins", _rate, CurrencyName,_type], "PLAIN DOWN"];
		} else {
			cutText ["Algo deu errado. Gold nao removido do inventario", "PLAIN DOWN"];
			_abort = true;
		};
	};
	sleep 1;

	if(_abort) exitWith {};
};
SmeltingInProgress = false;