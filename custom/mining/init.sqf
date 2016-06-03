notified = false;
_hasSledge =  false;

while {true} do {
	private ["_pos","_mineNodes","_inRange","_trigger","_hasSledge","_hasToolbox","_inventory","_currentWeapon"];
	
	_trigger = ["BeltBuckle_DZE"];
	_pos = getPosATL player;
	_mineNodes = (nearestObjects [_pos, _trigger, 15]);
	_inRange = count _mineNodes > 0;
	_inventory = items player;
	_currentWeapon = primaryWeapon player;
	_hasSledge = false;
	
	if ((_currentWeapon == "MeleeSledge") || ("ItemSledge" in _inventory)) then {
		_hasSledge=true;
	};
	_hasToolbox = 	"ItemToolbox" in _inventory;
	
	if (_inRange) then {
		if (!notified) then {
			cutText ['Area de mineracao: Para minerar voce deve ter uma TOOLBOX e equipar uma MARRETA.', 'PLAIN'];
			notified = true;
		};
	} else { notified = false; };


	if (_inRange && _hasToolbox && _hasSledge) then {
	
		if (s_player_mine < 0 && !isMining) then { s_player_mine = player addaction [("<t color=""#0074E8"">" + ("Minerar") +"</t>"),"custom\mining\start.sqf","",5,false,true,"",""]; };
	} else {
		player removeAction s_player_mine;
		s_player_mine = -1;
		isMining = false;
	};
	sleep 2;
};
