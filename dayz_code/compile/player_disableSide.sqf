private ["_randomnr"];
if ((ctrlText ((findDisplay 63) displayCtrl 101) != 'Side Channel')) exitWith {};
player_sideWarnings = player_sideWarnings + 1;
if (player_sideWarnings > 2) exitWith {
	"dynamicBlur" ppEffectEnable true;"dynamicBlur" ppEffectAdjust [2]; "dynamicBlur" ppEffectCommit 0;
	"colorCorrections" ppEffectEnable true;"colorCorrections" ppEffectEnable true;"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.1],  [1, 1, 1, 0.0]];"colorCorrections" ppEffectCommit 0;
	[player,0.01] call fnc_usec_damageUnconscious;
	player setVariable ["NORRN_unconscious", true, true];
	r_player_timeout = 300;
	r_player_unconscious = true;
	player setVariable["medForceUpdate",true,true];
	player setVariable ["unconsciousTime", r_player_timeout, true];
	_unit setHit["legs",1];
	[] spawn {
		cutText ["VOCE FOI AVISADO!","PLAIN DOWN"];
		uiSleep 1;
		endMission "END1";
	};
};
_nul = [objNull, player, rSAY, "playerWhite"] call RE;
_randomnr = [2,-1] call BIS_fnc_selectRandom;
1 cutText ["NAO FALE NO SIDE!","PLAIN DOWN"];
2 cutText ["NAO FALE NO SIDE!","PLAIN"];
systemChat ("NAO FALE NO SIDE!");