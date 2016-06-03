private["_chance","_display"];
_display = findDisplay 106;
if(!(isNull _display)) then {
    _display closeDisplay 0;
};
 
_chance = floor(random 100);
if (("TrashTinCan" in magazines player) && ("PartGeneric" in magazines player) && ("ItemWire" in magazines player)) then {
    hasBowParts = true;
} else {
    hasBowParts = false;
};
if (hasBowParts) then {  
player playActionNow "Medic";
sleep 5;
titleText ["Voce esta fazendo um CrossBow.","PLAIN DOWN"]; titleFadeOut 5;
_dis=20;
_sfx = "repair";
[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
[player,_dis,true,(getPosASL player)] spawn player_alertZombies;
 
if (_chance > 45) then
    {
        player removeMagazine "TrashTinCan";
        player removeMagazine "PartGeneric";
        player removeMagazine "ItemWire";
        sleep 0.01;
        player addWeapon "Crossbow_DZ";
       
        titleText ["Voce conseguiu fazer um Crossbow.","PLAIN DOWN"]; titleFadeOut 5;
    }
else
    {

        _mypos = getPosASL player;
        _dir = getdir player;
        _mypos = [(_mypos select 0)+2*sin(_dir),(_mypos select 1)+2*cos(_dir), (_mypos select 2)];
        _createArrow = createVehicle ["WoodenArrow", _mypos, [], 0, "CAN_COLLIDE"];
        _createArrow setDir _dir;
        _createArrow setposASL _mypos;
        sleep 1;

    	player removeMagazine "TrashTinCan";
        player removeMagazine "PartGeneric";
        player removeMagazine "ItemWire";
        player removeWeapon "ItemKnife";
        sleep 0.01;
       
        titleText ["Voce nao conseguiu fazer o Crossbow. E acabou estragando sua faca.","PLAIN DOWN"]; titleFadeOut 5;
    };
}else{
		titleText ["Voce precisa de 1 x latinha, 1 x Scrapmetal, 1 x Wirefence e uma Faca para fazer um CrossBow!.","PLAIN DOWN"]; titleFadeOut 5;
};	
	
	
	
