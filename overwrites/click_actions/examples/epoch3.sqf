private ["_datsplay"];
servername = "Chernobyl";
disableSerialization;

_datsplay = findDisplay 106;
if(!(isNull _datsplay)) then {
    _datsplay closeDisplay 0;
};

"Dayz Epoch" hintC parseText format ["
<t size='1.0' shadow='1'align='left' color='#ff8800'>Guia de Craft Completo do Epoch. *Parte 3</t><br/>
<t size='.1' shadow='1'align='left' color='#FFFFFF'></t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>DesertNet ou FlorestNet(Camuflagens)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>QualquerTenda x2, MetalPole x2.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>DesertNet(Grande)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>DesertNet(normal) x3.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>FlorestNet(Grande)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>FlorestNet(normal) x3.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>DeerStand(Torre de Madeira)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Lumber x8, WoodPile x2.</t><br/>",
(servername)];