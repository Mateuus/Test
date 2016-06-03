private["_chance","_display"];
_display = findDisplay 106;
if(!(isNull _display)) then {
    _display closeDisplay 0;
};
 
_chance = floor(random 100);
if ("ItemCanvas" in magazines player) && ("ItemTrashToiletpaper" in magazines player) then {
    hasBandageParts = true;
} else {
    hasBandageParts = false;
};
if (hasBandageParts) then {  
player playActionNow "Medic";
sleep 1;
titleText ["Fazendo Bandagem...","PLAIN DOWN"]; titleFadeOut 5;

	if (_chance > 15) then
		{
			_mypos = getPosASL player;
			_dir = getdir player;
			_mypos = [(_mypos select 0)+2*sin(_dir),(_mypos select 1)+2*cos(_dir), (_mypos select 2)];
			_createBandage = createVehicle ["ItemBandage", _mypos, [], 0, "CAN_COLLIDE"];
			_createBandage setDir _dir;
			_createBandage setposASL _mypos;
			sleep 1;
			player removeMagazine "ItemCanvas";
			player removeMagazine "ItemTrashToiletpaper";
			sleep 0.01;
		   
			titleText ["Bandagem Feita.","PLAIN DOWN"]; titleFadeOut 5;
		}
	else
		{
			player removeMagazine "ItemCanvas";
			player removeMagazine "ItemTrashToiletpaper";
			sleep 0.01;
		   
			titleText ["Voce nao conseguiu fazer a bandagem e destruiu o material.","PLAIN DOWN"]; titleFadeOut 5;
		};
}else{
	titleText ["Voce precisa de 1 x Canvas e 1 x Papel higienico para fazer bandagem!.","PLAIN DOWN"]; titleFadeOut 5;
};
