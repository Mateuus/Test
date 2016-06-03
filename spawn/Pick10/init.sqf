
points =  10; 	

bandagePrice 		= 1;
painkillersPrice  	= 1;
morphinePrice  		= 1;
cookedmeatPrice  	= 1;
waterbottlePrice  	= 1;
toolboxPrice 		= 1;
compassPrice 		= 1;
huntingknifePrice  	= 1;
boxofmatchesPrice  	= 1;
gpsPrice  			= 3;
g17Price  			= 1;
m9sdPrice  			= 2;
pdwPrice  			= 3;
pdwsdPrice  		= 4;
g17magPrice  		= 1;
m9sdmagPrice  		= 1;
pdwmagPrice  		= 1;
pdwsdmagPrice 	 	= 1;

addMap 		= true;
addHatchet 	= false;
addRadio 	= false;

servername 	= "Chernobyl";

createDialog "Shix_Pick10";

call fnc_updateTitletext;

lbAdd [1500, "Bandage"];
lbAdd [1500, "PainKillers"];
lbAdd [1500, "Morphine"];
lbAdd [1500, "Cooked Meat"];
lbAdd [1500, "Water Bottle"];
lbAdd [1500, "ToolBox"];
lbAdd [1500, "Compass"];
lbAdd [1500, "Hunting Knife"];
lbAdd [1500, "Box of matches"];
lbAdd [1500, "GPS"];
lbAdd [1500, "G17"];
lbAdd [1500, "M9SD"];
lbAdd [1500, "PDW"];
lbAdd [1500, "PDWSD"];
lbAdd [1500, "1 G17 Mag"];
lbAdd [1500, "1 M9SD MAG"];
lbAdd [1500, "1 PDW MAG"];
lbAdd [1500, "1 PDWSD MAG"];

bandage 		= 0;
Painkillers 	= 0;
morphine 		= 0;
cookedmeat 		= 0;
waterbottle 	= 0;
toolbox 		= 0;
compass			= 0;
huntingknife 	= 0;
boxofmatches 	= 0;
gps 			= 0;
g17 			= 0;
m9sd 			= 0;
pdw 			= 0;
pdwsd 			= 0;
g17mag 			= 0;
m9sdmag 		= 0;
pdwmag 			= 0;
pdwsdmag	 	= 0;

pointsUsed = 0;

