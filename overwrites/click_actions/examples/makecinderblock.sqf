private["_chance","_display"];

_display = findDisplay 106;
if(!(isNull _display)) then {
    _display closeDisplay 0;
};
 
_chance = floor(random 100);
if ("ItemSandbag" in magazines player && "MortarBucket" in magazines player) then {
    hasCinderParts = true;
} else {
    hasCinderParts = false;
};
if (hasCinderParts) then {  
player playActionNow "Medic";
sleep 1;
titleText ["Voce esta fazendo Cinder Blocks.","PLAIN DOWN"]; titleFadeOut 5;

	if (_chance > 25) then
		{
			_mypos = getPosASL player;
			_dir = getdir player;
			_mypos = [(_mypos select 0)+2*sin(_dir),(_mypos select 1)+2*cos(_dir), (_mypos select 2)];
			_createCinder = createVehicle ["CinderBlocks", _mypos, [], 0, "CAN_COLLIDE"];
			_createCinder setDir _dir;
			_createCinder setposASL _mypos;

			sleep 1;
		   
			player removeMagazine "MortarBucket";
			player removeMagazine "ItemSandbag";
			sleep 0.01;
		   
			titleText ["Cinder Block Feito.","PLAIN DOWN"]; titleFadeOut 5;
		}
	else
		{  
			titleText ["Voce fez a mistura errada e ferrou tudo..","PLAIN DOWN"]; titleFadeOut 5;
		};
}else{
	titleText ["Voce precisa de 1 x Mortar Bucket e 1x Sandbag para fazer Cinder blocks!.","PLAIN DOWN"]; titleFadeOut 5;
};