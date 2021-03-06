private ["_veh","_location","_isOk","_part_out","_part_in","_qty_out","_qty_in","_qty","_buy_o_sell","_obj","_objectID","_objectUID","_bos","_started","_finished","_animState","_isMedic","_dir","_helipad","_removed","_keyColor","_keyNumber","_keySelected","_isKeyOK","_config","_damage","_tireDmg","_tires","_okToSell","_hitpoints","_needed","_activatingPlayer","_textPartIn","_textPartOut","_traderID","_playerNear"];

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

if(_buy_o_sell == "buy") then {
	_qty = player getVariable ["Chernobyl",0];
} else {

if (_part_in isKindOf "Air") then {
		_obj = nearestObjects [(getPosATL player), [_part_in], dayz_sellDistance_air];
	} else {
		_obj = nearestObjects [(getPosATL player), [_part_in], dayz_sellDistance_vehicle];
	};
	_qty = count _obj;
	_bos = 1;
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
			if (_part_in isKindOf "AIR") then {
				_obj = nearestObjects [(getPosATL player), [_part_in], dayz_sellDistance_air];
			} else {
				_obj = nearestObjects [(getPosATL player), [_part_in], dayz_sellDistance_vehicle];
			};
			_qty = count _obj;	
		};

		if (_qty >= _qty_in) then {

			if (isNil "_obj") then { _obj = "Unknown Vehicle" };
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

					_keyColor = ["Green","Red","Blue","Yellow","Black"] call BIS_fnc_selectRandom;
					_keyNumber = (floor(random 2500)) + 1;
					_keySelected = format[("ItemKey%1%2"),_keyColor,_keyNumber];	
					_isKeyOK = isClass(configFile >> "CfgWeapons" >> _keySelected);
					_config = _keySelected;
					_isOk = [player,_config] call BIS_fnc_invAdd;

					waitUntil {!isNil "_isOk"};
					if (_isOk and _isKeyOK) then {
	
						_qtychange = _qty - _qty_in;
						player setVariable ["Chernobyl", _qtychange , true];	
						_newM = player getVariable ["Chernobyl",0];
						_removed = _qty - _newM;

						if(_removed == _qty_in) then {

							_dir = round(random 360);
							_helipad = nearestObjects [player, ["HeliHCivil","HeliHempty"], 100];

							if(count _helipad > 0) then {
								_location = (getPosATL (_helipad select 0));
							} else {
								_location = [(position player),0,20,1,0,2000,0] call BIS_fnc_findSafePos;
							};

							_veh = createVehicle ["Sign_arrow_down_large_EP1", _location, [], 0, "CAN_COLLIDE"];
							_location = (getPosATL _veh);

							PVDZE_veh_Publish2 = [_veh,[_dir,_location],_part_out,false,_keySelected,_activatingPlayer];
							publicVariableServer  "PVDZE_veh_Publish2";

							cutText [format[("Comprou %3 por %1 %2, Chave adicionada ao inventario."),_qty_in,_textPartIn,_textPartOut], "PLAIN DOWN"];

						} else {
							player removeMagazine _keySelected;
						};
					} else {
						cutText [(localize "str_epoch_player_107"), "PLAIN DOWN"];
					};
				} else {

					_obj = _obj select 0;
					_hitpoints = _obj call vehicle_getHitpoints;
					_okToSell = true;
					_tires = 0; 
					_tireDmg = 0;
					_damage = 0;

					{					
						if(["Wheel",_x,false] call fnc_inString) then {		
							_damage = [_obj,_x] call object_getHit;
							_tireDmg = _tireDmg + _damage;
							_tires = _tires + 1;
						};
					} forEach _hitpoints;

					if(_tireDmg > 0 and _tires > 0) then {
						if((_tireDmg / _tires) > 0.75) then {
							_okToSell = false;
						};
					};

					if(local _obj and !isNull _obj and alive _obj) then {

						if(_okToSell) then {

							_myMoney = player getVariable ["Chernobyl",0];
							_myMoney = _myMoney + _qty_out;
							player setVariable ["Chernobyl", _myMoney , true];

							_objectID 	= _obj getVariable ["ObjectID","0"];
							_objectUID	= _obj getVariable ["ObjectUID","0"];

							PVDZE_obj_Delete = [_objectID,_objectUID,_activatingPlayer];
							publicVariableServer "PVDZE_obj_Delete";

							deleteVehicle _obj; 

							cutText [format[(localize "str_epoch_player_181"),_qty_in,_textPartIn,_qty_out,_textPartOut], "PLAIN DOWN"];

						} else {

							cutText [format[(localize "str_epoch_player_182"),_textPartIn] , "PLAIN DOWN"];

						};
					} else {

						cutText [(localize "str_epoch_player_245"), "PLAIN DOWN"];

					};
				};
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
	if(_buy_o_sell == "buy") then {
		cutText [format["Voce precisa de %1 %2",_needed,_textPartIn] , "PLAIN DOWN"];
	} else {
		cutText [format[(localize "str_epoch_player_185"),_textPartIn] , "PLAIN DOWN"];
	};	
};

DZE_ActionInProgress = false;