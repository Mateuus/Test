class CCDMenu
{
    idd = 845167;
    movingenable = true;
    onLoad = "uiNamespace setVariable ['CCDMenu', _this select 0]";
    
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
class CCD_Div1: Box
{
	idc = -1;
	x = 0.362458 * safezoneW + safezoneX;
	y = 0.278541 * safezoneH + safezoneY;
	w = 0.0041245 * safezoneW;
	h = 0.492916 * safezoneH;
	colorBackground[] = {0,0,0,9};
};
class CCD_ActionsHeader: CCD_RscText
{
	idc = -1;
	text = "Actions";
	x = 0.310016 * safezoneW + safezoneX;
	y = 0.295575 * safezoneH + safezoneY;
	w = 0.0391411 * safezoneW;
	h = 0.0219356 * safezoneH;
};
class CCD_Div2: BOX
{
	idc = -1;
	x = 0.633335 * safezoneW + safezoneX;
	y = 0.278541 * safezoneH + safezoneY;
	w = 0.0041245 * safezoneW;
	h = 0.492916 * safezoneH;
	colorBackground[] = {0,0,0,9};
};
class CCD_DEployHeader: CCD_RscText
{
	idc = -1;
	text = "Deploys";
	x = 0.643328 * safezoneW + safezoneX;
	y = 0.295575 * safezoneH + safezoneY;
	w = 0.0643944 * safezoneW;
	h = 0.0219356 * safezoneH;
};
class CCD_DIVTop: Box
{
	idc = -1;
	x = 0.296185 * safezoneW + safezoneX;
	y = 0.317621 * safezoneH + safezoneY;
	w = 0.40785 * safezoneW;
	h = 0.00550045 * safezoneH;
	colorBackground[] = {0,0,0,9};
};
class CCD_Rules: CCD_RscButton
{
	idc = 1600;
	text = "Regras";
	x = 0.302497 * safezoneW + safezoneX;
	y = 0.351691 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.176,0.329,0.564,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845167); ExecVM 'custom\Menu\RulesInit.sqf';";
};
class CCD_Group: CCD_RscButton
{//55615
	idc = 1601;
	text = "Grupo";
	x = 0.302497 * safezoneW + safezoneX;
	y = 0.407306 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.176,0.329,0.564,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845167); groupManagementActive = false; [] execVM 'addons\dzgm\loadGroupManagement.sqf';";
};
class CCD_EarPlugs: CCD_RscButton
{
	idc = 1602;
	text = "Fones";
	x = 0.302497 * safezoneW + safezoneX;
	y = 0.462921 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.176,0.329,0.564,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845167); ExecVM 'custom\Menu\scripts\Earplugs.sqf';";
};
class CCD_Suicide: CCD_RscButton
{
	idc = 1603;
	text = "Suicidar";
	x = 0.302497 * safezoneW + safezoneX;
	y = 0.518536 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.176,0.329,0.564,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845167); ExecVM 'custom\Menu\SuicideInit.sqf';";
};
class CCD_ForceSave: CCD_RscButton
{
	idc = 1603;
	text = "Salvar";
	x = 0.302497 * safezoneW + safezoneX;
	y = 0.574151 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.176,0.329,0.564,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845167); ExecVM 'custom\Menu\scripts\SavePlayer.sqf';";
};
class CCD_Gramaon: CCD_RscButton
{
	idc = 1664;
	text = "Grama On";
	x = 0.302497 * safezoneW + safezoneX;
	y = 0.629766 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.015,0.705,0.015,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845167); setTerrainGrid 25; systemChat('Grama Ligada');";
};
class CCD_Gramaoff: CCD_RscButton
{
	idc = 1665;
	text = "Grama Off";
	x = 0.302497 * safezoneW + safezoneX;
	y = 0.659766 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.015,0.705,0.015,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845167); setTerrainGrid 50; systemChat('Grama Desligada');";
};
class CCD_Motorbike: CCD_RscButton
{
	idc = 1604;
	text = "Lambreta";
	x = 0.642803 * safezoneW + safezoneX;
	y = 0.433863 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.176,0.329,0.564,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845167); ['TT650_Civ'] execVM 'custom\EVD\EVD_deploy.sqf';";
};
class CCD_Mozzie: CCD_RscButton
{
	idc = 1605;
	text = "Mozzie";
	x = 0.642803 * safezoneW + safezoneX;
	y = 0.554113 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.176,0.329,0.564,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845167); ['CSJ_GyroC'] execVM 'custom\EVD\EVD_deploy.sqf';";
};
class CCD_Bike: CCD_RscButton
{
	idc = 1606;
	text = "Bike";
	x = 0.642803 * safezoneW + safezoneX;
	y = 0.351691 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.176,0.329,0.564,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845167); execVM 'custom\Menu\scripts\deploy.sqf';";
};
class RscText_1004: CCD_RscText
{
	idc = 1004;
	text = "Items:";
	x = 0.642803 * safezoneW + safezoneX;
	y = 0.376744 * safezoneH + safezoneY;
	w = 0.0312515 * safezoneW;
	h = 0.0199315 * safezoneH;
};
class RscText_1003: CCD_RscText
{
	idc = 1003;
	text = "ToolBox";
	x = 0.642803 * safezoneW + safezoneX;
	y = 0.393779 * safezoneH + safezoneY;
	w = 0.0391411 * safezoneW;
	h = 0.0199315 * safezoneH;
};
class RscText_1005: CCD_RscText
{
	idc = 1005;
	text = "Items:";
	x = 0.642803 * safezoneW + safezoneX;
	y = 0.459917 * safezoneH + safezoneY;
	w = 0.0312515 * safezoneW;
	h = 0.0199315 * safezoneH;
};
class RscText_1007: CCD_RscText
{
	idc = 1007;
	text = "ToolBox";
	x = 0.642803 * safezoneW + safezoneX;
	y = 0.478956 * safezoneH + safezoneY;
	w = 0.0391411 * safezoneW;
	h = 0.0199315 * safezoneH;
};
class RscText_1011: CCD_RscText
{
	idc = 1011;
	text = "Wheel";
	x = 0.642803 * safezoneW + safezoneX;
	y = 0.516033 * safezoneH + safezoneY;
	w = 0.0312515 * safezoneW;
	h = 0.0199315 * safezoneH;
};
class RscText_1008: CCD_RscText
{
	idc = 1008;
	text = "Engine";
	x = 0.642803 * safezoneW + safezoneX;
	y = 0.649311 * safezoneH + safezoneY;
	w = 0.0324034 * safezoneW;
	h = 0.0189294 * safezoneH;
};
class RscText_1012: CCD_RscText
{
	idc = 1012;
	text = "ScrapMetal";
	x = 0.642803 * safezoneW + safezoneX;
	y = 0.616243 * safezoneH + safezoneY;
	w = 0.0564983 * safezoneW;
	h = 0.0189294 * safezoneH;
};
class RscText_1013: CCD_RscText
{
	idc = 1013;
	text = "Rotor";
	x = 0.642803 * safezoneW + safezoneX;
	y = 0.632276 * safezoneH + safezoneY;
	w = 0.0469528 * safezoneW;
	h = 0.0199315 * safezoneH;
};
class RscText_1014: CCD_RscText
{
	idc = 1014;
	text = "Items:";
	x = 0.642803 * safezoneW + safezoneX;
	y = 0.581169 * safezoneH + safezoneY;
	w = 0.0312515 * safezoneW;
	h = 0.0199315 * safezoneH;
};
class RscText_1015: CCD_RscText
{
	idc = 1015;
	text = "Engine";
	x = 0.642803 * safezoneW + safezoneX;
	y = 0.495991 * safezoneH + safezoneY;
	w = 0.0313515 * safezoneW;
	h = 0.0199315 * safezoneH;
};
class RscText_1016: CCD_RscText
{
	idc = 1016;
	text = "ToolBox";
	x = 0.642803 * safezoneW + safezoneX;
	y = 0.600208 * safezoneH + safezoneY;
	w = 0.0391411 * safezoneW;
	h = 0.0199315 * safezoneH;
};
class CCD_VeiwDistHeader: CCD_RscText
{
	idc = 1027;
	text = " Distancia";
	x = 0.461341 * safezoneW + safezoneX;
	y = 0.295575 * safezoneH + safezoneY;
	w = 0.0691217 * safezoneW;
	h = 0.0269461 * safezoneH;
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
class CCD_VD1000: CCD_RscButton
{
	idc = 1607;
	text = "1000";
	x = 0.467126 * safezoneW + safezoneX;
	y = 0.341671 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.015,0.705,0.015,0.8};
	onButtonClick = "setViewDistance 1000; systemChat('ViewDistance: 1000');";
};
class CCD_VD1500: CCD_RscButton
{
	idc = 1608;
	text = "1500";
	x = 0.467126 * safezoneW + safezoneX;
	y = 0.373737 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.015,0.705,0.015,0.8};
	onButtonClick = "setViewDistance 1500; systemChat('ViewDistance: 1500');";
};
class CCD_VD2000: CCD_RscButton
{
	idc = 1609;
	text = "2000";
	x = 0.467126 * safezoneW + safezoneX;
	y = 0.405803 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.015,0.705,0.015,0.8};
	onButtonClick = "setViewDistance 2000; systemChat('ViewDistance: 2000');";
};
class CCD_VD2500: CCD_RscButton
{
	idc = 1610;
	text = "2500";
	x = 0.467126 * safezoneW + safezoneX;
	y = 0.436869 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.015,0.705,0.015,0.8};
	onButtonClick = "setViewDistance 2500; systemChat('ViewDistance: 2500');";
};
class CCD_VD3000: CCD_RscButton
{
	idc = 1611;
	text = "3000";
	x = 0.467126 * safezoneW + safezoneX;
	y = 0.467934 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.913,0.607,0.043,0.8};
	onButtonClick = "setViewDistance 3000; systemChat('ViewDistance: 3000');";
};
class CCD_VD3500: CCD_RscButton
{
	idc = 1612;
	text = "3500";
	x = 0.467126 * safezoneW + safezoneX;
	y = 0.498998 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.913,0.607,0.043,0.8};
	onButtonClick = "setViewDistance 3500; systemChat('ViewDistance: 3500');";
};
class CCD_VD4000: CCD_RscButton
{
	idc = 1613;
	text = "4000";
	x = 0.467126 * safezoneW + safezoneX;
	y = 0.530063 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.764,0.043,0.043,0.8};
	onButtonClick = "setViewDistance 4000; systemChat('ViewDistance: 4000');";
};
class CCD_VD5000: CCD_RscButton
{
	idc = 1614;
	text = "5000";
	x = 0.467126 * safezoneW + safezoneX;
	y = 0.561128 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.764,0.043,0.043,0.8};
	onButtonClick = "setViewDistance 5000; systemChat('ViewDistance: 5000');";
};
class CCD_WebSite: CCD_RscText
{
	idc = 1000;
	text = " chernobylserver.enjin.com";
	x = 0.427029 * safezoneW + safezoneX;
	y = 0.632296 * safezoneH + safezoneY;
	w = 0.1275373 * safezoneW;
	h = 0.0189294 * safezoneH;
};
class CCD_TeamSpeak: CCD_RscText
{
	idc = 1006;
	text = "TS:cdpgamers.ddns.net:9988";
	x = 0.437924 * safezoneW + safezoneX;
	y = 0.671357 * safezoneH + safezoneY;
	w = 0.114356 * safezoneW;
	h = 0.0169252 * safezoneH;
};
class CCD_close: CCD_RscButton
{
	idc = 4921;
	text = "Fechar";
	x = 0.467126 * safezoneW + safezoneX;
	y = 0.723 * safezoneH + safezoneY;
	w = 0.0543943 * safezoneW;
	h = 0.0239398 * safezoneH;
	colorBackground[] = {0.764,0.043,0.043,0.8};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 845167);";
};
};
};
