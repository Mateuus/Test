closedialog 0;

_OnlineLimit = 1;
if(!(canbuild) || (inSafeZone)) exitWith { cutText ["\n\nVoce nao pode fazer um pedido em uma safe!" , "PLAIN DOWN"]; };
if (dayz_combat == 1) exitwith { cutText ["\n\nVoce esta em combate!", "PLAIN DOWN"] };
if ((count playableUnits) < _OnlineLimit) exitWith  { cutText [format["Menos do que %1 Players online. Impossivel fazer o pedido.",_OnlineLimit], "PLAIN DOWN"]; };

_LastUsedTime = 1800;
_Time = time - lastpack;

if(_Time < _LastUsedTime) exitWith { // If cooldown is not done then exit script
    cutText [format["Espere %1s antes de pedir outra caixa!",(round(_Time - _LastUsedTime))], "PLAIN DOWN"];
};

_cost = 2;
_itemUse = "ItemBriefCase100oz";
_hasBriefs = {_itemUse == _x} count (magazines player);

if (("ItemMap" in weapons player) || ("ItemGPS" in weapons player)) then {

if (_hasBriefs >= _cost) then {

for "_i" from 0 to _cost - 1 do {
player removeMagazine _itemUse;
};

disableSerialization;
_display = findDisplay 24;
(_display) closeDisplay 0;

titleText ["Clique no mapa no lugar desejado", "PLAIN DOWN"]; titleFadeOut 4;
openMap [true, false];
Map_pack = {
	_pos = [_this select 0, _this select 1, _this select 2] execVM "scripts\carepackage2\carepackage2.sqf";
	onMapSingleClick "";
	openMap [false, false];
};
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call Map_pack;";
lastpack = time;

} else {
_text = format ["\nVoce precisa de 2 Briefcases cheias!",10];
titleText [_text,"PLAIN DOWN"];
};

} else {
titleText ["voce precisa de um mapa para fazer isto", "PLAIN DOWN"]; titleFadeOut 4;
};
