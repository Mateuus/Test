private ["_part_out","_part_in","_qty_out","_qty_in","_qty","_bos","_bag","_class","_started","_finished","_animState","_isMedic","_num_removed","_needed","_activatingPlayer","_buy_o_sell","_textPartIn","_textPartOut","_traderID","_abort","_msg"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_103") , "PLAIN DOWN"]; };

DZE_ActionInProgress = true;

_activatingPlayer = player;
_part_out = (_this select 3) select 0;
_part_in = (_this select 3) select 1;
_qty_out = (_this select 3) select 2;
_qty_in = (_this select 3) select 3;
_buy_o_sell = (_this select 3) select 4;
_textPartIn = (_this select 3) select 5;
_textPartOut = (_this select 3) select 6;
_traderID = (_this select 3) select 7;
_bos = 0;
_abort = false;
_msg = "";

if(_buy_o_sell == "buy") then {
	_qty = player getVariable ["Chernobyl",0];
	_bag = unitBackpack player;
	_class = typeOf _bag;
	if(!isNil "_class") then {
		if(_class != "") then {
			_abort = true;
			_msg = "Drope ou venda sua mochila antes de comprar uma.";
		};
	};
} else {
	_bos = 1;
	_qty = 0;
	_bag = unitBackpack player;
	_class = typeOf _bag;
	if(_class == _part_in) then {
		_qty = 1;
	};
};

if (_abort) exitWith {
	cutText [_msg, "PLAIN DOWN"];
	DZE_ActionInProgress = false;
};

if (_qty >= _qty_in) then {

	cutText [(localize "str_epoch_player_105"), "PLAIN DOWN"];

	[1,1] call dayz_HungerThirst;

	private["_newPosition","_finished","_oldPosition"];
    if(isNil "_oldPosition") then { _oldPosition = position player;};
    _finished = false;
    sleep 2;
    if (player distance _oldPosition <= 1) then {
        _finished = true;
    };
    if (!_finished) exitWith {
        DZE_ActionInProgress = false;
        r_autoTrade = false;
        cutText [(localize "str_epoch_player_106") , "PLAIN DOWN"];
    };


	if (_finished) then {

		if(_buy_o_sell == "buy") then {
			_qty = player getVariable ["Chernobyl",0];
		} else {
			_qty = 0;
			_bag = unitBackpack player;
			_class = typeOf _bag;
			if(_class == _part_in) then {
				_qty = 1;
			};
		};

		if (_qty >= _qty_in) then {

			if (isNil "_bag") then { _bag = "Unknown Backpack" };
			if (isNil "inTraderCity") then {
				inTraderCity = "Unknown Trader"; 
			} else {
				if (inTraderCity == "Any") then {
					inTraderCity = "Unknown Trader"; 
				};
			};
			
			if (_bos == 1) then {
				PVDZE_obj_Trade = [_activatingPlayer,_traderID,_bos,_part_in,inTraderCity,CurrencyName,_qty_out];
			} else {
				PVDZE_obj_Trade = [_activatingPlayer,_traderID,_bos,_part_out,inTraderCity,CurrencyName,_qty_in];
			};

			publicVariableServer  "PVDZE_obj_Trade";

			waitUntil {!isNil "dayzTradeResult"};

			if(dayzTradeResult == "PASS") then {

				if(_buy_o_sell == "buy") then {

					_qtychange = _qty - _qty_in;
					player setVariable ["Chernobyl", _qtychange , true];
					_newM = player getVariable ["Chernobyl",0];

					_num_removed = _qty - _newM;

					if(_num_removed == _qty_in) then {
						removeBackpack player;
						player addBackpack _part_out;
					};
				} else {
				
					if((typeOf (unitBackpack player)) == _part_in) then {

						removeBackpack player;

						_myMoney = player getVariable ["Chernobyl",0];
						_myMoney = _myMoney + _qty_out;

						player setVariable ["Chernobyl", _myMoney , true];

					};
				};
				cutText [format[(localize "str_epoch_player_186"),_qty_in,_textPartIn,_qty_out,_textPartOut], "PLAIN DOWN"];
				{player removeAction _x} forEach s_player_parts;s_player_parts = [];
				s_player_parts_crtl = -1;
			} else {
				cutText [format[(localize "str_epoch_player_183"),_textPartOut] , "PLAIN DOWN"];
			};
			dayzTradeResult = nil;
		};
	};
} else {
	_needed =  _qty_in - _qty;
	cutText [format["Voce precisa de %1 %2",_needed,_textPartIn] , "PLAIN DOWN"];
};

DZE_ActionInProgress = false;