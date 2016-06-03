private ["_Mining_Counter","_rand","_randGem","_hasSledge","_hasToolbox","_inventory","_currentWeapon","_mining_message","_has_free_space","_cursorTarget"];

isMining = true;
_has_free_space = true;
_cursorTarget = cursorTarget;
_mining_message = "";
systemChat("Comecou a minerar");

player removeAction s_player_mine;
s_player_mining = -1;

_currentWeapon = primaryWeapon player;

if (_currentWeapon == "MeleeSledge") then {	
	r_interrupt=false;
	
	while {isMining} do {
		_inventory = magazines player;
		_Mining_Counter=10;
		systemChat(_mining_message);
		[10,10] call dayz_HungerThirst;
		
		while {_Mining_Counter > 0} do {
			_cursorTarget = cursorTarget;
			if((r_interrupt)) exitWith { isMining=false };
			if ((currentWeapon player)!="MeleeSledge") exitWith {
				isMining = false;
				systemChat("A MARRETA tem que estar na mao.");
			};
			player playActionNow "GestureSwing";
			[objNull, player, rSAY, ["rockhit", 5]] call RE;
			sleep 1;
			_Mining_Counter = _Mining_Counter - 1;
			closeDialog 0;
		};

		if (isMining) then {
			private ["_rand","_randGem"];
			_rand = floor(random 100);
			
			if (_rand <= 50) then {
				_has_free_space=[player,"PartOre",false] call BIS_fnc_invAdd;
				_mining_message="Conseguiu 1 Iron ore.";
			};
			if (_rand <= 85 && _rand > 50) then {
				_has_free_space=[player,"PartOreSilver",false] call BIS_fnc_invAdd;
				_mining_message="Conseguiu 1 Silver ore.";
			};
			if (_rand <= 88 && _rand > 85) then {
				_randGem = floor(random 7);
				
				switch (_randGem) do {  
					case 0:
					{
						_has_free_space=[player,"ItemTopaz",false] call BIS_fnc_invAdd;
						_mining_message="Conseguiu 1 Topaz.";
					};
					case 1:
					{
						_has_free_space=[player,"ItemObsidian",false] call BIS_fnc_invAdd;
						_mining_message="Conseguiu 1 Obsidian.";
					};
					case 2:
					{
						_has_free_space=[player,"ItemSapphire",false] call BIS_fnc_invAdd;
						_mining_message="Conseguiu 1 Sapphire.";
					};
					case 3:
					{
						_has_free_space=[player,"ItemAmethyst",false] call BIS_fnc_invAdd;
						_mining_message="Conseguiu 1 Amethyst.";
					};
					case 4:
					{
						_has_free_space=[player,"ItemEmerald",false] call BIS_fnc_invAdd;
						_mining_message="Conseguiu 1 Emerald.";
					};
					case 5:
					{
						_has_free_space=[player,"ItemCitrine",false] call BIS_fnc_invAdd;
						_mining_message="Conseguiu 1 Citrine.";
					};
					case 6:
					{
						_has_free_space=[player,"ItemRuby",false] call BIS_fnc_invAdd;
						_mining_message="Conseguiu 1 Ruby.";
					};
				};
			};
			if (_rand <= 100 && _rand > 88) then {
				_has_free_space=[player,"PartOreGold",false] call BIS_fnc_invAdd;
				_mining_message="Conseguiu 1 Gold ore.";
			};
		} else {
			systemChat("Mineracao cancelada");
			player removeAction s_player_mining;
			s_player_mine = -1;		
		};
		
		if (!_has_free_space) exitWith {
			isMining = false;
			player removeAction s_player_mining;
			s_player_mine = -1;
			systemChat ("Inventario cheio.");
		}; 
	};
} else {
	systemChat("Voce deve ter sua MARRETA equipada para minerar!");
	isMining = false;
	player removeAction s_player_mining;
	s_player_mine = -1;		
};