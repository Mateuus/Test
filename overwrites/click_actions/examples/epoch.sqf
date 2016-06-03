private ["_datsplay"];
servername = "Chernobyl";
disableSerialization;

_datsplay = findDisplay 106;
if(!(isNull _datsplay)) then {
    _datsplay closeDisplay 0;
};

"Dayz Epoch" hintC parseText format ["
<t size='1.0' shadow='1'align='left' color='#ff8800'>Guia de Craft Completo do Epoch. *Parte 1</t><br/>
<t size='.1' shadow='1'align='left' color='#FFFFFF'></t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>Workbench</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Lumber x2, Plywood x1.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>Metal Pole</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Scrap Metal x2.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>Burlap (para fazer sandbag)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Canvas x2.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>Canvas</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Qualquer Skin (Roupa) x2.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>Corrugated Fence (uma cerca de metal)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Metal Pole x2, TankTrap x2, Lumber x2.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>Lumber</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>WoodPile x2.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>Plywood</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Lumber x2.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>SandBag (normal)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Burlap x3.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>Sandbag Grande (H-Barrier)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Sandbag x3, WireFence x1, TankTrap x1.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>Tenda (pequena)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Canvas x2, MetalPole x2.</t><br/>
<t size='.8' shadow='1'align='left' color='#ff8800'>Tenda (maior)</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'>Canvas x3, MetalPole x3.</t><br/>",
(servername)];