fnc_addItem = {
_selected = lbCurSel 1500;
	if(_selected == 0) then {
		if(points >= bandagePrice) then {
			if(g17mag + m9sdmag + pdwmag + pdwsdmag + bandage >=8) then {
			call fnc_magError;
			} else {
			points = points -bandagePrice;
			bandage = bandage +1;
			pointsUsed = pointsUsed +1;
			};
		};
	};
	if(_selected == 1) then {
		if(points >= painkillersPrice) then {
		points = points -painkillersPrice;
		Painkillers = Painkillers +1;
		pointsUsed = pointsUsed +1;
		};
	};
	if(_selected == 2) then {
		if(points >= morphinePrice) then {
		points = points -morphinePrice;
		morphine = morphine +1;
		pointsUsed = pointsUsed +1;
		};
	};
	if(_selected == 3) then {
		if(points >= cookedmeatPrice) then {
		points = points -cookedmeatPrice;
		cookedmeat = cookedmeat +1;
		pointsUsed = pointsUsed +1;
		};
	};
	if(_selected == 4) then {
		if(points >= waterbottlePrice) then {
		points = points -waterbottlePrice;
		waterbottle = waterbottle +1;
		pointsUsed = pointsUsed +1;
		};
	};
	if(_selected == 5) then {
		if(points >= toolboxPrice) then {
			if(toolbox == 0)then{
			points = points -toolboxPrice;
			toolbox = toolbox +1;
			pointsUsed = pointsUsed +1;
			};
		};
	};
	if(_selected == 6) then {
		if(points >= compassPrice) then {
			if(compass == 0) then {
			points = points -compassPrice;
			compass = compass +1;
			pointsUsed = pointsUsed +1;
			};
		};
	};
	if(_selected == 7) then {
		if(points >= huntingknifePrice) then {
			if(huntingknife == 0) then {
			points = points -huntingknifePrice;
			huntingknife = huntingknife +1;
			pointsUsed = pointsUsed +1;
			};
		};
	};
	if(_selected == 8) then {
		if(points >= boxofmatchesPrice) then {
			if(boxofmatches == 0) then {
			points = points -boxofmatchesPrice;
			boxofmatches = boxofmatches +1;
			pointsUsed = pointsUsed +1;
			};
		};
	};
	if(_selected == 9) then {
		if(points >= gpsPrice) then {
			if(gps == 0) then {
			points = points -gpsPrice;
			gps = gps +1;
			pointsUsed = pointsUsed +1;
			};
		};
	};
	if(_selected == 10) then {
		if(points >= g17Price) then {
		if(g17 + m9sd + pdw + pdwsd == 1) then {
			call fnc_gunError;
			} else {
			points = points -g17Price;
			g17 = g17 +1;
			pointsUsed = pointsUsed +1;
			};
		};
	};
	if(_selected == 11) then {
		if(points >= m9sdPrice) then {
		if(g17 + m9sd + pdw + pdwsd == 1) then {
			call fnc_gunError;
			} else {
			points = points -m9sdPrice;
			m9sd = m9sd +1;
			pointsUsed = pointsUsed +1;
			};
		};
	};
	if(_selected == 12) then {
		if(points >= pdwPrice) then {
		if(g17 + m9sd + pdw + pdwsd == 1) then {
			call fnc_gunError;
			} else {
			points = points -pdwPrice;
			pdw = pdw +1;
			pointsUsed = pointsUsed +1;
			};
		};
	};
	if(_selected == 13) then {
		if(points >= pdwsdPrice) then {
		if(g17 + m9sd + pdw + pdwsd == 1) then {
			call fnc_gunError;
			} else {
			points = points -pdwsdPrice;
			pdwsd = pdwsd +1;
			pointsUsed = pointsUsed +1;
			};
		};
	};
	if(_selected == 14) then {
		if(points >= g17magPrice) then {
		if(g17mag + m9sdmag + pdwmag + pdwsdmag + bandage >=8) then {
			call fnc_magError;
			} else {
				points = points -g17magPrice;
				g17mag = g17mag +1;
				pointsUsed = pointsUsed +1;
			};
		};
	};
	if(_selected == 15) then {
		if(points >= m9sdmagPrice) then {
		if(g17mag + m9sdmag + pdwmag + pdwsdmag + bandage >=8) then {
			call fnc_magError;
			} else {
				points = points -m9sdmagPrice;
				m9sdmag = m9sdmag +1;
				pointsUsed = pointsUsed +1;
			};
		};
	};
	if(_selected == 16) then {
		if(points >= pdwmagPrice) then {
		if(g17mag + m9sdmag + pdwmag + pdwsdmag + bandage >=8) then {
			call fnc_magError;
			} else {
				points = points -pdwmagPrice;
				pdwmag = pdwmag +1;
				pointsUsed = pointsUsed +1;
			};
		};
	};
	if(_selected == 17) then {
		if(points >= pdwsdmagPrice) then {
		if(g17mag + m9sdmag + pdwmag + pdwsdmag + bandage >=8) then {
			call fnc_magError;
			} else {
				points = points -pdwsdmagPrice;
				pdwsdmag = pdwsdmag +1;
				pointsUsed = pointsUsed +1;
			};
		};
	};
	call fnc_updateCounts;
	call fnc_updateCounter;
};

