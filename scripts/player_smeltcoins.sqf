private ["_bars_count","_player_money","_max_bars","_emptySlots","_free_magazine_slots","_needed","_abort","_animState","_started","_finished","_isMedic","_rate"];

player removeAction s_smelt_coins;
s_smelt_coins = -1;
_type = _this select 3;

if (!(_type in ["ItemGoldBar", "ItemGoldBar10oz", "ItemBriefcase100oz"])) exitWith {};

if (isNil "SmeltingInProgress") then {
	SmeltingInProgress = false;
};

if (SmeltingInProgress) exitWith {
	cutText ["Ja esta em processo...", "PLAIN DOWN"];
};

SmeltingInProgress = true;

_bars_count = 0;

_player_money = player getVariable["Chernobyl",0];

if (_type == "ItemBriefcase100oz") then {
	_rate = SmeltingGoldBarsToCoinsRate * 100;
} else {
	if (_type == "ItemGoldBar10oz") then {
		_rate = SmeltingGoldBarsToCoinsRate * 10;
	} else {
		_rate = SmeltingGoldBarsToCoinsRate;
	};
};

_max_bars = floor(_player_money / _rate);

_emptySlots = [player] call BIS_fnc_invSlotsEmpty;
_free_magazine_slots = _emptySlots select 4;

// Check free space
if(_free_magazine_slots < 1) exitWith { 
	cutText ["Sem espaco no inventario.", "PLAIN DOWN"];
	SmeltingInProgress = false;
};

// Check player has money
if (_max_bars < 1) exitWith {
	_needed = _rate - _player_money;
	cutText [format["Voce precisa de mais %1 coins para fazer %3.",_needed,CurrencyName,_type] , "PLAIN DOWN"];
	SmeltingInProgress = false;
};

if (_max_bars > _free_magazine_slots) then {
	_max_bars = _free_magazine_slots;
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
		_player_wealth = player getVariable ["Chernobyl",0];
		if (_player_wealth >= _rate) then {
			player setVariable["Chernobyl",(_player_wealth - _rate),true];
			player addMagazine _type;
			_abort = false;
			cutText [format["Transformado %1 coins em %3",_rate,CurrencyName,_type], "PLAIN DOWN"];
		} else {
			_needed =  _rate - _player_wealth;
			cutText [format["Voce precisa de %1 coins para fazer %3.",_needed,CurrencyName,_type] , "PLAIN DOWN"];
			_abort = true;
		};
	};
	sleep 1;

	if(_abort) exitWith {};
};
SmeltingInProgress = false;