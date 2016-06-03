class CCDConfirm
{
idd = 845172;
movingenable = true;
onLoad = "uiNamespace setVariable ['CCDConfirm', _this select 0]";
    
    class Controls
    {
class CCD_Frame: RscFrame
{
	idc = -1;
	x = 0.295996 * safezoneW + safezoneX;
	y = 0.229 * safezoneH + safezoneY;
	w = 0.408182 * safezoneW;
	h = 0.543 * safezoneH;
};
class CCD_HeaderBackGround: BOX
{
	idc = 1801;
	x = 0.296711 * safezoneW + safezoneX;
	y = 0.229437 * safezoneH + safezoneY;
	w = 0.406797 * safezoneW;
	h = 0.0499941 * safezoneH;
	colorBackground[] = {0,0,0,9};
};
class RscFrame_1801: Box
{
	idc = -1;
	x = 0.295996 * safezoneW + safezoneX;
	y = 0.229 * safezoneH + safezoneY;
	w = 0.408182 * safezoneW;
	h = 0.543 * safezoneH;
	colorBackground[] = {0,0,0,0.7};
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
class CCD_Yes: CCD_RscButton
{
	idc = 1600;
	text = "Sim";
	x = 0.508126 * safezoneW + safezoneX;
	y = 0.523 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.764,0.043,0.043,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845172); ExecVM 'custom\Menu\scripts\suicide.sqf';";
};
class CCD_No: CCD_RscButton
{
	idc = 1601;
	text = "Nao";
	x = 0.429126 * safezoneW + safezoneX;
	y = 0.523 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.015,0.705,0.015,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845172);";
};
class RscText_1001: CCD_RscText
{
	idc = 1001;
	text = "                Tem certeza que quer levar um choque ? ";
	x = 0.298103 * safezoneW + safezoneX;
	y = 0.424 * safezoneH + safezoneY;
	w = 0.403444 * safezoneW;
	h = 0.02 * safezoneH;
};
};
};