fnc_removeItem = {
call fnc_clearError;
_selected = lbCurSel 1500;
if(_selected == 0) then {
		if(bandage >=1)then {
			points = points +bandagePrice;
			bandage = bandage -1;
			pointsUsed = pointsUsed -1;
		};
	};
	if(_selected == 1) then {
		if(PainKillers >=1)then {
			points = points +painkillersPrice;
			Painkillers = Painkillers -1;
			pointsUsed = pointsUsed -1;
		};
	};
	if(_selected == 2) then {
		if(morphine >=1)then {
			points = points +morphinePrice;
			morphine = morphine -1;
			pointsUsed = pointsUsed -1;
		};
	};
	if(_selected == 3) then {
		if(cookedmeat >=1)then {
			points = points +cookedmeatPrice;
			cookedmeat = cookedmeat -1;
			pointsUsed = pointsUsed -1;
		};
	};
	if(_selected == 4) then {
		if(waterbottle >=1)then {
			points = points +waterbottlePrice;
			waterbottle = waterbottle -1;
			pointsUsed = pointsUsed -1;
		};
	};
	if(_selected == 5) then {
		if(toolbox >=1)then {
			points = points +toolboxPrice;
			toolbox = toolbox -1;
			pointsUsed = pointsUsed -1;
		};
	};
	if(_selected == 6) then {
		if(compass >=1)then {
			points = points +compassPrice;
			compass = compass -1;
			pointsUsed = pointsUsed -1;
		};
	};
	if(_selected == 7) then {
		if(huntingknife >=1)then {
			points = points +huntingknifePrice;
			huntingknife = huntingknife -1;
			pointsUsed = pointsUsed -1;
		};
	};
	if(_selected == 8) then {
		if(boxofmatches >=1)then {
			points = points +boxofmatchesPrice;
			boxofmatches = boxofmatches -1;
			pointsUsed = pointsUsed -1;
		};
	};
	if(_selected == 9) then {
		if(gps >=1)then {
			points = points +gpsPrice;
			gps = gps -1;
			pointsUsed = pointsUsed -1;
		};
	};
	if(_selected == 10) then {
		if(g17 >=1)then {
			points = points +g17Price;
			g17 = g17 -1;
			pointsUsed = pointsUsed -1;
		};
	};
	if(_selected == 11) then {
		if(m9sd >=1)then {
			points = points +m9sdPrice;
			m9sd = m9sd -1;
			pointsUsed = pointsUsed -1;
		};
	};
	if(_selected == 12) then {
		if(pdw >=1)then {
			points = points +pdwPrice;
			pdw = pdw -1;
			pointsUsed = pointsUsed -1;
		};
	};
	if(_selected == 13) then {
		if(pdwsd >=1)then {
			points = points +pdwsdPrice;
			pdwsd = pdwsd -1;
			pointsUsed = pointsUsed -1;
		}
	};
	if(_selected == 14) then {
		if(g17mag >=1)then {
			points = points +g17magPrice;
			g17mag = g17mag -1;
			pointsUsed = pointsUsed -1;
		};
	};
	if(_selected == 15) then {
		if(m9sdmag >=1)then {
			points = points +m9sdmagPrice;
			m9sdmag = m9sdmag -1;
			pointsUsed = pointsUsed -1;
		};
	};
	if(_selected == 16) then {
		if(pdwmag >=1)then {
			points = points +pdwmagPrice;
			pdwmag = pdwmag -1;
			pointsUsed = pointsUsed -1;
		};
	};
	if(_selected == 17) then {
		if(pdwsdmag >=1)then {
			points = points +pdwsdmagPrice;
			pdwsdmag = pdwsdmag -1;
			pointsUsed = pointsUsed -1;
		};
	};
	call fnc_updateCounter;
	call fnc_updateCounts;
};

fnc_ClearItems = {
bandage = 0;
Painkillers = 0;
morphine = 0;
cookedmeat 	= 0;
waterbottle = 0;
toolbox = 0; 		
compass	= 0;
huntingknife = 0;
boxofmatches = 0;
gps = 0;
g17 = 0;
m9sd = 0;
pdw = 0;
pdwsd = 0;
g17mag = 0;
m9sdmag = 0;
pdwmag 	= 0;
pdwsdmag = 0;

points = 10;
call fnc_updateCounts;
call fnc_updateCounter;
};

