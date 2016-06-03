class GeneralRules
{
    idd = 845171;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['GeneralRules', _this select 0]";

    class Controls
    {
class CCD_Frame: RscFrame
{
	idc = -1;
	x = 0.296523 * safezoneW + safezoneX;
	y = 0.229 * safezoneH + safezoneY;
	w = 0.408708 * safezoneW;
	h = 0.544 * safezoneH;
};
class CCD_BackGround: BOX
{
	idc = -1;
	x = 0.296523 * safezoneW + safezoneX;
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
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845171);";
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
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845171); ExecVM 'custom\Menu\MenuInit.sqf';";
};
class CCD_HeaderBackGround: RscFrame
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
	text = "No Hacking: -";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.303 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1002: CCD_RscText
{
	idc = 1002;
	text = "Sem dupe de qualquer forma, se for pego dupando sera BAN permanente";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.391 * safezoneH + safezoneY;
	w = 0.406603 * safezoneW;
	h = 0.018 * safezoneH;
};
class RscText_1014: CCD_RscText
{
	idc = 1014;
	text = "Se vc encontrou items suspeitos, por favor reporte para algum Adm no TS.";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.338 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1020: CCD_RscText
{
	idc = 1020;
	text = "Dupe:-";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.374 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1025: CCD_RscText
{
	idc = 1025;																			\
	text = "Hacking de qualquer tipo nao sera tolerado, ate mesmo aceitar items de um.";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class CCD_TitleText: CCD_RscText
{
	idc = 1003;
	text = "General Rules";
	x = 0.460779 * safezoneW + safezoneX;
	y = 0.284 * safezoneH + safezoneY;
	w = 0.0780918 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1005: CCD_RscText
{
	idc = 1005;
	text = "Glitches:-";
	x = 0.298102 * safezoneW + safezoneX;
	y = 0.424 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1019: CCD_RscText
{
	idc = 1019;
	text = "Muito cuidado ao sair do jogo, se estiver em combate podera morrer sem";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.509 * safezoneH + safezoneY;
	w = 0.405023 * safezoneW;
	h = 0.019 * safezoneH;
};
class RscText_1023: CCD_RscText
{
	idc = 1023;
	text = "recebera um ban de 2 dias, e se for pego denovo sera permanente.";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.459 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1026: CCD_RscText
{
	idc = 1026;
	text = "nenhum aviso previo.";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.529 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1030: CCD_RscText
{
	idc = 1030;
	text = "Sem CombatLog:-";
	x = 0.29863 * safezoneW + safezoneX;
	y = 0.492 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class RscText_1032: CCD_RscText
{
	idc = 1032;
	text = "Se for visto tentando usar qualquer glitch para entrar na base de alguem,";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.442 * safezoneH + safezoneY;
	w = 0.407129 * safezoneW;
	h = 0.02 * safezoneH;
};
class RscText_1033: CCD_RscText
{
	idc = 1033;
	text = "Sem Racismo:-";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.563 * safezoneH + safezoneY;
	w = 0.405023 * safezoneW;
	h = 0.019 * safezoneH;
};
class RscText_1034: CCD_RscText
{
	idc = 1034;
	text = "Qualquer tipo de racismo a player ou admin, resultara em Ban permanente";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.582 * safezoneH + safezoneY;
	w = 0.405023 * safezoneW;
	h = 0.019 * safezoneH;
};
class RscText_1036: CCD_RscText
{
	idc = 1036;
	text = "Sem Kamikazes:-";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.616 * safezoneH + safezoneY;
	w = 0.405023 * safezoneW;
	h = 0.019 * safezoneH;
};
class RscText_1037: CCD_RscText
{
	idc = 1037;
	text = "Isso inclui kamikase no AR em BASES em PLAYERS e VEICULOS em geral";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.632 * safezoneH + safezoneY;
	w = 0.405023 * safezoneW;
	h = 0.019 * safezoneH;
};
};
};