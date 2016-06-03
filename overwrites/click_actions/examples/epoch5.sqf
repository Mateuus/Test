private ["_datsplay"];
servername = "Chernobyl";
disableSerialization;

_datsplay = findDisplay 106;
if(!(isNull _datsplay)) then {
    _datsplay closeDisplay 0;
};

"Dayz Epoch" hintC parseText format ["
<t size='1.0' shadow='1'align='left' color='#ff8800'>Guia "Minha Base, Minha Vida. *Parte 2</t><br/>
<t size='.1' shadow='1'align='left' color='#FFFFFF'></t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>GarageDoor com Lock(Porta de Garagem com Cadeado)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>GarageDoor x1, Cadeado x1.</t><br/>
<t size='.1' shadow='1'align='left' color='#FFFFFF'></t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>1/4 WoodFloor (1/4 Piso de madeira)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Lumber x3, Plywood x3.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>HalfWoodFloor (Meio Piso de madeira)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>1/4 WoodFloor x2.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>WoodFloor (Piso de madeira inteiro)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>HalfWoodFloor x2.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>WoodenLadder(Escada)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Lumber x8.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>WoodenStairs (Escadaria)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Lumber x8.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>WoodenStairsWithSupport (Escadaria com Suporte)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>WoodenStairs x1, Lumber x2.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>Escadaria com Corrimao</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>WoodenStairsWithSupport x1, Lumber x2.</t><br/>",
(servername)];