fnc_updateCounts = {
_finddialog = findDisplay 8457;
(_finddialog displayCtrl 1028) ctrlSetText format["%1",bandage];
(_finddialog displayCtrl 1029) ctrlSetText format["%1",PainKillers];
(_finddialog displayCtrl 1030) ctrlSetText format["%1",morphine];
(_finddialog displayCtrl 1031) ctrlSetText format["%1",cookedmeat];
(_finddialog displayCtrl 1032) ctrlSetText format["%1",waterbottle];
(_finddialog displayCtrl 1033) ctrlSetText format["%1",toolbox];
(_finddialog displayCtrl 1034) ctrlSetText format["%1",compass];
(_finddialog displayCtrl 1035) ctrlSetText format["%1",huntingknife];
(_finddialog displayCtrl 1036) ctrlSetText format["%1",boxofmatches];
(_finddialog displayCtrl 1037) ctrlSetText format["%1",gps];
(_finddialog displayCtrl 1038) ctrlSetText format["%1",g17];
(_finddialog displayCtrl 1039) ctrlSetText format[ "%1",m9sd];
(_finddialog displayCtrl 1040) ctrlSetText format["%1",pdw];
(_finddialog displayCtrl 1041) ctrlSetText format["%1",pdwsd];
(_finddialog displayCtrl 1042) ctrlSetText format["%1",g17mag];
(_finddialog displayCtrl 1043) ctrlSetText format["%1",m9sdmag];
(_finddialog displayCtrl 1044) ctrlSetText format["%1",pdwmag];
(_finddialog displayCtrl 1045) ctrlSetText format["%1",pdwsdmag];
};

fnc_spawn = {
	if(bandage >=1)then {
		for "_x" from 1 to bandage do {
			player addMagazine "ItemBandage";
		};
	};
	if(PainKillers >=1)then {
		for "_x" from 1 to PainKillers do {
			player addMagazine "ItemPainkiller";
		};
	};
	if(morphine >=1)then {
		for "_x" from 1 to morphine do {
			player addMagazine "ItemMorphine";
		};
	};
	if(cookedmeat >=1)then {
		for "_x" from 1 to cookedmeat do {
			player addMagazine "FoodSteakCooked";
		};
	};
	if(waterbottle >=1)then {
		for "_x" from 1 to waterbottle do {
			player addMagazine "ItemWaterbottle";
		};
	};
	if(toolbox ==1)then {
		player addWeapon "ItemToolbox";
	};
	if(compass ==1)then {
		player addWeapon "ItemCompass";
	};
		
	if(huntingknife ==1)then {
		player addWeapon "ItemKnife";
	};
	if(boxofmatches ==1)then {
		player addWeapon "ItemMatchbox";
	};
	if(gps ==1)then {
		player addWeapon "ItemGps";
	};
	if(g17 ==1)then {
		player addWeapon "glock17_EP1";
	};
	if(m9sd ==1)then {
		player addWeapon "M9SD";
	};
	if(pdw ==1)then {
		player addWeapon "UZI_EP1";
	};
	if(pdwsd ==1)then {
		player addWeapon "UZI_SD_EP1";
	};
	if(g17mag >=1)then {
		for "_x" from 1 to g17mag do {
			player addMagazine "17Rnd_9x19_glock17";
		};
	};
	if(m9sdmag >=1)then {
		for "_x" from 1 to m9sdmag do {
			player addMagazine "15Rnd_9x19_M9SD";
		};
	};
	if(pdwmag >=1)then {
		for "_x" from 1 to pdwmag do {
			player addMagazine "30Rnd_9x19_UZI";
		};
	};
	if(pdwsdmag >=1)then {
		for "_x" from 1 to pdwsdmag do {
			player addMagazine "30Rnd_9x19_UZI_SD";
		};
	};
	player addWeapon "NVGoggles";
	if(addMap)then{
		player addWeapon "ItemMap";
	};
	if(addHatchet)then{
		player addWeapon "ItemHatchet";
	};
	if(addRadio)then{
		player addWeapon "ItemRadio";
	};
    execVM "custom\login.sqf";
	cutText ["","BLACK IN"];
	closeDialog 8457;
	reload player;
	_secWpn = secondaryWeapon player;
	player selectWeapon _secWpn;
};

fnc_gunError = {
_dialog = findDisplay 8457;
(_dialog displayCtrl 1021) ctrlSetText format["Voce ja tem uma pistola equipada"];
};

fnc_magError = {
_dialog = findDisplay 8457;
(_dialog displayCtrl 1021) ctrlSetText format["Voce so pode equipar 8 itens ou bandagens"];
};

fnc_clearError = {
_dialog = findDisplay 8457;
(_dialog displayCtrl 1021) ctrlSetText format[" "];
};

fnc_updateTitletext = {
_dialog = findDisplay 8457;
(_dialog displayCtrl 1000) ctrlSetText format["%1 Pegue %2",servername,points];
};