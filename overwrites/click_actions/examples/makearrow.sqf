private["_chance","_display"];
_display = findDisplay 106;
if(!(isNull _display)) then {
    _display closeDisplay 0;
};
 
_chance = floor(random 100);
if ("PartWoodPile" in magazines player) then {
    hasArrowParts = true;
} else {
    hasArrowParts = false;
};
if (hasArrowParts) then {  
player playActionNow "Medic";
sleep 1;
titleText ["Craftando Flechas...","PLAIN DOWN"]; titleFadeOut 5;

	if (_chance > 25) then
		{
			_mypos = getPosASL player;
			_dir = getdir player;
			_mypos = [(_mypos select 0)+2*sin(_dir),(_mypos select 1)+2*cos(_dir), (_mypos select 2)];
			_createArrow = createVehicle ["WoodenArrowF", _mypos, [], 0, "CAN_COLLIDE"];
			_createArrow setDir _dir;
			_createArrow setposASL _mypos;
			_createArrow2 = createVehicle ["WoodenArrowF", _mypos, [], 0, "CAN_COLLIDE"];
			_createArrow2 setDir _dir;
			_createArrow2 setposASL _mypos;
			_createArrow3 = createVehicle ["WoodenArrowF", _mypos, [], 0, "CAN_COLLIDE"];
			_createArrow3 setDir _dir;
			_createArrow3 setposASL _mypos;
			sleep 1;
		   
			player removeMagazine "PartWoodPile";
			sleep 0.01;
		   
			titleText ["Flechas prontas.","PLAIN DOWN"]; titleFadeOut 5;
		}
	else
		{
			player removeMagazine "PartWoodPile";
			player setVariable["USEC_inPain",true,true];
			r_player_blood = r_player_blood - 1000;
			sleep 0.01;
		   
			titleText ["A madeira esta muito ruim para cortar. Voce acabou se machucando com a faca...","PLAIN DOWN"]; titleFadeOut 5;
		};
}else{
	titleText ["Voce precida de 1 x Wood Pile para fazer flechas!.","PLAIN DOWN"]; titleFadeOut 5;
};
