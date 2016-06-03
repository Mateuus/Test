private["_body", "_body_money", "_player_wealth"];

player removeAction s_take_cash;
s_take_cash = -1;

_body = _this select 3;
_body_money = _body getVariable["Chernobyl",0];

_player_wealth = player getVariable["Chernobyl",0];

_body setVariable["Chernobyl",0,true];

player setVariable["Chernobyl",(_player_wealth + _body_money),true];

cutText [format["Voce pegou %1 Coins.",_body_money], "PLAIN DOWN"];