
private ["_object","_objectSnapGizmo","_objColorActive","_objColorInactive","_classname","_whitelist","_points","_radius","_cfg","_cnt","_pos","_findWhitelisted","_nearbyObject","_posNearby","_selectedAction","_newPos","_pointsNearby","_onWater","_waterBase"];
snapActionState = _this select 3 select 0;
_object = _this select 3 select 1;
_classname = _this select 3 select 2;
_objectHelper = _this select 3 select 3;
_selectedAction = _this select 3 select 4;

_cfg = (missionConfigFile >> "SnapBuilding" >> _classname);
_whitelist = getArray (_cfg >> "snapTo");
_points = getArray (_cfg >> "points");
_radius = getNumber (_cfg >> "radius");

_objColorActive = "#(argb,8,8,3)color(0,0.92,0.06,1,ca)";
_objColorInactive = "#(argb,8,8,3)color(0.04,0.84,0.92,0.3,ca)";


fnc_snapActionCleanup = {
	private ["_s1","_s2","_s3","_cnt"];
	_s1 = _this select 0;
	_s2 = _this select 1;
	_s3 = _this select 2;
	player removeAction s_player_toggleSnap; s_player_toggleSnap = -1;
	player removeAction s_player_toggleSnapSelect; s_player_toggleSnapSelect = -1;
	if (count s_player_toggleSnapSelectPoint != 0) then {{player removeAction _x;} count s_player_toggleSnapSelectPoint; s_player_toggleSnapSelectPoint=[]; snapActions = -1;};
	if (_s1 > 0) then {
		s_player_toggleSnap = player addaction [format[("<t color=""#ffffff"">" + ("Snap: %1") +"</t>"),snapActionState],"custom\snap_pro\snap_build.sqf",[snapActionState,_object,_classname,_objectHelper],6,false,true];
	};
	if (_s2 > 0) then {
		s_player_toggleSnapSelect = player addaction [format[("<t color=""#ffffff"">" + ("Snap Point: %1") +"</t>"),snapActionStateSelect],"custom\snap_pro\snap_build.sqf",[snapActionStateSelect,_object,_classname,_objectHelper],5,false,true];
	};
	if (_s3 > 0) then {
		s_player_toggleSnapSelectPoint=[];
		_cnt = 0;
		{snapActions = player addaction [format[("<t color=""#ffffff"">" + ("%1)Select: %2") +"</t>"),_cnt,_x select 3],"custom\snap_pro\snap_build.sqf",["Selected",_object,_classname,_objectHelper,_cnt],4,false,false];
		s_player_toggleSnapSelectPoint set [count s_player_toggleSnapSelectPoint,snapActions];
		_cnt = _cnt+1;
	}count _points;
	};
};

fnc_initSnapPoints = {
	snapGizmos = [];
	{
		_objectSnapGizmo = "Sign_sphere10cm_EP1" createVehicleLocal [0,0,0];
		_objectSnapGizmo setobjecttexture [0,_objColorInactive];
		_objectSnapGizmo attachTo [_object,[_x select 0,_x select 1,_x select 2]];
		snapGizmos set [count snapGizmos,_objectSnapGizmo];
	} count _points;
};

fnc_initSnapPointsNearby = {
	_pos = [_object] call FNC_GetPos;
	_findWhitelisted = []; _pointsNearby = [];
	_findWhitelisted = nearestObjects [_pos,_whitelist,(_radius + DZE_snapExtraRange)]-[_object];
	snapGizmosNearby = [];	
	{	
		_nearbyObject = _x;
		_pointsNearby = getArray (missionConfigFile >> "SnapBuilding" >> (typeOf _x) >> "points");
		{
			_objectSnapGizmo = "Sign_sphere10cm_EP1" createVehicleLocal [0,0,0];
			_objectSnapGizmo setobjecttexture [0,_objColorInactive];
			_objectSnapGizmo setDir (getDir _nearbyObject);
			_posNearby = _nearbyObject modelToWorld [_x select 0,_x select 1,_x select 2];
			if (surfaceIsWater _posNearby) then {
				_objectSnapGizmo setPosASL [(_posNearby) select 0,(_posNearby) select 1,(getPosASL _nearbyObject select 2) + (_x select 2)];
			} else {
				_objectSnapGizmo setPosATL _posNearby;
			};
			snapGizmosNearby set [count snapGizmosNearby,_objectSnapGizmo];
		} count _pointsNearby;
	} forEach _findWhitelisted;
};

