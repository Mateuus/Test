private ["_datsplay"];
servername = "Chernobyl";
disableSerialization;

_datsplay = findDisplay 106;
if(!(isNull _datsplay)) then {
    _datsplay closeDisplay 0;
};

"Dayz Epoch" hintC parseText format ["
<t size='1.25' shadow='1'align='left' color='#ff8800'>Bem Vindo ao %1</t><br/>
<t size='.7' shadow='1'align='left' color='#FFFFFF'></t><br/>
<t size='.8' shadow='1'align='left' color='#FFFFFF'>O servidor reinicia a cada 4 horas.</t><br/>
<t size='.8' shadow='1'align='left' color='#FFFFFF'>teamspeak : ts480.gametalk.com.br:9994</t><br/>
<t size='.8' shadow='1'align='left' color='#FFFFFF'>Os HQs sao missoes fixas. Recomendamos nao ir no Terminus sozinho</t><br/>
<t size='.8' shadow='1'align='left' color='#FFFFFF'>Os Traders sao customizados e com mais Armas, Veiculos e Helicopteros.</t><br/>
<t size='.8' shadow='1'align='left' color='#FFFFFF'>Venda as Pedras Preciosas no Minerador.</t><br/>
<t size='.8' shadow='1'align='left' color='#FFFFFF'>Cinder blocks indestrutiveis, apenas Woods sao destrutiveis e liberaros para saques.</t><br/>
<t size='.8' shadow='1'align='left' color='#FFFFFF'>Todas as Tradezones tem God mode.</t><br/>
<t size='.8' shadow='1'align='left' color='#FFFFFF'>PVP e Camperar Base Totalmente Liberado.</t><br/>
<t size='.8' shadow='1'align='left' color='#FFFFFF'>Construcoes em Cherno,Eletro,Balota e Aeroportos serao deletadas.</t><br/>
<t size='.8' shadow='1'align='left' color='#FFFFFF'>Leia mais sobre as regras em nosso site (chernobylserver.enjin.com) </t><br/>
<t size='.8' shadow='1'align='left' color='#FFFFFF'>Servidor com varios mods: Suas sugestoes sao sempre bem vindas.</t><br/>
<t size='.8' shadow='1'align='left' color='#FFFFFF'>Tenha um bom jogo!</t><br/>",
(servername)];