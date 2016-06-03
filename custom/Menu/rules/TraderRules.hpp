class TraderRules
{
    idd = 845169;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['CCDTraderRules', _this select 0]";
    
class Controls
{
class CCD_Frame: RscFrame
{
	idc = -1;
	x = 0.295997 * safezoneW + safezoneX;
	y = 0.229 * safezoneH + safezoneY;
	w = 0.408182 * safezoneW;
	h = 0.546 * safezoneH;
};
class CCD_FrameBackGround: Box
{
	idc = -1;
	x = 0.295997 * safezoneW + safezoneX;
	y = 0.229 * safezoneH + safezoneY;
	w = 0.408182 * safezoneW;
	h = 0.546 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class CCD_HeaderBackgroundBox: Box
{
	idc = 1801;
	x = 0.296711 * safezoneW + safezoneX;
	y = 0.229437 * safezoneH + safezoneY;
	w = 0.406797 * safezoneW;
	h = 0.0499941 * safezoneH;
	colorBackground[] = {0,0,0,9};
};
class CCD_TitleText: CCD_RscText
{
	idc = 1000;
	text = "Chernobyl";
	x = 0.465023 * safezoneW + safezoneX;
	y = 0.241462 * safezoneH + safezoneY;
	w = 0.0543808 * safezoneW;
	h = 0.0259461 * safezoneH;
};
class CCD_RscText_1001: CCD_RscText
{
	idc = 1001;
	text = "Veiculos:-";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.303 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class CCD_RscText_1002: CCD_RscText
{
	idc = 1002;
	text = "Veiculos deixados dentro da trade serao teleportados para fora cada restart.";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.321 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class CCD_RscText_1004: CCD_RscText
{
	idc = 1004;
	text = "Roubos:-";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.356 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class CCD_RscText_1005: CCD_RscText
{
	idc = 1005;
	text = "Se voce jogou um item no chao, e alguem acabou pegando, nao e problema do Admin";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.375 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class CCD_RscText_1006: CCD_RscText
{
	idc = 1006;
	text = "Se alguem pegou seu veiculo apos ter passado o tempo de protecao, tbem nao eh.";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.393 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class CCD_RscText_1008: CCD_RscText
{
	idc = 1008;
	text = "Mortes:-";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.431 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class CCD_RscText_1021: CCD_RscText
{
	idc = 1021;
	text = "Se vc estiver chegando na trade e alguem estava saindo e te matou, DENUNCIE!";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class CCD_RscText_1009: CCD_RscText
{
	idc = 1009;
	text = "Se alguem te SEGUIU e antes de chegar a trade ele te matou, eh liberado.";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.448 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class CCD_RscText_1010: CCD_RscText
{
	idc = 1010;
	text = "Se vc estiver saindo da trade e alguem te matou, DENUNCIE!";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.486 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class CCD_RscText_1019: CCD_RscText
{
	idc = 1019;
	text = "PROIBIDO CAMPERAR TRADE!!!";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.523 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.016 * safezoneH;
};
class CCD_MMButton: CCD_RscButton
{
	idc = 1600;
	text = "Main Menu";
	x = 0.429126 * safezoneW + safezoneX;
	y = 0.723 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.176,0.329,0.564,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845171); ExecVM 'custom\Menu\MenuInit.sqf';";
};
class CCD_Close: CCD_RscButton
{
	idc = 1601;
	text = "Fechar";
	x = 0.508126 * safezoneW + safezoneX;
	y = 0.723 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.764,0.043,0.043,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845169);";
};
class CCD_RscText_1023: CCD_RscText
{
	idc = 1023;
	text = "  Trader Regras";
	x = 0.450776 * safezoneW + safezoneX;
	y = 0.284 * safezoneH + safezoneY;
	w = 0.0780918 * safezoneW;
	h = 0.016 * safezoneH;
};
};
};