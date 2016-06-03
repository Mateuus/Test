private ["_datsplay"];
servername = "Chernobyl";
disableSerialization;

_datsplay = findDisplay 106;
if(!(isNull _datsplay)) then {
    _datsplay closeDisplay 0;
};

"Dayz Epoch" hintC parseText format ["
<t size='1.25' shadow='1'align='left' color='#ff8800'>Como Craftar armas de Tripe</t><br/>
<t size='.1' shadow='1'align='left' color='#FFFFFF'></t><br/>
<t size='1.0' shadow='1'align='left' color='#ff8800'>DhsKm Tripe</t><br/>
<t size='.8' shadow='1'align='left' color='#FFFFFF'>1 m107, 1 PDW, 1 Scrap Metal, 5 MetalPole.</t><br/>
<t size='.1' shadow='1'align='left' color='#FFFFFF'></t><br/>
<t size='1.0' shadow='1'align='left' color='#ff8800'>M2 Tripe</t><br/>
<t size='.8' shadow='1'align='left' color='#FFFFFF'>1 AS50, 1 PDW, 1 Scrap Metal, 5 MetalPole.</t><br/>
<t size='.1' shadow='1'align='left' color='#FFFFFF'></t><br/>
<t size='1.0' shadow='1'align='left' color='#ff8800'>M240 Nest</t><br/>
<t size='.8' shadow='1'align='left' color='#FFFFFF'>1 m240, 6 SandBags, 1 Desert net kit(camuflagem desert), 2 Lumber, 2 Plywood.</t><br/>
<t size='.1' shadow='1'align='left' color='#FFFFFF'></t><br/>
<t size='1.0' shadow='1'align='left' color='#ff8800'>Elevador</t><br/>
<t size='.8' shadow='1'align='left' color='#FFFFFF'>4 Scrap Metal, 2 Engine, 1 Gerador, 1 fuelcan</t><br/>
<t size='1.0' shadow='1'align='left' color='#ff8800'>Parada do elevador</t><br/>
<t size='.8' shadow='1'align='left' color='#FFFFFF'>4 Scrap Metal, 1 Engine</t><br/>",
(servername)];