fnc_initSnapPointsCleanup = {
	{detach _x;deleteVehicle _x;}count snapGizmos;snapGizmos=[];
	{detach _x;deleteVehicle _x;}count snapGizmosNearby;snapGizmosNearby=[];
	snapActionState = "OFF";
};

fnc_snapDistanceCheck = {
	while {snapActionState != "OFF"} do {
	private ["_distClosestPointFound","_distCheck","_distClosest","_distClosestPoint","_testXPos","_testXDir","_distClosestPointFoundPos","_distClosestPointFoundDir","_distClosestAttached","_distCheckAttached","_distClosestAttachedFoundPos"];
	_distClosestPointFound = objNull; _distCheck = 0; _distClosest = 10; _distClosestPoint = objNull; _testXPos = []; _distClosestPointFoundPos =[]; _distClosestPointFoundDir = 0;
		{	
			if (_x !=_distClosestPointFound) then {_x setobjecttexture [0,_objColorInactive];};
			_testXPos = [_x] call FNC_GetPos;
			_distCheck = _objectHelper distance _testXPos;
			_distClosestPoint = _x;
				if (_distCheck < _distClosest) then {
					_distClosest = _distCheck;
					_distClosestPointFound setobjecttexture [0,_objColorInactive];
					_distClosestPointFound = _x;
					_distClosestPointFound setobjecttexture [0,_objColorActive];
				};
		} count snapGizmosNearby;	
		
		if (!isNull _distClosestPointFound) then { 
			if (snapActionStateSelect == "Manual") then {
				if (helperDetach) then {
					_onWater = surfaceIsWater position _distClosestPointFound;
					_distClosestPointFoundDir = getDir _distClosestPointFound;
					if (_onWater) then {
						_distClosestPointFoundPos = getPosASL _distClosestPointFound;
						_objectHelper setPosASL _distClosestPointFoundPos;
					} else {
						_distClosestPointFoundPos = getPosATL _distClosestPointFound;
						_objectHelper setPosATL _distClosestPointFoundPos;
					};
					_objectHelper setDir _distClosestPointFoundDir;
					DZE_memDir = _distClosestPointFoundDir;
					[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
					waitUntil {sleep 0.1; !helperDetach};
				};
			} else {
				_distClosestAttached = objNull; _distCheckAttached = 0; _distClosest = 10; _distClosestAttachedFoundPos = [];
				{
					if (_x !=_distClosestAttached) then {_x setobjecttexture [0,_objColorInactive];};
					_testXPos = [_x] call FNC_GetPos;
					_distCheckAttached = _distClosestPointFound distance _testXPos;
					_distClosestPoint = _x;
						if (_distCheckAttached < _distClosest) then {
							_distClosest = _distCheckAttached;
							_distClosestAttached setobjecttexture [0,_objColorInactive];
							_distClosestAttached = _x;
							_distClosestAttached setobjecttexture [0,_objColorActive];
						};
				} count snapGizmos;
			
				if (helperDetach) then {
					_distClosestPointFoundDir = getDir _distClosestPointFound;
					_onWater = surfaceIsWater position _distClosestPointFound;
					if (_onWater) then {
						_distClosestPointFoundPos = getPosASL _distClosestPointFound;
						_distClosestAttachedFoundPos = getPosASL _distClosestAttached;
						detach _object;
						_objectHelper setPosASL _distClosestAttachedFoundPos;
						_object attachTo [_objectHelper];
						_objectHelper setPosASL _distClosestPointFoundPos;
					} else {
						_distClosestPointFoundPos = getPosATL _distClosestPointFound;
						_distClosestAttachedFoundPos = getPosATL _distClosestAttached;
						detach _object;
						_objectHelper setPosATL _distClosestAttachedFoundPos;
						_object attachTo [_objectHelper];
						_objectHelper setPosATL _distClosestPointFoundPos;
					};
					_objectHelper setDir _distClosestPointFoundDir;
					DZE_memDir = _distClosestPointFoundDir;
					[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
					waitUntil {sleep 0.1; !helperDetach};
				};
			};
		};
		sleep 0.1;
	};
};

fnc_initSnapTutorial = {
	private ["_bldTxtSwitch","_bldTxtEnable","_bldTxtClrO","_bldTxtClrC","_bldTxtClrW","_bldTxtClrR","_bldTxtClrG","_bldTxtSz","_bldTxtSzT","_bldTxtShdw","_bldTxtAlgnL","_bldTxtUndrln","_bldTxtBold","_bldTxtFinal","_bldTxtStringTitle","_bldTxtStringSD","_bldTxtStringSE","_bldTxtStringSA","_bldTxtStringSM","_bldTxtStringPG","_bldTxtStringAPG","_bldTxtStringCPG","_bldTxtStringQE","_bldTxtStringQEF","_bldTxtStringFD","_bldTxtStringFS"];
		if (isNil "snapTutorial") then { 
			_bldTxtSwitch = _this select 0;
			_bldTxtEnable = _this select 1;
			_bldTxtClrO = "color='#ff8800'";
			_bldTxtClrC = "color='#17DBEC'";
			_bldTxtClrW = "color='#ffffff'";
			_bldTxtClrR = "color='#fd0a05'";
			_bldTxtClrG = "color='#11ef00'";
			_bldTxtSz = "size='0.76'";
			_bldTxtSzT = "size='0.4'";
			_bldTxtShdw = "shadow='1'";
			_bldTxtAlgnL = "align='left'";
			_bldTxtUndrln = "underline='true'";
			_bldTxtBold = "font='Zeppelin33'";
			_bldTxtFinal = "";
			
			800 cutRsc ["Default", "PLAIN"];
			sleep 0.1;
			
			if (_bldTxtEnable) then {
				_bldTxtStringTitle = format ["<t %1%2%3%4>Snap Building</t><br />",_bldTxtClrO,_bldTxtSz,_bldTxtShdw,_bldTxtAlgnL,_bldTxtClrW,_bldTxtUndrln,_bldTxtBold];
				_bldTxtStringSD = format["<t %1%4%5%6>[Snap]<t %2> Disabled:</t> <t %3>Use o menu para ativar. Depois de ativar APERTE F</t></t><br /><br />",_bldTxtClrC,_bldTxtClrR,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];
				_bldTxtStringSE = format["<t %1%4%5%6>[Snap]<t %2> Enabled:</t> <t %3>Use o menu para desativar. Se ja ativou APERTE F</t></t><br /><br />",_bldTxtClrC,_bldTxtClrG,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];
				_bldTxtStringSA = format["<t %1%3%4%5>[Snap Point]<t %2> AUTOMATIC: Detecta automaticamente o ponto.</t></t><br /><br />",_bldTxtClrC,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];
				_bldTxtStringSM = format["<t %1%3%4%5>[Snap Point]<t %2> MANUAL: Seleciona os pontos manualmente.</t></t><br /><br />",_bldTxtClrC,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];
				_bldTxtStringPG = format["<t %1%3%4%5>[PgUP / PgDOWN]<t %2>: Ajuste altura em 10cm</t></t><br />",_bldTxtClrC,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];
				_bldTxtStringAPG = format["<t %1%3%4%5>[Alt]+[PgUP / PgDOWN]<t %2>: Ajusta altura em 1m</t></t><br />",_bldTxtClrC,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];
				_bldTxtStringCPG = format["<t %1%3%4%5>[Ctrl]+[PgUP / PgDOWN]<t %2>: Ajusta altura em 1cm</t></t><br />",_bldTxtClrC,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];
				_bldTxtStringQE = format["<t %1%3%4%5>[Q / E]<t %2>: Roda em 180 graus o objeto enquanto o segura.</t></t><br />",_bldTxtClrC,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];
				_bldTxtStringQEF = format["<t %1%3%4%5>[Q / E]<t %2>: Roda em 45 graus o objeto enquanto estiver no ponto ou no chao.</t></t><br /><br />",_bldTxtClrC,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];
				_bldTxtStringFD = format["<t %1%3%4%5>[F]<t %2>: Joga / Pega objeto.</t></t><br />",_bldTxtClrO,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];
				_bldTxtStringFS = format["<t %1%3%4%5>[F]<t %2>: Liga Snap / Pega objeto / Use F para selecionar o ponto.</t></t><br />",_bldTxtClrO,_bldTxtClrW,_bldTxtSzT,_bldTxtShdw,_bldTxtAlgnL];
				switch (_bldTxtSwitch) do {
					case "init": {
						_bldTxtFinal = _bldTxtStringTitle + _bldTxtStringSD + _bldTxtStringPG + _bldTxtStringAPG + _bldTxtStringCPG + _bldTxtStringQE + _bldTxtStringQEF + _bldTxtStringFD;
					};
					case "OnAuto": {
						_bldTxtFinal = _bldTxtStringTitle + _bldTxtStringSE + _bldTxtStringSA + _bldTxtStringPG + _bldTxtStringAPG + _bldTxtStringCPG + _bldTxtStringQE + _bldTxtStringQEF + _bldTxtStringFS;
					};
					case "manual": {
						_bldTxtFinal = _bldTxtStringTitle + _bldTxtStringSE + _bldTxtStringSM + _bldTxtStringPG + _bldTxtStringAPG + _bldTxtStringCPG + _bldTxtStringQE + _bldTxtStringQEF + _bldTxtStringFS;
					};
				};

				[
					_bldTxtFinal, 
					0.73 * safezoneW + safezoneX, 
					0.65 * safezoneH + safezoneY,
					30, 
					1, 
					0, 
					800 
				] spawn bis_fnc_dynamicText;
			};
		};	
};

switch (snapActionState) do {
	case "Init": {
		["init",true] call fnc_initSnapTutorial;
		snapActionState = "OFF";
		[1,0,0] call fnc_snapActionCleanup;
		[] spawn {
		while {true} do {
			if(!DZE_ActionInProgress || DZE_cancelBuilding) exitWith {call fnc_initSnapPointsCleanup;[0,0,0] call fnc_snapActionCleanup; ["",false] call fnc_initSnapTutorial; snapActionState = "OFF";};
			sleep 2;
			};
		};
	};
	case "OFF": {
		["OnAuto",true] call fnc_initSnapTutorial;
		snapActionState = "ON"; snapActionStateSelect = "Auto";
		[1,1,0] call fnc_snapActionCleanup;
		call fnc_initSnapPoints;
		call fnc_initSnapPointsNearby;
		sleep 0.25;
		call fnc_snapDistanceCheck;
	};
	
	case "ON": {
		["init",true] call fnc_initSnapTutorial;
		snapActionState = "OFF";
		[1,0,0] call fnc_snapActionCleanup;
		call fnc_initSnapPointsCleanup;
	};
	
	case "Auto": {
		["manual",true] call fnc_initSnapTutorial;
		snapActionState = "ON";snapActionStateSelect = "Manual";
		[1,1,1] call fnc_snapActionCleanup;
	};
	
	case "Manual": {
		["OnAuto",true] call fnc_initSnapTutorial;
		snapActionState = "ON";snapActionStateSelect = "Auto";
		[1,1,0] call fnc_snapActionCleanup;
	};
	
	case "Selected": { _cnt = 0; _newPos = [];
{	
	_x setobjecttexture [0,_objColorInactive];
	if (_cnt == _selectedAction) then {
		_newPos = [(getPosATL _x select 0),(getPosATL _x select 1),(getPosATL _x select 2)];
		detach _object;
		detach _objectHelper;
		_objectHelper setDir (getDir _object);
		_objectHelper setPosATL _newPos;
		_object attachTo [_objectHelper];
		_x setobjecttexture [0,_objColorActive];
		if (!helperDetach) then {_objectHelper attachTo [player]; _objectHelper setDir ((getDir _objectHelper)-(getDir player));};
		[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
	};
	_cnt = _cnt+1;
}count snapGizmos;
	};
};
