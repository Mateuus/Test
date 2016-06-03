_lastSaveTime = 120;
_saveTime = time - lastSave;
if(_saveTime < _lastSaveTime) exitWith {
	cutText [format["Voce deve esperar 2 minutos para salvar %1 Segundos faltando",(_saveTime - _lastSaveTime)], "PLAIN DOWN"];
};

playerSave = {
player setVariable['medForceUpdate',true,true];
lastSave = time;
systemChat('Salvou seu player, Isto e esperimental e pode ser que nao funcione 100%');
};
[] call playerSave;
