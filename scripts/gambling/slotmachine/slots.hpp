
class MyRscFrame
{
	type = 0;
	idc = -1;
	style = 64;
	shadow = 2;
	colorBackground[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	font = "Zeppelin32";
	sizeEx = 0.02;
	text = "";
};

class RscBackground
{
	type = 0;
	style = ST_BACKGROUND;
	shadow = 2;
	colorBackground[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	font = "Zeppelin32";
	sizeEx = 0.02;
	text = "";
	
};

class RscButton
{
	access = 0;
	type = 1;
	text = "";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {0.45,0.45,0.45,1};
	colorBackgroundDisabled[] = {0,0,0,0.5};
	colorBackgroundActive[] = {0.75,0.75,0.75,1};
	colorFocused[] = {0.75,0.75,0.75,1};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,1};
	soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
	soundPush[] = {"\ca\ui\data\sound\new1",0,0};
	soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
	soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "Zeppelin32";
	sizeEx = 0.03921;
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};

class RscDisplaySlots
{
   idd = SLOTS_DIALOG;
   movingenable = 0;

   class Controls
   {
	 class RscBackground_5000: RscBackground
     {
       idc = 5000;
	   colorBackground[] = {0,0,0,1};
	   colorText[] = {1,1,1,1};
       x = 0.32375 * safezoneW + safezoneX;
       y = 0.3355 * safezoneH + safezoneY;
       w = 0.367188 * safezoneW;
       h = 0.3055 * safezoneH;
     };
     class RscFrame_1800: MyRscFrame
     {
       idc = 1800;
	   colorBackground[] = {0,0,0,1};
	   colorText[] = {1,1,1,1};
       x = 0.32375 * safezoneW + safezoneX;
       y = 0.3355 * safezoneH + safezoneY;
       w = 0.367188 * safezoneW;
       h = 0.3055 * safezoneH;
     };
     class credittext_TXT: RscText
     {
       idc = 1000;
       text = "Credits:";
       x = 0.32375 * safezoneW + safezoneX;
       y = 0.3355 * safezoneH + safezoneY;
       w = 0.0440625 * safezoneW;
       h = 0.0235 * safezoneH;
     };
     class credits_TXT: RscText
     {
       idc = 1001;
       text = "0";
       x = 0.367812 * safezoneW + safezoneX;
       y = 0.3355 * safezoneH + safezoneY;
       w = 0.0514062 * safezoneW;
       h = 0.0235 * safezoneH;
     };
     class RscPicture_1201: RscPicture
     {
       idc = 1201;
       text = "#(argb,8,8,3)color(1,1,1,1)";
       x = 0.477969 * safezoneW + safezoneX;
       y = 0.3825 * safezoneH + safezoneY;
       w = 0.05875 * safezoneW;
       h = 0.1175 * safezoneH;
     };
     class RscPicture_1202: RscPicture
     {
       idc = 1202;
       text = "#(argb,8,8,3)color(1,1,1,1)";
       x = 0.573438 * safezoneW + safezoneX;
       y = 0.3825 * safezoneH + safezoneY;
       w = 0.05875 * safezoneW;
       h = 0.1175 * safezoneH;
     };
     class RscPicture_1200: RscPicture
     {
       idc = 1200;
       text = "#(argb,8,8,3)color(1,1,1,1)";
       x = 0.3825 * safezoneW + safezoneX;
       y = 0.3825 * safezoneH + safezoneY;
       w = 0.05875 * safezoneW;
       h = 0.1175 * safezoneH;
     };
     class spin_BTN: RscButton
     {
       idc = 1600;
       text = "SPIN";
       x = 0.338437 * safezoneW + safezoneX;
       y = 0.5705 * safezoneH + safezoneY;
       w = 0.05875 * safezoneW;
       h = 0.0235 * safezoneH;
       action = "_nil=[]Spawn fnc_spin";
     };
     class 1credit_BTN: RscButton
     {
       idc = 1601;
       text = "Add 1 Credit";
       x = 0.419219 * safezoneW + safezoneX;
       y = 0.5705 * safezoneH + safezoneY;
       w = 0.0734375 * safezoneW;
       h = 0.0235 * safezoneH;
       action = "_nil=[]Spawn fnc_add_1_credits";
     };
     class 10credit_BTN: RscButton
     {
       idc = 1602;
       text = "Add 10 Credits";
       x = 0.514687 * safezoneW + safezoneX;
       y = 0.5705 * safezoneH + safezoneY;
       w = 0.0807813 * safezoneW;
       h = 0.0235 * safezoneH;
       action = "_nil=[]Spawn fnc_add_10_credits";
     };
     class cashout_BTN: RscButton
     {
       idc = 1603;
       text = "CASH OUT";
       x = 0.6175 * safezoneW + safezoneX;
       y = 0.5705 * safezoneH + safezoneY;
       w = 0.05875 * safezoneW;
       h = 0.0235 * safezoneH;
       action = "closeDialog 0;_nil=[]Spawn fnc_cash_out";
     };
   };
};