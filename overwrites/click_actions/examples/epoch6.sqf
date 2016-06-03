private ["_datsplay"];
servername = "Chernobyl";
disableSerialization;

_datsplay = findDisplay 106;
if(!(isNull _datsplay)) then {
    _datsplay closeDisplay 0;
};

"Dayz Epoch" hintC parseText format ["
<t size='1.0' shadow='1'align='left' color='#ff8800'>Guia "Minha Base, Minha Vida. *Parte 3</t><br/>
<t size='.1' shadow='1'align='left' color='#FFFFFF'></t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>HalfCinderWall(Meio Muro de cinder)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>CinderBlocks x3, MortarBucket x1.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>CinderWall(Muro de cinder completo) use *Upgrade*</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Cinder Blocks x4, MortarBucket x1.</t><br/>
<t size='.1' shadow='1'align='left' color='#FFFFFF'></t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>CinderGarageDorway (Entrada de Garagem de cinder)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>CinderBlocks x3, MortarBucket x1, TankTrap x1.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>CinderGarageDoor (Garagem de cinder com Portao)*Upgrade*</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>MetalPole x3, TankTrap x3.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>CinderGarageDoorLocked (Garagem Com Lock)*Upgrade*</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Cadeado x1.</t><br/>
<t size='.1' shadow='1'align='left' color='#FFFFFF'></t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>CinderDoorway (Parede com Abertura da porta)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>CinderBlocks x4, MortarBucket x1, TankTrap x1.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>CinderDoor (Parede com Porta) *Upgrade*</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>MetalPole x3, TankTrap x3.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>CinderDoorLocked(Parede com porta e Lock)*Upgrade*</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Cadeado x1.</t><br/>
<t size='.1' shadow='1'align='left' color='#FFFFFF'></t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>MetalPanel(Painel de Metal)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>MetalPole x4, TankTrap x4.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>MetalFloor(Piso de Metal)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>MetalPanel x4.</t><br/>",
(servername)];