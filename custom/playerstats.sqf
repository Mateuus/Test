[player,4,true,(getPosATL player)] spawn player_alertZombies;
 
if (isnil ("hotkey_hitme")) then {
    hotkey_hitme = 0;
};
if (hotkey_hitme == 1) then {
hotkey_hitme = 0;
titleText ["Debug Desativado, ira sumir em segundos","PLAIN DOWN"];titleFadeOut 2;
} else {
hotkey_hitme = 1;
titleText ["Debug Ativado","PLAIN DOWN"];titleFadeOut 2;
};

if ((getPlayerUID player) in ["0000"]) then {

} else {
while {sleep 1;hotkey_hitme == 1} do {
	_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
	_nearestCity = nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],750];
	_textCity = "Wilderness";
	if (count _nearestCity > 0) then {_textCity = text (_nearestCity select 0)};
	if (player == vehicle player) then {_pic = (getText (configFile >> 'CfgWeapons' >> (currentWeapon player) >> 'picture'));
	}else{_pic = (getText (configFile >> 'CfgVehicles' >> (typeOf vehicle player) >> 'picture'));};
	_stime = 0;
	if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
	_hours = (_stime/60/60);
	_hours = toArray (str _hours);
	_hours resize 1;
	_hours = toString _hours;
	_hours = compile _hours;
	_hours = call  _hours;
	_minutes = floor(_stime/60);
	_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if (_minutes2 < 10) then {_minutes2 = format['0%1',_minutes2];};
	
hintSilent parseText format ["
		<img size='5' image='%8'/><br/>
		<t size='0.95'		 font='Bitstream' align='center' color='#DDDDDD'>TS: 167.114.79.178:9994</t><br/>
		<br/>
		<t size='0.95'        font='Bitstream'align='left'>[%7]</t><t size='1.00'font='Bitstream'align='right'color='#FFFF00'>[FPS: %1]</t><br/>
		<t size='0.95'        font='Bitstream'align='left'>Players Online:</t><t size='0.95'font='Bitstream'align='right'color='#FFFF00'>%2</t><br/>
		<t size='0.95'        font='Bitstream'align='left'>Location:</t><t size='0.95'font='Bitstream'align='right'color='#FFFF00'>%9</t><br/>
		<t size='0.95'        font='Bitstream'align='left'>Heroes Killed:</t><t size='0.95'font='Bitstream'align='right'color='#FFFF00'>%3</t><br/>
		<t size='0.95'        font='Bitstream'align='left'>Bandits Killed:</t><t size='0.95'font='Bitstream'align='right'color='#FFFF00'>%4</t><br/>
		<t size='0.95'        font='Bitstream'align='left'>Zombies Killed:</t><t size='0.95'font='Bitstream'align='right'color='#FFFF00'>%5</t><br/>
		<t size='0.95'        font='Bitstream'align='left'>Headshots:</t><t size='0.95'font='Bitstream'align='right'color='#FFFF00'>%6</t><br/>
		<br/>
		<t size='0.95'        font='Bitstream'align='center' color='#FFBF00'>UPTIME: %10h %11min</t><br/>
		<br/>
		<t size='0.95'        font='Bitstream'align='center'>Tecle Insert para desligar o Painel</t><br/>
		<br/>
		<t size='0.95'        font='Bitstream'align='center'>Super</t><br/>
		<t size='0.95'        font='Bitstream'align='center'>Debugueitor Tabajara</t><br/>",
			
		(round diag_fps),
		(count playableUnits),
		player getVariable["humanKills",0],
		player getVariable["banditKills",0],
		player getVariable["zombieKills",0],
		player getVariable["headShots",0],
		(name player),
		_pic,
		_textCity,
		_hours,
		_minutes2
       
];};};