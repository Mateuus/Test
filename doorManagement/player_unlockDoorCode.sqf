private ["_display","_obj","_objectCharacterID"];

if(!isNil "DZE_DYN_UnlockDoorInprogress") exitWith { cutText [(localize "str_epoch_player_21") , "PLAIN DOWN"]; };

DZE_DYN_UnlockDoorInprogress = true;

if(!isNull dayz_selectedDoor) then {

	if (!isNil 'KeyCodeTryTimer') then {
		if(diag_tickTime > KeyCodeTryTimer) then {
			KeyCodeTry = nil;
			KeyCodeTryTimer = nil;
		};
	};

	_obj = dayz_selectedDoor;

	_notNearestPlayer = _obj call dze_isnearest_player;

	if (_notNearestPlayer) then {
		_display = findDisplay 51144;
		_display closeDisplay 3000;
		cutText [(localize "STR_EPOCH_ACTIONS_16"), "PLAIN DOWN"];
	} else {
	
		_objectCharacterID 	= _obj getVariable ["CharacterID","0"];

		if (DZE_Lock_Door == _objectCharacterID) then {

			[player,"combo_unlock",0,false] call dayz_zombieSpeak;

			_display = findDisplay 51144;
			_display closeDisplay 3000;

			if(_obj animationPhase "Open_hinge" == 0) then {
				_obj animate ["Open_hinge", 1];
			};

			if(_obj animationPhase "Open_latch" == 0) then {
				_obj animate ["Open_latch", 1];
			};
			KeyCodeTry = nil;

		} else {
		
			if(HarderPenalty)then{				
				titleCut ["","WHITE OUT",1];
				[player,"scream",0,false] call dayz_zombieSpeak;
				[player,20,true,(getPosATL player)] spawn player_alertZombies;
				titleCut ["","WHITE IN",1];
				_display = findDisplay 51144;
				_display closeDisplay 3000;

				if (isNil 'KeyCodeTry') then {KeyCodeTry = 0;};

				KeyCodeTry = KeyCodeTry + 1;

				if (!isNil 'KeyCodeTryTimer') then {KeyCodeTryTimer = diag_tickTime+60;};

				if(KeyCodeTry >= ((round(random 10)) + 4)) then {
			
				if (isNil 'KeyCodeTryTimer') then {KeyCodeTryTimer = diag_tickTime+60;};			
					cutText [(localize "str_epoch_player_19"), "PLAIN DOWN"];
					_display = findDisplay 46;
					_display closeDisplay 0;
				};
						
			}else{

				[10,10] call dayz_HungerThirst;

				DZE_Lock_Door = "";
				[player,"combo_locked",0,false] call dayz_zombieSpeak;
				[player,20,true,(getPosATL player)] spawn player_alertZombies;

				if (isNil 'KeyCodeTry') then {KeyCodeTry = 0;};

				KeyCodeTry = KeyCodeTry + 1;

				if (!isNil 'KeyCodeTryTimer') then {KeyCodeTryTimer = diag_tickTime+10;};

				if(KeyCodeTry >= ((round(random 4)) + 4)) then {
				
					if (isNil 'KeyCodeTryTimer') then {KeyCodeTryTimer = diag_tickTime+10;};
				
					cutText [(localize "str_epoch_player_19"), "PLAIN DOWN"];
					_display = findDisplay 51144;
					_display closeDisplay 3000;
				};			
			};
		};
	};
} else {
	
	_display = findDisplay 51144;
	_display closeDisplay 3000;
};
DZE_DYN_UnlockDoorInprogress = nil;
