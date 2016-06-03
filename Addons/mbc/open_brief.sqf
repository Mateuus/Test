_junk_group = ["HandRoadFlare","TrashTinCan","FoodCanUnlabeled","HandChemBlue","HandChemRed","HandChemGreen","ItemBook3","ItemBook4","ItemSodaR4z0rEmpty","ItemSodaDrwasteEmpty","ItemSodaLemonadeEmpty","ItemSodaLvgEmpty","ItemSodaMzlyEmpty","ItemSodaRabbitEmpty","ItemSodaClaysEmpty","TrashJackDaniels","TrashTinCan","ItemLetter","ItemBook1","ItemBook2","ItemTrashRazor","FoodCanOrlokEmpty","FoodCanDemonEmpty","FoodCanTylersEmpty","FoodCanCornEmpty","FoodCanBoneboyEmpty","FoodCanBadguyEmpty","FoodCanGriffEmpty","FoodCanPowellEmpty","FoodCanHerpyEmpty","FoodCanUnlabeledEmpty","FoodCanCurgonEmpty","FoodCanFraggleosEmpty","ItemTrashToiletpaper"];
_food_group = ["ItemWaterbottle","FoodNutmix","FoodPistachio","FoodMRE","ItemSodaOrangeSherbet","ItemSodaRbull","ItemSodaR4z0r","ItemSodaMdew","ItemSodaPepsi","ItemSodaCoke","FoodbaconCooked","FoodCanBakedBeans","FoodCanFrankBeans","FoodCanPasta","FoodCanSardines","FoodchickenCooked","FoodmuttonCooked","FoodrabbitCooked","ItemTroutCooked","ItemTunaCooked","ItemSeaBassCooked","FoodCanGriff","FoodCanTylers","FoodCanDemon","FoodCanPowell","FoodCanCorn","FoodCanOrlok","FoodCanHerpy","FoodCanBadguy","FoodCanBoneboy","FoodCanCurgon","FoodCanFraggleos","ItemSodaRabbit","ItemSodaMtngreenEmpty","ItemSodaSmashtEmpty","ItemSodaMtngreen","ItemSodaDrwaste","ItemSodaSmasht","ItemSodaClays","ItemSodaLemonade","ItemSodaLvg"];


_military_group = ["FlareWhite_M203","FlareGreen_M203","1Rnd_Smoke_M203","HandGrenade_west","HandGrenade_east","SmokeShell","SmokeShellRed","SmokeShellGreen","FoodMRE","Skin_Camo1_DZ","Skin_Rocket_DZ","Skin_Soldier1_DZ","Skin_Drake_Light_DZ"];
_medical_group = ["ItemAntibiotic","ItemBloodbag","ItemEpinephrine","ItemHeatPack","ItemMorphine","ItemBandage"];
_vehicle_repair_group = ["PartEngine","PartFueltank","PartGeneric","PartGlass","PartVRotor","PartWheel"];
_tools_group = ["ItemKeyKit","Binocular","Binocular_Vector","ItemCompass","ItemCrowbar","ItemEtool","ItemFishingPole","ItemFlashlightRed","ItemGPS","ItemHatchet_DZE","ItemKnife","ItemMachete","ItemMatchbox_DZE","ItemToolbox","NVGoggles"];

_common_group = ["ItemPlotDeed","ItemComboLock","ItemSledgeHead","ItemSledgeHandle","Skin_Sniper1_DZ","bulk_ItemSandbag"];
_assault_group = ["M16A4_ACG","Sa58V_RCO_EP1","SCAR_L_STD_Mk4CQT","SCAR_L_STD_Holo","SCAR_L_CQC","SCAR_L_CQC_Holo","SCAR_L_STD_EGLM_RCO","SCAR_L_CQC_EGLM_Holo","SCAR_L_CQC_CCO_SD","SCAR_H_CQC_CCO","SCAR_H_CQC_CCO_SD","M8_sharpshooter","M4A1_HWS_GL_camo","M4A3_CCO_EP1","M4A1_AIM_SD_camo","M16A4","m8_carbine","BAF_L85A2_RIS_Holo","BAF_L86A2_ACOG","BAF_L85A2_UGL_ACOG","BAF_L85A2_UGL_SUSAT","BAF_L85A2_UGL_Holo","BAF_L85A2_RIS_ACOG","Sa58P_EP1","Sa58V_CCO_EP1","Sa58V_EP1","AKS_74_kobra","AKS_74_U","AKS_GOLD","AK_47_M","AK_47_S","AK_74","AK_74_GL","AK_107_kobra","AK_107_GL_kobra","AK_107_GL_pso","AK_107_pso","FN_FAL","FN_FAL_ANPVS4","m8_compact","G36A_camo","G36C","m8_holo_sd","G36C_camo","G36K_camo","G36_C_SD_camo","M16A2","M16A2GL","M4A1","M4A1_Aim"];
_lmg_group = ["RPK_74","Pecheneg_DZ","MK_48_DZ","M249_EP1_DZ","M249_DZ","M240_DZ","m240_scoped_EP1_DZE","M249_m145_EP1_DZE","M60A4_EP1_DZE"];
_sniper_group = ["M14_EP1","SVD_CAMO","SVD","VSS_Vintorez","DMR_DZ","M40A3","M24","M24_des_EP1","SVD_des_EP1"];
_chainbullets_group = ["2000Rnd_762x51_M134","100Rnd_127x99_M2","150Rnd_127x107_DSHKM"];


