Private["_cash","_dropPrimary","_dropSecondary","_primaryWeapon","_selection","_lybonreh","_lybonrehc","_myMoney","_namtest","_message"];

_cash = player getVariable ["Chernobyl",0];
_dropPrimary = false;
_dropSecondary = false;

if (isNil "nam_script") then {
nam_script = true;
};

if (nam_script) exitwith{
cutText [format["Espere ate o termino para tentar denovo."], "PLAIN DOWN"];
};
nam_script = true;

cutText [format["Lembre de guardar sua arma principal na mochila."], "PLAIN DOWN"];
sleep 5;

if (_cash < 1000) then {
titleText [format["Voce nao tem dinheiro, custa 1000 coins."] , "PLAIN DOWN", 2];
nam_script = false;
} else {

_primaryWeapon = primaryWeapon player;
if (_primaryWeapon != "") exitwith {
nam_script = false;
cutText [format["Guarde sua arma na mochila e tente novamente."], "PLAIN DOWN"];
};
	
_selection = random(100);

if (_selection <= 44) then {
cutText [format["Voce esta com azar hein."], "PLAIN DOWN"];
_lybonreh = ["AK_74","LeeEnfield","M4A1","M16A2","MP5SD"];
_lybonrehc = _lybonreh call BIS_fnc_selectRandom;
};

if ((_selection > 44) && (_selection < 70)) then {
cutText [format["Voce conseguiu uma arma de baixo nivel."], "PLAIN DOWN"];
_lybonreh = ["M16A2GL","M4A1_Aim","Sa58V_EP1","Sa58P_EP1","M4A3_CCO_EP1","M16A4"];
_lybonrehc = _lybonreh call BIS_fnc_selectRandom;
};

if ((_selection > 69) && (_selection < 86)) then {
cutText [format["Voce conseguiu uma arma de nivel medio."], "PLAIN DOWN"];
_lybonreh = ["M240_DZ","SVD_CAMO","M249_DZ","SVD","G36K_camo","M14_EP1","SCAR_L_CQC","SVD_des_EP1","M8_sharpshooter","M4A1_HWS_GL_camo","M4A1_AIM_SD_camo","m8_carbine","BAF_L85A2_RIS_Holo","BAF_L86A2_ACOG","BAF_L85A2_UGL_ACOG","BAF_L85A2_UGL_SUSAT","BAF_L85A2_UGL_Holo","BAF_L85A2_RIS_ACOG","Sa58V_CCO_EP1","AKS_74_kobra","AKS_74_U","AKS_GOLD","AK_47_M","AK_47_S","AK_74_GL","AK_107_kobra","AK_107_GL_kobra","AK_107_GL_pso","AK_107_pso","FN_FAL","m8_compact","G36A_camo","G36C","m8_holo_sd","G36C_camo","G36_C_SD_camo"];
_lybonrehc = _lybonreh call BIS_fnc_selectRandom;
};

if ((_selection > 85) && (_selection < 94)) then {
cutText [format["Voce conseguiu uma arma de alto nivel."], "PLAIN DOWN"];
_lybonreh = ["RPK_74","Mk_48_DZ","m240_scoped_EP1_DZE","FN_FAL_ANPVS4","M249_m145_EP1_DZE","SCAR_L_CQC_Holo","SCAR_L_STD_EGLM_RCO","SCAR_L_CQC_EGLM_Holo","SCAR_L_CQC_CCO_SD","SCAR_H_CQC_CCO","SCAR_H_CQC_CCO_SD","SCAR_L_STD_Mk4CQT","SCAR_L_STD_Holo","M60A4_EP1_DZE","M24","Pecheneg_DZ","M40A3","M24_des_EP1","VSS_Vintorez","DMR_DZ","AKS_74_NSPU"];
_lybonrehc = _lybonreh call BIS_fnc_selectRandom;
};

if ((_selection > 93) && (_selection < 99)) then {
cutText [format["Voce conseguiu uma arma rara."], "PLAIN DOWN"];
_lybonreh = ["KSVK_DZE","SCAR_H_LNG_Sniper","m107_DZ","BAF_LRR_scoped_W","M110_NVG_EP1","SCAR_H_LNG_Sniper_SD","SVD_NSPU_EP1"];
_lybonrehc = _lybonreh call BIS_fnc_selectRandom;
};

if ((_selection > 98) && (_selection < 101)) then {
cutText [format["Voce conseguiu uma arma Rarissima."], "PLAIN DOWN"];
_lybonreh = ["BAF_AS50_scoped_DZ","SMAW","Javelin","BAF_L85A2_RIS_CWS"];
_lybonrehc = _lybonreh call BIS_fnc_selectRandom;
};

_myMoney = _cash - 1000;
player setVariable ["Chernobyl", _myMoney , true];

sleep 3;
_namtest = getText(configFile >> "cfgWeapons" >> _lybonrehc >> "displayName");
_message = format["%1 conseguiu uma %2", (name player), _namtest];
[nil,nil,rTitleText,_message, "PLAIN",6] call RE;

player addWeapon _lybonrehc;
nam_script = true;
}; 