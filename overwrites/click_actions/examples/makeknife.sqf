private["_chance","_display"];

_display = findDisplay 106;
if(!(isNull _display)) then {
    _display closeDisplay 0;
};
 
_chance = floor(random 100);
if (("TrashTinCan" in magazines player) && ("ItemSodaEmpty" in magazines player)) then {
    hasKnifeParts = true;
} else {
    hasKnifeParts = false;
};
if (hasKnifeParts) then {   
player playActionNow "Medic";
sleep 5;
titleText ["Voce esta fazendo uma faca.","PLAIN DOWN"]; titleFadeOut 5;
_dis=20;
_sfx = "repair";
[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
[player,_dis,true,(getPosASL player)] spawn player_alertZombies;
 
if (_chance > 25) then
    {

        player removeMagazine "TrashTinCan";       
		player addWeapon "ItemKnife";
        player removeMagazine "ItemSodaEmpty";
		sleep 0.01;
       
        titleText ["Faca pronta.","PLAIN DOWN"]; titleFadeOut 5;
    }
else
    {
        player removeMagazine "TrashTinCan";
		player removeMagazine "ItemSodaEmpty";
		player setVariable["USEC_inPain",true,true];
        r_player_blood = r_player_blood - 500;
        sleep 0.01;
       
        titleText ["Voce cortou sua mao e estragou o material.","PLAIN DOWN"]; titleFadeOut 5;
    };
}else{
		 titleText ["Voce precisa 1 x Tincan e 1 x EmptySodaCan Para fazer uma faca!.","PLAIN DOWN"]; titleFadeOut 5;
};