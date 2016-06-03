player setVariable ["Chernobyl", 1 , true];
player switchMove "AdthPercMstpSlowWrf_beating";
[objNull, player, rSAY, ["dieScream", 100]] call RE;
sleep 2;
player setDamage 1;
player setVariable ["Chernobyl", 1 , true];