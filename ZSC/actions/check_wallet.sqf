private ["_body", "_hisMoney", "_myMoney", "_name", "_PlayerNear", "_onLadder", "_test","_playeridke","_humanity"];

_body = _this select 3;

_PlayerNear = _body call dze_isnearest_player;
if (_PlayerNear) exitWith {cutText [localize "str_pickup_limit_4", "PLAIN DOWN"]};

_name = _body getVariable ["bodyName","unknown"];
_hisMoney = _body getVariable ["Chernobyl",0];
_myMoney = player getVariable ["Chernobyl",0];

_walletime = time;

r_interrupt = false; 
r_doLoop = true; 
_started = false;
_finished = false;

if ((_hisMoney == 0) or (_hisMoney >= 3)) then {
		while {r_doLoop} do {
			private ["_isMedic"];
			
			_hisMoney = _body getVariable ["Chernobyl",0];
			_animState = animationState player;
			_isMedic = ["medic",_animState] call fnc_inString;
			if (_hisMoney == 1) then {
				r_doLoop = false; 
			};
			if (_isMedic) then {
				_started = true;
			};
			if(!_isMedic && !r_interrupt && (time - _walletime) < 5) then {
				player playActionNow "Medic"; 
				_isMedic = true;
			};
			if (_started && !_isMedic && (time - _walletime) > 5) then {
				r_doLoop = false; 
				_finished = true;
			};
			if (r_interrupt) then {
				r_doLoop = false; 
			};
			sleep 0.1;
		};
		r_doLoop = false; 

		if(_finished) then {
			_myMoney = _myMoney + _hisMoney + 500;
			_body setVariable ["Chernobyl", 1 , true];
			if(typeName (_myMoney) == "SCALAR")then{
			    player setVariable ["Chernobyl", _myMoney , true];
			};
			systemChat format ['Tinha %1 coins na carteira e 500 de bonus. Nome na identidade %2 !',_hisMoney,_name];
		} else {
			if (_hisMoney == 1) then {
				systemChat format ['Carteira vazia. Nome na identidade %1 !',_name];
			} else {
				r_interrupt = false;
				player switchMove "";
				player playActionNow "stop";
				cutText [format["Voce nao quis olhar a carteira!"], "PLAIN DOWN"];
			};
			if (_hisMoney == 2) then {
				systemChat format ['Era um BOT. Nome na identidade %1 !',_name];
			} else {
				r_interrupt = false;
				player switchMove "";
				player playActionNow "stop";
				cutText [format["Voce nao quis olhar a carteira!"], "PLAIN DOWN"];
			};
		};
} else {
		if (_hisMoney == 1) then {
			player playActionNow "PutDown";
			sleep 2;
			systemChat format ['Carteira vazia. Nome na identidade %1 !',_name];
		};

		if (_hisMoney == 2) then {
			player playActionNow "PutDown";
			sleep 2;
			systemChat format ['Era um BOT. Nome na identidade %1 !',_name];
		};
};