_rares_group = ["ItemVault","ItemBriefcase100oz","ItemLockbox","30m_plot_kit"];
_rare_weapons_group = ["KSVK_DZE","SCAR_H_LNG_Sniper","SCAR_H_LNG_Sniper_SD","SVD_NSPU_EP1","AKS_74_NSPU"];


_legend_group = ["PipeBomb","ItemHotwireKit"];
_legend_w_group = ["BAF_AS50_scoped_DZ","m107_DZ","BAF_LRR_scoped","M110_NVG_EP1","BAF_L85A2_RIS_CWS"];
_chainsaw_group = ["Chainsaw","ChainsawB","ChainsawG","ChainsawP","ChainsawR"];
_gem_group = ["ItemObsidian","ItemCitrine","ItemTopaz","ItemRuby","ItemSapphire","ItemEmerald","ItemAmethyst"];

_randtwo = random(5000) + random(5000);
_randtree = _randtwo + random(10000);


MBC_REWARDLIST = [
     ["group_mag",_junk_group,1,1,2]
	,["group_mag",_food_group,1,1,2]
	
	,["group_wep",_assault_group,1,1,10]
	,["group_wep",_lmg_group,1,1,10]
	,["group_wep",_sniper_group,1,2,9]
	,["group_mag",_common_group,1,2,12]
	,["group_mag",_military_group,1,2,2]
	,["group_mag",_medical_group,2,2,2]
	,["group_mag",_vehicle_repair_group,2,2,2]
	,["group_wep",_tools_group,0,2,6]
	,["magazine","ItemGoldBar10oz",5,2,4]
	,["magazine","PartPlywoodPack",15,2,5]
	,["magazine","PartPlankPack",15,2,5]
	,["coins","Coins",random(5000),2,3]
	
	,["group_wep",_rare_weapons_group,1,3,5]
	,["group_mag",_rares_group,1,3,5]
	,["magazine","ItemGoldBar10oz",10,3,3]
	,["magazine","CinderBlocks",15,3,2]
	,["magazine","PartPlywoodPack",30,3,2]
	,["magazine","PartPlankPack",30,3,3]
	,["magazine","ItemPole",30,3,2]
	,["group_mag",_chainbullets_group,2,3,1]
	,["coins","Coins",_randtwo,3,4]
	
	,["group_wep",_chainsaw_group,0,4,1]
	,["group_wep",_legend_w_group,1,4,1]
	,["group_mag",_gem_group,1,4,1]
	,["group_mag",_legend_group,1,4,1]
	,["magazine","ItemBriefcase_Base",1,4,1]
	,["magazine","CinderBlocks",30,4,1]
	,["coins","Coins",_randtree,4,1]
];

disableSerialization;

private ["_item","_spawnCrate","_crateName","_pos","_crateClass","_dir","_selectDelay","_inVehicle"];

(findDisplay 106) closedisplay 0;
closeDialog 0;

_inVehicle = (vehicle player) != player;
if(_inVehicle) exitWith {
	cutText [format["Voce nao pode abrir em um veiculo.", MBT_NAME] , "PLAIN DOWN"];
};

player playActionNow "Medic";

r_interrupt = false;
_animState = animationState player;
r_doLoop = true;
_started = false;
_finished = false;
_briefSoundPlay = false;
_briefSoundCount = 0;

