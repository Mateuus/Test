private ["_datsplay"];
servername = "Chernobyl";
disableSerialization;

_datsplay = findDisplay 106;
if(!(isNull _datsplay)) then {
    _datsplay closeDisplay 0;
};

"Dayz Epoch" hintC parseText format ["
<t size='1.0' shadow='1'align='left' color='#ff8800'>Guia "Minha Base, Minha Vida. *Parte 1</t><br/>
<t size='.1' shadow='1'align='left' color='#FFFFFF'></t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>1/3 WoodWall</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Plywood x3, Lumber x3.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>WoodWall(normal)(Parede)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>1/3 WoodWall x3.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>WoodWallDoorFrame(parede com abertura da porta)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>WoodWall(normal) x1, Lumber x2.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>WoodWallWithDoor (Parede com Porta)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>WoodWallDoorFrame x1, Lumber x1, Plywood x1.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>SmallDoorLocked(Parede com porta e Lock)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>WoodWallWithDoor x1, Cadeado x1.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>WoodWall(grande)(Parede)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>WoodWall(normal) x1, Plywood x1, Lumber x1.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>LargeWallWindow(Parede com janela)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>WoodWall(grande) x1, Vidro x1.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>LargeDoorFrame(Parede grande com abertura de porta)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>WoodWall(grande) x1.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>LargeWallWithDoor(Parede grande com Porta)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>LargeDoorFrame x1, Lumber x1, Plywood x1.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>LargeWallWithdoorLocked(Parede grande com porta e Lock)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>LargeWallWithDoor x1, Cadeado x1.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>GarageDoor(Porta de Garagem)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Lumber x2, WoodWall(grande) x1.</t><br/>",
(servername)];