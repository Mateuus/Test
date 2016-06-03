SlotsPlayerCredits = 0;
IsSpinning = false;
reelArray = ["cherry","lemon","grape","watermelon","orange","bar","seven","diamond"];
slotspictures = ["pictures\image1.paa","pictures\image2.paa","pictures\image3.paa","pictures\image4.paa","pictures\image5.paa","pictures\image6.paa","pictures\image7.paa","pictures\image8.paa"];
	
	slotsprize1 = 100;
	slotsprize2 = 200;
	slotsprize3 = 300;
	slotsprize4 = 400;
	slotsprize5 = 500;
	slotsprize6 = 800;
	slotsprize7 = 1000;

hasSlotsCredits = false;

fnc_add_1_credits = {
if(IsSpinning)then{
		titleText ["Espere ate o termino da rodada!","PLAIN DOWN"]; titleFadeOut 3;
	 } else {
	   _cash_nam = player getVariable ["Chernobyl",0];
	   if (_cash_nam >= 100) then {
		 _myMoney_nam = _cash_nam - 100;
		 player setVariable ["Chernobyl", _myMoney_nam , true];
		 SlotsPlayerCredits = SlotsPlayerCredits + 1;
		 ctrlSetText[1001, format ["%1" ,SlotsPlayerCredits]];
	   }else{
		 titleText ["Voce precisa de 100 coins!","PLAIN DOWN"];
		 titleFadeOut 3;
	   };
   };
};

fnc_add_10_credits = {
if(IsSpinning)then{
		titleText ["Espere ate o termino da rodada!","PLAIN DOWN"]; titleFadeOut 3;
	 } else {
	   _cash_nam = player getVariable ["Chernobyl",0];
	   if (_cash_nam >= 1000) then {
		 _myMoney_nam = _cash_nam - 1000;
		 player setVariable ["Chernobyl", _myMoney_nam , true];
		 SlotsPlayerCredits = SlotsPlayerCredits + 10;
		 ctrlSetText[1001, format ["%1" ,SlotsPlayerCredits]];
	   }else{
		 titleText ["Voce precisa de 1000 coins!","PLAIN DOWN"]; titleFadeOut 3;
	   };
   };
};

fnc_random_pictures = {
	_counter = 0;
	while {_counter < 15} do
	{
	ReelImage1 = slotspictures call BIS_fnc_selectRandom;
	ReelImage2 = slotspictures call BIS_fnc_selectRandom;
	ReelImage3 = slotspictures call BIS_fnc_selectRandom;
	ctrlSetText[1200, format ["%1" ,ReelImage1]];
	ctrlSetText[1201, format ["%1" ,ReelImage2]];
	ctrlSetText[1202, format ["%1" ,ReelImage3]];
	sleep 0.01;
		_counter = _counter + 1;
	};
};

fnc_spin  = {
	if(IsSpinning)then{
		titleText ["Espere ate o termino da rodada!","PLAIN DOWN"]; titleFadeOut 3;
	 } else {
	   if (SlotsPlayerCredits <= 0) then {
		 hasSlotsCredits = false;
		 titleText ["Voce nao tem creditos!","PLAIN DOWN"]; titleFadeOut 3;
	   }else{
		 hasSlotsCredits = true;
	   };
	   
	   if (hasSlotsCredits) then {
		 IsSpinning = true;
		 SlotsPlayerCredits = SlotsPlayerCredits - 1;
		 ctrlSetText[1001, format ["%1" ,SlotsPlayerCredits]];
		 call fnc_random_pictures;
		 SlotsWinChance = random 100;
		 if(SlotsWinChance > 90) then{
			reel1 = reelArray call BIS_fnc_selectRandom;
			reel2 = reel1;
			reel3 = reel1;
		 }else{
			reel1 = reelArray call BIS_fnc_selectRandom;
			reel2 = reelArray call BIS_fnc_selectRandom;
			reel3 = reelArray call BIS_fnc_selectRandom;
		 };
		 sleep 0.1;
		 call fnc_display_pictures;
		 call fnc_payout;
	   };
	};
};
fnc_display_pictures = {
   if (reel1 == "cherry") then {
    ctrlSetText [1200, "pictures\image1.paa"];
   };
   if (reel1 == "lemon") then {
    ctrlSetText [1200, "pictures\image2.paa"];
   };
   if (reel1 == "grape") then {
    ctrlSetText [1200, "pictures\image3.paa"];
   };
   if (reel1 == "watermelon") then {
    ctrlSetText [1200, "pictures\image4.paa"];
   };
   if (reel1 == "orange") then {
    ctrlSetText [1200, "pictures\image5.paa"];
   };
   if (reel1 == "bar") then {
    ctrlSetText [1200, "pictures\image6.paa"];
   };
   if (reel1 == "seven") then {
    ctrlSetText [1200, "pictures\image7.paa"];
   };
   if (reel1 == "diamond") then {
    ctrlSetText [1200, "pictures\image8.paa"];
   };
   if (reel2 == "cherry") then {
    ctrlSetText [1201,"pictures\image1.paa"];
   };
   if (reel2 == "lemon") then {
    ctrlSetText [1201,"pictures\image2.paa"];
   };
   if (reel2 == "grape") then {
    ctrlSetText [1201,"pictures\image3.paa"];
   };
   if (reel2 == "watermelon") then {
    ctrlSetText [1201,"pictures\image4.paa"];
   };
   if (reel2 == "orange") then {
    ctrlSetText [1201,"pictures\image5.paa"];
   };
   if (reel2 == "bar") then {
    ctrlSetText [1201,"pictures\image6.paa"];
   };
   if (reel2 == "seven") then {
    ctrlSetText [1201,"pictures\image7.paa"];
   };
   if (reel2 == "diamond") then {
    ctrlSetText [1201,"pictures\image8.paa"];
   };
   if (reel3 == "cherry") then {
    ctrlSetText [1202,"pictures\image1.paa"];
   };
   if (reel3 == "lemon") then {
    ctrlSetText [1202,"pictures\image2.paa"];
   };
   if (reel3 == "grape") then {
    ctrlSetText [1202,"pictures\image3.paa"];
   };
   if (reel3 == "watermelon") then {
    ctrlSetText [1202,"pictures\image4.paa"];
   };
   if (reel3 == "orange") then {
    ctrlSetText [1202,"pictures\image5.paa"];
   };
   if (reel3 == "bar") then {
    ctrlSetText [1202,"pictures\image6.paa"];
   };
   if (reel3 == "seven") then {
    ctrlSetText [1202,"pictures\image7.paa"];
   };
   if (reel3 == "diamond") then {
    ctrlSetText [1202,"pictures\image8.paa"];
   };
};

