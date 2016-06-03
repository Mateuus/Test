class RulesChoice
{
    idd = 845168;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['RulesChoice', _this select 0]";
    
    class Controls
    {
class CCD_Frame: RscFrame
{
	idc = -1;
	x = 0.296185 * safezoneW + safezoneX;
	y = 0.229437 * safezoneH + safezoneY;
	w = 0.407849 * safezoneW;
	h = 0.54302 * safezoneH;
};
class CCD_FrameBackGround: BOX
{
	idc = -1;
	x = 0.296185 * safezoneW + safezoneX;
	y = 0.229437 * safezoneH + safezoneY;
	w = 0.407849 * safezoneW;
	h = 0.54302 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
};
class CCD_HeaderBackGround: BOX
{
	idc = -1;
	x = 0.296711 * safezoneW + safezoneX;
	y = 0.229437 * safezoneH + safezoneY;
	w = 0.406797 * safezoneW;
	h = 0.0499941 * safezoneH;
	colorBackground[] = {0,0,0,9};
};
class CCD_TitleText: CCD_RscText
{
	idc = 1028;
	text = "Chernobyl";
	x = 0.465023 * safezoneW + safezoneX;
	y = 0.241462 * safezoneH + safezoneY;
	w = 0.0691217 * safezoneW;
	h = 0.0269461 * safezoneH;
	colorText[] = {1, 1, 1, 1.0};
	SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	font = "Zeppelin32";
	shadow = 1;
	colorShadow[] = {0, 0, 0, 0.5};
};
class CCD_Trader: CCD_RscButton
{
	idc = 1601;
	text = "Traders";
	x = 0.353381 * safezoneW + safezoneX;
	y = 0.475 * safezoneH + safezoneY;
	w = 0.0491365 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.176,0.329,0.564,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845168); ExecVM 'custom\Menu\rules\Traderinit.sqf';";
};
class CCD_Building: CCD_RscButton
{
	idc = 1602;
	text = "Bases";
	x = 0.473941 * safezoneW + safezoneX;
	y = 0.475 * safezoneH + safezoneY;
	w = 0.0501894 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.176,0.329,0.564,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845168); ExecVM 'custom\Menu\rules\Buildinginit.sqf';";
};
class CCD_General: CCD_RscButton
{
	idc = 1603;
	text = "Geral";
	x = 0.596606 * safezoneW + safezoneX;
	y = 0.474 * safezoneH + safezoneY;
	w = 0.0501894 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.176,0.329,0.564,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845168); ExecVM 'custom\Menu\rules\Generalinit.sqf';";
};

class CCD_close: CCD_RscButton
{
	idc = 4921;
	text = "Fechar";
	x = 0.508126 * safezoneW + safezoneX;
	y = 0.723 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.764,0.043,0.043,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845168);";
};
class CCD_MMButton: CCD_RscButton
{
	idc = 4921;
	text = "Main Menu";
	x = 0.429126 * safezoneW + safezoneX;
	y = 0.723 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.176,0.329,0.564,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845168); ExecVM 'custom\Menu\MenuInit.sqf';";
};
};
};
