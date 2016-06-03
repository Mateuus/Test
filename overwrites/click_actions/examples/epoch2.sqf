private ["_datsplay"];
servername = "Chernobyl";
disableSerialization;

_datsplay = findDisplay 106;
if(!(isNull _datsplay)) then {
    _datsplay closeDisplay 0;
};

"Dayz Epoch" hintC parseText format ["
<t size='1.0' shadow='1'align='left' color='#ff8800'>Guia de Craft Completo do Epoch. *Parte 2</t><br/>
<t size='.1' shadow='1'align='left' color='#FFFFFF'></t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>Flechas</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>WoodPile x1, Tesoura(Razor) x1.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>Suply Crate vazia</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Lumber x2, ScrapMetal x1.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>Wooden Shed(Galpao de madeira maior)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>CorrugatedFence x2, Plywood x4, Lumber x4.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>Wooden Shack(Galpaode madeira menor)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Plywood x4, Lumber x4.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>StickFence(Cerca de Galhos)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>WoodPile x6.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>SandbagNest(Fortificacao de Sandbag)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Sandbag x4, Plywood x2, Lumber x4.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>SunShade ('-' Uma cobertura para se proteger..."DO SOL")</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Canvas x1, Lumber x4.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>RustyGate(Portao de Metal)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>MetalPole x3, TankTrap x1.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>Outhouse(Banheiro '-')</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>CorrugatedFence x1, Plywood x3, Lumber x3, Papelhigienico x1.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>Storage Shed(Galpao de metal)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>CorrugatedFence x4, Plywood x2, Lumber x2.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>LightPole (Poste de luz)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Lampada x1, ScrapMetal x1, Lumber x6.</t><br/>",
(servername)];