fnc_payout = {
   if ((reel1 == reel2) && (reel2 == reel3)) then {
     if (reel1 == "cherry") then {
       titleText ["Voce ganhou 100 coins!","PLAIN DOWN"]; titleFadeOut 3;
	   _cash_n = player getVariable ["Chernobyl",0];
       _myMoney_n = _cash_n + slotsprize1;
       player setVariable ["Chernobyl", _myMoney_n , true];
     };
     if (reel1 == "lemon") then {
       titleText ["Voce ganhou 200 coins!","PLAIN DOWN"]; titleFadeOut 3;
	   _cash_n = player getVariable ["Chernobyl",0];
       _myMoney_n = _cash_n + slotsprize2;
       player setVariable ["Chernobyl", _myMoney_n , true];
     };
     if (reel1 == "grape") then {
       titleText ["Voce ganhou 300 coins!","PLAIN DOWN"]; titleFadeOut 3;
	   _cash_n = player getVariable ["Chernobyl",0];
       _myMoney_n = _cash_n + slotsprize3;
       player setVariable ["Chernobyl", _myMoney_n , true];
     };
     if (reel1 == "watermelon") then {
       titleText ["Voce ganhou 400 coins!","PLAIN DOWN"]; titleFadeOut 3;
	   _cash_n = player getVariable ["Chernobyl",0];
       _myMoney_n = _cash_n + slotsprize4;
       player setVariable ["Chernobyl", _myMoney_n , true];
     };
     if (reel1 == "orange") then {
       titleText ["Voce ganhou 500 coins!","PLAIN DOWN"]; titleFadeOut 3;
	   _cash_n = player getVariable ["Chernobyl",0];
       _myMoney_n = _cash_n + slotsprize5;
       player setVariable ["Chernobyl", _myMoney_n , true];
     };
     if (reel1 == "bar") then {
       titleText ["Voce ganhou 800 coins!","PLAIN DOWN"]; titleFadeOut 3;
	   _cash_n = player getVariable ["Chernobyl",0];
       _myMoney_n = _cash_n + slotsprize6;
       player setVariable ["Chernobyl", _myMoney_n , true];
     };
     if (reel1 == "seven") then {
       titleText ["Jackpot! Voce ganhou 1000 coins!","PLAIN DOWN"]; titleFadeOut 3;
	   _cash_n = player getVariable ["Chernobyl",0];
       _myMoney_n = _cash_n + slotsprize7;
       player setVariable ["Chernobyl", _myMoney_n , true];
     };
     if (reel1 == "diamond") then {
       SlotsPlayerCredits = SlotsPlayerCredits + 10;
	   //update credits display     
		ctrlSetText[1001, format ["%1" ,SlotsPlayerCredits]];
       titleText ["Voce ganhou 10 creditos!","PLAIN DOWN"]; titleFadeOut 3;
     };
   }else{
     titleText ["Voce perdeu.","PLAIN DOWN"]; titleFadeOut 3;
   };
   IsSpinning = false;
};

fnc_reset_slots = {
	SlotsPlayerCredits = 0;
	IsSpinning = false;
};

fnc_cash_out = {
	if (IsSpinning) then {
		titleText ["Espere o termino da rodada!","PLAIN DOWN"]; titleFadeOut 3;
	}else{
		if (SlotsPlayerCredits > 0) then {
			while {SlotsPlayerCredits > 0} do
			{
				if (SlotsPlayerCredits > 10) then {
					player addMagazine slotsprize2;
					SlotsPlayerCredits = SlotsPlayerCredits - 10;
				}else{
					player addMagazine slotsprize1;
					SlotsPlayerCredits = SlotsPlayerCredits - 1;
				};
			};
			titleText ["Creditos devolvidos.","PLAIN DOWN"]; titleFadeOut 3;
			sleep 0.01;
			call fnc_reset_slots;
		};
	};
};