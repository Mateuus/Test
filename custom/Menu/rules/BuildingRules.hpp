class BuildingRules
{
    idd = 845170;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['BuildingRules', _this select 0]";
    
    class Controls
    {
class RscFrame_1800: RscFrame
{
	idc = -1;
	x = 0.29547 * safezoneW + safezoneX;
	y = 0.229 * safezoneH + safezoneY;
	w = 0.408708 * safezoneW;
	h = 0.544 * safezoneH;
};
class CCD_BackgroundBox: BOX
{
	idc = -1;
	x = 0.29547 * safezoneW + safezoneX;
	y = 0.229 * safezoneH + safezoneY;
	w = 0.408708 * safezoneW;
	h = 0.544 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class CCD_Close: CCD_RscButton
{
	idc = 1600;
	text = "Fechar";
	x = 0.508126 * safezoneW + safezoneX;
	y = 0.723 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.764,0.043,0.043,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845170);";
};
class CCD_MMButton: CCD_RscButton
{
	idc = 1601;
	text = "Main Menu";
	x = 0.429126 * safezoneW + safezoneX;
	y = 0.723 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.176,0.329,0.564,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845170); ExecVM 'custom\Menu\MenuInit.sqf';";
};
class RscFrame_1801: BOX
{
	idc = 1801;
	x = 0.296711 * safezoneW + safezoneX;
	y = 0.229437 * safezoneH + safezoneY;
	w = 0.406797 * safezoneW;
	h = 0.0499941 * safezoneH;
	colorBackground[] = {0,0,0,9};
};
class RscText_1000: CCD_RscText
{
	idc = 1000;
	text = "Chernobyl";
	x = 0.465023 * safezoneW + safezoneX;
	y = 0.241462 * safezoneH + safezoneY;
	w = 0.0543808 * safezoneW;
	h = 0.0259461 * safezoneH;
};
class RscText_1001: CCD_RscText
{
	idc = 1001;
	text = "Construcoes de Cinder e Metal sao indestrutiveis. As de Madeira podem destruir";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1002: CCD_RscText
{
	idc = 1002;
	text = "Se um player for banido, a base dele e seus itens nela serao deletados mesmo que";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.47 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1013: CCD_RscText
{
	idc = 1013;
	text = " que ela seja dividida com amigos ou clan. Eh seu dever controlar seus amigos";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.49 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1043: CCD_RscText
{
	idc = 1043;
	text = "para que isto nao venha a acontecer.";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.51 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1014: CCD_RscText
{
	idc = 1014;
	text = "Proibido construir perto de trades(anti-jogo). Minimo de 1500 metros longe";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.38 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1020: CCD_RscText
{
	idc = 1020;
	text = "Camperar/atacar/roubar ITENS e VEICULOS de bases esta totalmente liberado";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.44 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1021: CCD_RscText
{
	idc = 1021;
	text = "Proibido REMOVER plotpole e tomar a base de outros para voce";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.41 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1025: CCD_RscText
{
	idc = 1025;
	text = "Proibido bases flutuantes e em predios do mapa, elas serao deletadas";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.35 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1003: CCD_RscText
{
	idc = 1003;
	text = "Construcoes";
	x = 0.460779 * safezoneW + safezoneX;
	y = 0.284 * safezoneH + safezoneY;
	w = 0.0780918 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1005: CCD_RscText
{
	idc = 1005;
	text = "Bases devem estar ao menos 1500m longe de zonas de Bots";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.54 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1019: CCD_RscText
{
	idc = 1019;
	text = "voce precisa mudar o conteudo do cofre sempre para evitar isto";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.62 * safezoneH + safezoneY;
	w = 0.405023 * safezoneW;
	h = 0.019 * safezoneH;
};
class RscText_1026: CCD_RscText
{
	idc = 1026;
	text = "outras construcoes que guardam items como caixas e tendas se nao forem";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.64 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1030: CCD_RscText
{
	idc = 1030;
	text = "Cofres resetam para 0000 depois de 15 dias e lockbox para vermelho00";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.60 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1032: CCD_RscText
{
	idc = 1032;
	text = "Bases devem estar a pelomenos 1500 metros longe dos pontos de Mineracao";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.57 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1033: CCD_RscText
{
	idc = 1033;
	text = "utilizadas por 15 dias tambem serao deletadas";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.66 * safezoneH + safezoneY;
	w = 0.405023 * safezoneW;
	h = 0.019 * safezoneH;
};
};
};