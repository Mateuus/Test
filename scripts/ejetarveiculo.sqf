
	_veh = _this select 0;
	
	if(count (crew _veh) <= 1) exitWith { systemchat "Não tem ninguem no seu veiculo."; };
	if(speed _veh > 10) exitWith { systemchat "Você está muito rápido."; };
	
	{
		if(_x != driver _veh) then {
		_x action ["Eject", _veh];
		};
	} foreach (crew _veh);
	
	systemchat "Você expulsou os passageiros do seu veiculo.";