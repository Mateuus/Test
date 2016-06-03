EVDSellVehicles = true;

EVDGetMaterials = {
	private ["_type","_materials"];

	_type = _this select 0;

	switch (_type) do {
		case "MMT_Civ":		{ _materials = [["PartGeneric", 1]]; };
		case "TT650_Civ":	{ _materials = [["PartEngine", 1], ["PartWheel", 1]]; };
		case "CSJ_GyroC":	{ _materials = [["PartGeneric", 1], ["PartEngine", 1], ["PartVRotor", 1]]; };
	};

	_materials;
};