while {r_doLoop} do {
	_animState = animationState player;
	_isMedic = ["medic",_animState] call fnc_inString;
	_briefSoundCount = _briefSoundCount + 1;
	if (_briefSoundCount > 10 && !_briefSoundPlay) then {
		[objNull, player, rSAY, ["Brief_Open_Sound", 30]] call RE;
		_briefSoundPlay = true;
	};
	if (_isMedic) then {
		_started = true;
	};
	if (_started and !_isMedic) then {
		r_doLoop = false;
		_finished = true;
	};
	if (r_interrupt) then {
		r_doLoop = false;
	};
	sleep 0.1;
};
r_doLoop = false;

if (!_finished) exitWith { 
	r_interrupt = false;
	if (vehicle player == player) then {
		[objNull, player, rSwitchMove,""] call RE;
		player playActionNow "stop";
	};
	cutText [format["Cancelado.",MBT_NAME] , "PLAIN DOWN"];
};

if (_finished) then {

	private ["_dialog","_cashToAdd","_canContinue"];
	mbc_rewardlist_temp = [];
	_canContinue = false;

	_item = "ItemBriefcase_Base";

	if (_item in magazines player) then {
		player removeMagazine _item;
		_canContinue = true;
	};
	
	if (!_canContinue) exitWith {
		cutText [format["Falhou.", MBT_NAME] , "PLAIN DOWN"];
	};

	_crateClass = "USOrdnanceBox";

	_dir = getdir player;
	_pos = getposATL player;
	_pos = [(_pos select 0)+1*sin(_dir),(_pos select 1)+1*cos(_dir), (_pos select 2)];

	_spawnCrate = _crateClass createVehicleLocal _pos;

	_spawnCrate setDir _dir;
	_spawnCrate setposATL _pos;
	
	clearWeaponCargoGlobal _spawnCrate;
	clearMagazineCargoGlobal _spawnCrate;
	clearBackpackCargoGlobal _spawnCrate;
	
	_lootRandomizer = [];
	
	{
		private ["_forEachTempIndexNo"];
		_forEachTempIndexNo = _forEachIndex;
		for "_i" from 1 to (_x select 4) do {
			_lootRandomizer set [count _lootRandomizer, _forEachTempIndexNo];
		};
	} forEach MBC_REWARDLIST;
	
	Sleep 0.2;

	for "_i" from 1 to 6 do {
		private ["_loot","_lootIndex","_lootType"];
		_loot = [];
		_lootIndex = _lootRandomizer call BIS_fnc_selectRandom;
		_loot = + MBC_REWARDLIST;
		_loot = _loot select _lootIndex;
		_lootType = _loot select 0;
		
		switch (_lootType) do {
			case "group_wep": {
				Sleep 0.2;
				_groupingArray = _loot select 1;
				_weapon = _groupingArray call BIS_fnc_selectRandom;
				_loot set [1, _weapon];
				if ((_loot select 2) < 1) then {
					_loot set [2, 0];
				} else {
					_loot set [2, (1 + floor(random 3))];
				};
			};
			case "group_mag": {
				Sleep 0.2;
				_mag = (_loot select 1) call BIS_fnc_selectRandom;
				_loot set [1, _mag];
			};
		};
		mbc_rewardlist_temp set [count mbc_rewardlist_temp, _loot];
		_loot = [];
	};
	
	UpdateMBCDialog = {
		{
			private ["_pic","_text","_itemName","_qty","_addInfo"];
			
			ctrlSetText [81401, MBT_DIALOG_TITLE];
			ctrlSetText [81402, MBT_DIALOG_CLAIM];
			ctrlSetText [81403, MBT_DIALOG_NOTE];
			
			_addInfo = "";
			switch (_x select 0) do {
				case "group_wep": {
					_pic = getText (configFile >> 'CfgWeapons' >> _x select 1 >> 'picture');
					_itemName = getText (configFile >> 'CfgWeapons' >> _x select 1 >> 'displayName');
					_qty = _x select 2;
					_magsCheck = getArray (configFile >> 'CfgWeapons' >> _x select 1 >> 'magazines');
					if (count _magsCheck > 0 && _qty > 0) then {
						_text_mag = if (_qty > 1) then { "magazines" } else { "magazine" };
						_text = format["%1\n+%2 %3", _itemName, _qty, _text_mag];
					} else {
						_text = format["%1", _itemName];
					};
				};
				case "group_mag": {
					_pic = getText (configFile >> 'CfgMagazines' >> _x select 1 >> 'picture');
					_itemName = getText (configFile >> 'CfgMagazines' >> _x select 1 >> 'displayName');
					_qty = _x select 2;
					if (_qty > 1) then {
						_addInfo = format["\nx %1",_qty];
					};
					_text = format["%1%2", _itemName, _addInfo];
				};
				case "coins": {
					_pic = getText (configFile >> 'CfgWeapons' >> 'EvMoney' >> 'picture');
					_qty = _x select 2;
					_text = format["%1 %2", _qty call BIS_fnc_numberText, _x select 1];
				};
				case "weapon": {
					_pic = getText (configFile >> 'CfgWeapons' >> _x select 1 >> 'picture');
					_itemName = getText (configFile >> 'CfgWeapons' >> _x select 1 >> 'displayName');
					_qty = _x select 2;
					if (_qty > 1) then {
						_addInfo = format["\nx %1",_qty];
					};
					_text = format["%1%2", _itemName, _addInfo];
				};
				case "magazine": {
					_pic = getText (configFile >> 'CfgMagazines' >> _x select 1 >> 'picture');
					_itemName = getText (configFile >> 'CfgMagazines' >> _x select 1 >> 'displayName');
					_qty = _x select 2;
					if (_qty > 1) then {
						_addInfo = format["\nx %1",_qty];
					};
					_text = format["%1%2", _itemName, _addInfo];
				};
				case "script": {
					_pic = "";
					_text = _x select 1;
				};
			};
			
			ctrlSetText [81201 + _forEachIndex, _pic];
			ctrlSetText [81301 + _forEachIndex, _text];
			
			_display = findDisplay 81000;
			_frame_ctrl = _display displayCtrl 81101 + _forEachIndex;
			_text_ctrl = _display displayCtrl 81301 + _forEachIndex;
			
			switch (_x select 3) do {
				case 1: {
					_frame_ctrl ctrlSetTextColor [0.6,0.6,0.6,0.5];
					_text_ctrl ctrlSetTextColor [0.6,0.6,0.6,0.5];
				};
				case 2: {
					_frame_ctrl ctrlSetTextColor [1,1,1,0.5];
					_text_ctrl ctrlSetTextColor [1,1,1,0.5];
				};
				case 3: {
					_frame_ctrl ctrlSetTextColor [0.93,0.79,0,0.9];
					_text_ctrl ctrlSetTextColor [0.93,0.79,0,0.9];
				};
				case 4: {
					_frame_ctrl ctrlSetTextColor [0.83,0.29,0.41,1];
					_text_ctrl ctrlSetTextColor [0.83,0.29,0.41,1];
				};
			};
		} forEach mbc_rewardlist_temp;
	};

	Sleep 0.2;
	_dialog = createdialog "MBC_DIALOG";
	call UpdateMBCDialog;
	waitUntil { !dialog };

	cutText [format["Voce abriu a Maleta Premium",MBT_NAME],"PLAIN DOWN"];
	
	Sleep 0.2;
	
	_cashToAdd = 0;
	
	{
		private["_magazines","_magazineClass","_currentMoney"];
		switch (_x select 0) do {
			case "group_wep": {
				_spawnCrate addWeaponCargoGlobal [_x select 1, 1];
				_magazines = getArray (configFile >> "CfgWeapons" >> _x select 1 >> "magazines");
				if (count _magazines > 0 && (_x select 2) > 0) then
				{
					_magazineClass = _magazines select 0;
					_spawnCrate addMagazineCargoGlobal [_magazineClass, _x select 2];
				}
			};
			case "group_mag": {
				_spawnCrate addMagazineCargoGlobal [_x select 1, _x select 2];
			};
			case "coins": {
				_cashToAdd = _cashToAdd + (_x select 2);
			};
			case "weapon": {
				_spawnCrate addWeaponCargoGlobal [_x select 1, _x select 2];
			};
			case "magazine": {
				_spawnCrate addMagazineCargoGlobal [_x select 1, _x select 2];
			};
			case "script": {
				[_x select 2] execVM _x select 1;
			};
		};
		Sleep 0.1;
	} forEach mbc_rewardlist_temp;
	
	if (_cashToAdd > 0) then {
		_currentMoney = player getVariable["Chernobyl",0];
		player setVariable["Chernobyl",_currentMoney + _cashToAdd, true];
	};
	
	PVDZE_plr_Save = [player,(magazines player),true,true] ;
	publicVariableServer "PVDZE_plr_Save";
	
	sleep MBT_CRATEDELAY;
	deletevehicle _spawnCrate;

};