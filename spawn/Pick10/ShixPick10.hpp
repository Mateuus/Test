class Shix_Pick10
{
    idd = 8457;
    movingenable=false;
	class Controls
	{ 
		class Shix_Pick10Frame: ShixRscFrame
		{
			idc = -1;
			x = 0.293721 * safezoneW + safezoneX;
			y = 0.225079 * safezoneH + safezoneY;
			w = 0.412558 * safezoneW;
			h = 0.549842 * safezoneH;
		};
		class Shix_Pick10BG: ShixBOX
		{
			idc = -1;
			x = 0.293721 * safezoneW + safezoneX;
			y = 0.225079 * safezoneH + safezoneY;
			w = 0.412558 * safezoneW;
			h = 0.549842 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class Shix_pick10headerBG: ShixBOX
		{
			idc = -1;
			x = 0.293721 * safezoneW + safezoneX;
			y = 0.225079 * safezoneH + safezoneY;
			w = 0.412558 * safezoneW;
			h = 0.0439874 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class Shix_ItemList: ShixRscListbox
		{
			idc = 1500;
			x = 0.304035 * safezoneW + safezoneX;
			y = 0.29106 * safezoneH + safezoneY;
			w = 0.0928255 * safezoneW;
			h = 0.461867 * safezoneH;
		};
		class Shix_Div1: ShixBOX
		{
			idc = -1;
			x = 0.407175 * safezoneW + safezoneX;
			y = 0.269066 * safezoneH + safezoneY;
			w = 0.0103139 * safezoneW;
			h = 0.505855 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class Shix_Pick10TitleText: ShixRscText
		{
			idc = 1000;
			text = "Chernobyl pegue 10"; 
			x = 0.44843 * safezoneW + safezoneX;
			y = 0.225079 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0439874 * safezoneH;
		};
		class ShixRscText_1001: ShixRscText
		{
			idc = 1001;
			text = "Bandage = "; 
			x = 0.484529 * safezoneW + safezoneX;
			y = 0.280063 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class ShixRscText_1002: ShixRscText
		{
			idc = 1002;
			text = "PainKillers = "; 
			x = 0.484529 * safezoneW + safezoneX;
			y = 0.313054 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class ShixRscText_1003: ShixRscText
		{
			idc = 1003;
			text = "Morphine = "; 
			x = 0.484529 * safezoneW + safezoneX;
			y = 0.346044 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class ShixRscText_1004: ShixRscText
		{
			idc = 1004;
			text = "Cooked Meat = "; 
			x = 0.484529 * safezoneW + safezoneX;
			y = 0.379035 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class ShixRscText_1005: ShixRscText
		{
			idc = 1005;
			text = "Water Bottle = "; 
			x = 0.484529 * safezoneW + safezoneX;
			y = 0.412025 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class ShixRscText_1006: ShixRscText
		{
			idc = 1006;
			text = "ToolBox = "; 
			x = 0.484529 * safezoneW + safezoneX;
			y = 0.445016 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class ShixRscText_1007: ShixRscText
		{
			idc = 1007;
			text = "Compass = "; 
			x = 0.484529 * safezoneW + safezoneX;
			y = 0.478006 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class ShixRscText_1008: ShixRscText
		{
			idc = 1008;
			text = "Hunting Knife = "; 
			x = 0.484529 * safezoneW + safezoneX;
			y = 0.510997 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class ShixRscText_1009: ShixRscText
		{
			idc = 1009;
			text = "Matches = "; 
			x = 0.484529 * safezoneW + safezoneX;
			y = 0.543987 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class ShixRscText_1010: ShixRscText
		{
			idc = 1010;
			text = "GPS = "; 
			x = 0.484529 * safezoneW + safezoneX;
			y = 0.576978 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class ShixRscText_1011: ShixRscText
		{
			idc = 1011;
			text = "G17 = "; 
			x = 0.484529 * safezoneW + safezoneX;
			y = 0.609968 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class ShixRscText_1012: ShixRscText
		{
			idc = 1012;
			text = "M9SD = "; 
			x = 0.484529 * safezoneW + safezoneX;
			y = 0.642959 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class ShixRscText_1013: ShixRscText
		{
			idc = 1013;
			text = "PDW = "; 
			x = 0.484529 * safezoneW + safezoneX;
			y = 0.675949 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class ShixRscText_1014: ShixRscText
		{
			idc = 1014;
			text = "PDWSD = "; 
			x = 0.592826 * safezoneW + safezoneX;
			y = 0.280063 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class ShixRscText_1015: ShixRscText
		{
			idc = 1015;
			text = "G17 MAG = "; 
			x = 0.592826 * safezoneW + safezoneX;
			y = 0.313054 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class ShixRscText_1016: ShixRscText
		{
			idc = 1016;
			text = "M9SD MAG = "; 
			x = 0.592826 * safezoneW + safezoneX;
			y = 0.346044 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class ShixRscText_1017: ShixRscText
		{
			idc = 1017;
			text = "PDW MAG = "; 
			x = 0.592826 * safezoneW + safezoneX;
			y = 0.379035 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class ShixRscText_1018: ShixRscText
		{
			idc = 1018;
			text = "PDWSD MAG = "; 
			x = 0.592826 * safezoneW + safezoneX;
			y = 0.412025 * safezoneH + safezoneY;
			w = 0.0979825 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class Shix_Pick10AddItem: ShixRscButton
		{
			idc = 1600;
			text = ">"; 
			x = 0.422645 * safezoneW + safezoneX;
			y = 0.379035 * safezoneH + safezoneY;
			w = 0.0567267 * safezoneW;
			h = 0.0219937 * safezoneH;
			colorBackground[] = {0.2,0.38,0.647,0.8};
			onButtonClick = "call fnc_addItem;";
		};
		class Shix_Pick10RemoveItem: ShixRscButton
		{
			idc = 1601;
			text = "<"; 
			x = 0.422645 * safezoneW + safezoneX;
			y = 0.478006 * safezoneH + safezoneY;
			w = 0.0567267 * safezoneW;
			h = 0.0219937 * safezoneH;
			colorBackground[] = {0.2,0.38,0.647,0.8};
			onButtonClick = "call fnc_removeItem;";
		};
		class Shix_Pick10ClearItems: ShixRscButton
		{
			idc = 1602;
			text = "Zerar"; 
			x = 0.422645 * safezoneW + safezoneX;
			y = 0.565981 * safezoneH + safezoneY;
			w = 0.0567267 * safezoneW;
			h = 0.0219937 * safezoneH;
			colorBackground[] = {0.2,0.38,0.647,0.8};
			onButtonClick = "call fnc_ClearItems;";
		};
		class Shix_Pick10PointsCounter: ShixRscText
		{
			idc = 1019;
			text = "Points Remaining = 10";
			x = 0.572198 * safezoneW + safezoneX;
			y = 0.664953 * safezoneH + safezoneY;
			w = 0.113453 * safezoneW;
			h = 0.0329905 * safezoneH;
		};
		class bandage_num: ShixRscText
		{
			idc = 1028;
			text = "0"; 
			x = 0.536099 * safezoneW + safezoneX;
			y = 0.280063 * safezoneH + safezoneY;
			w = 0.0154709 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class painkiller_num: ShixRscText
		{
			idc = 1029;
			text = "0"; 
			x = 0.541256 * safezoneW + safezoneX;
			y = 0.313054 * safezoneH + safezoneY;
			w = 0.0154709 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class morphine_num: ShixRscText
		{
			idc = 1030;
			text = "0"; 
			x = 0.536099 * safezoneW + safezoneX;
			y = 0.346044 * safezoneH + safezoneY;
			w = 0.0154709 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class cookedmeat_num: ShixRscText
		{
			idc = 1031;
			text = "0"; 
			x = 0.556727 * safezoneW + safezoneX;
			y = 0.379035 * safezoneH + safezoneY;
			w = 0.0154709 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class waterbottle_num: ShixRscText
		{
			idc = 1032;
			text = "0"; 
			x = 0.556727 * safezoneW + safezoneX;
			y = 0.412025 * safezoneH + safezoneY;
			w = 0.0154709 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class toolbox_num: ShixRscText
		{
			idc = 1033;
			text = "0"; 
			x = 0.530942 * safezoneW + safezoneX;
			y = 0.445016 * safezoneH + safezoneY;
			w = 0.0154709 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class compass_num: ShixRscText
		{
			idc = 1034;
			text = "0"; 
			x = 0.536099 * safezoneW + safezoneX;
			y = 0.478006 * safezoneH + safezoneY;
			w = 0.0154709 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class huntingkinfe_num: ShixRscText
		{
			idc = 1035;
			text = "0"; 
			x = 0.556727 * safezoneW + safezoneX;
			y = 0.510997 * safezoneH + safezoneY;
			w = 0.0154709 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class matches_num: ShixRscText
		{
			idc = 1036;
			text = "0"; 
			x = 0.530942 * safezoneW + safezoneX;
			y = 0.543987 * safezoneH + safezoneY;
			w = 0.0154709 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class GPS_num: ShixRscText
		{
			idc = 1037;
			text = "0"; 
			x = 0.515471 * safezoneW + safezoneX;
			y = 0.576978 * safezoneH + safezoneY;
			w = 0.0154709 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class g17_num: ShixRscText
		{
			idc = 1038;
			text = "0"; 
			x = 0.510314 * safezoneW + safezoneX;
			y = 0.609968 * safezoneH + safezoneY;
			w = 0.0154709 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class m9sd_num: ShixRscText
		{
			idc = 1039;
			text = "0"; 
			x = 0.520628 * safezoneW + safezoneX;
			y = 0.642959 * safezoneH + safezoneY;
			w = 0.0154709 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class pdw_num: ShixRscText
		{
			idc = 1040;
			text = "0"; 
			x = 0.515471 * safezoneW + safezoneX;
			y = 0.675949 * safezoneH + safezoneY;
			w = 0.0154709 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class pdwsd_num: ShixRscText
		{
			idc = 1041;
			text = "0"; 
			x = 0.639238 * safezoneW + safezoneX;
			y = 0.280063 * safezoneH + safezoneY;
			w = 0.0154709 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class g17mag_num: ShixRscText
		{
			idc = 1042;
			text = "0"; 
			x = 0.644395 * safezoneW + safezoneX;
			y = 0.313054 * safezoneH + safezoneY;
			w = 0.0154709 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class m9sdmag_num: ShixRscText
		{
			idc = 1043;
			text = "0"; 
			x = 0.654709 * safezoneW + safezoneX;
			y = 0.346044 * safezoneH + safezoneY;
			w = 0.0154709 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class pdwmag_num: ShixRscText
		{
			idc = 1044;
			text = "0"; 
			x = 0.654709 * safezoneW + safezoneX;
			y = 0.378044 * safezoneH + safezoneY;
			w = 0.0154709 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class pdwsdmag_num: ShixRscText
		{
			idc = 1045;
			text = "0"; 
			x = 0.665023 * safezoneW + safezoneX;
			y = 0.412025 * safezoneH + safezoneY;
			w = 0.0154709 * safezoneW;
			h = 0.0219937 * safezoneH;
		};
		class Shix_pick10Spawn: ShixRscButton
		{
			idc = 1603;
			text = "Spawn"; 
			x = 0.422645 * safezoneW + safezoneX;
			y = 0.664953 * safezoneH + safezoneY;
			w = 0.0567267 * safezoneW;
			h = 0.0219937 * safezoneH;
			colorBackground[] = {0.2,0.38,0.647,0.8};
			onButtonClick = "call fnc_spawn;";
		};
		class Shix_pick10ERROR: ShixRscText
		{
			text = "";
			idc = 1021;
			x = 0.427802 * safezoneW + safezoneX;
			y = 0.70894 * safezoneH + safezoneY;
			w = 0.268163 * safezoneW;
			h = 0.0549842 * safezoneH;
		};
	};
};
