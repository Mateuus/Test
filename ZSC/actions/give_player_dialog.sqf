private ["_dialog"];
ZSC_GiveMoneyTarget = cursorTarget;
if( isPlayer ZSC_GiveMoneyTarget)then{
_dialog = createdialog "GivePlayerDialog";
call GivePlayerDialogAmounts;
}else{
systemChat format["Voce nao esta olhando diretamente para o player"];
};
