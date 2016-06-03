class ZSC_Money_Display {
	idd = -1;
    fadeout=0;
    fadein=0;
	onLoad = "uiNamespace setVariable ['ZSC_Money_Display', _this select 0]";
	duration = 10e10;
	name= "ZSC_Money_Display";
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class ZSC_Status:RscStructuredText {
			idc = 1;
			size = 0.040;
			text = "";
			x = 0.925313 * safezoneW + safezoneX;
			y = 0.55 * safezoneH + safezoneY;
			w = 0.14; h = 0.20;
		};
	};
};