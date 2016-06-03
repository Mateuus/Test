if (player != leader group player) exitWith {systemChat "You are not the leader and can not invite people.";};

disableSerialization;

private ["_dialog","_playerListBox","_pTarget","_index","_playerData","_check","_hasInvite"];

_dialog = findDisplay 55510;
_playerListBox = _dialog displayCtrl 55511;
_index = lbCurSel _playerListBox;
_playerData = _playerListBox lbData _index;
_hasInvite = false;
_check = 0;
{
	if ((!isNull _x) && {isPlayer _x} && {str(_x) == _playerData}) exitWith {_pTarget = _x;_check = 1;};
} count playableUnits;

if (_check == 0) exitWith {systemChat "Primeiro selecione alguem para convidar.";};
if (_pTarget == player) exitWith {systemChat "Voce nao pode convidar a si mesmo.";};
if (count units group _pTarget > 1) exitWith {systemChat "Este jogador ja esta em um grupo.";};

{if (_x select 1 == getPlayerUID _pTarget) then {_hasInvite = true;};} forEach currentInvites;
if (_hasInvite) exitWith {systemChat "This player already has a pending invite.";};
currentInvites set [count currentInvites,[getPlayerUID player,getPlayerUID _pTarget]];
publicVariableServer "currentInvites";

[nil,_pTarget,"loc", rTITLETEXT, format["Voce recebeu um convite de Grupo. Clique no radio para ver."], "PLAIN", 0] call RE;

systemChat format["Voce convidou %1 Para entrar no grupo",name _pTarget];
systemChat "Use a tecla windows esquerda para ligar os icones de player";