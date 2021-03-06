private ["_control","_button","_parent","_group","_pos","_item","_conf","_name","_cfgActions","_numActions","_height","_menu","_config","_type","_script","_outputOriented","_compile","_array","_outputClass","_outputType"];
disableSerialization;
_control =  _this select 0;
_button =   _this select 1;
_parent =   findDisplay 106;

if (!DZE_SelfTransfuse && ((gearSlotData _control) == "ItemBloodBag")) exitWith {};
if (_button == 1) then {
    _group = _parent displayCtrl 6902;
    
    _pos =      ctrlPosition _group;
    _pos set [0,((_this select 2) + 0.48)];
    _pos set [1,((_this select 3) + 0.07)];
    
    _item = gearSlotData _control;
    
    _conf = configFile >> "cfgMagazines" >> _item;
    if (!isClass _conf) then {
        _conf = configFile >> "cfgWeapons" >> _item;
    };
    _name = getText(_conf >> "displayName");
    
    _cfgActions = _conf >> "ItemActions";
    _numActions = (count _cfgActions);
    _height = 0;
    
    for "_i" from 0 to (_numActions - 1) do 
    {
        _menu =     _parent displayCtrl (1600 + _i);
        _menu ctrlShow true;
        _config =   (_cfgActions select _i);
        _type =     getText (_config >> "text");
        _script =   getText (_config >> "script");
        _outputOriented =   getNumber   (_config >> "outputOriented") == 1;
        _height = _height + (0.025 * safezoneH);
        _compile =  format["_id = '%2' %1;",_script,_item];
        uiNamespace setVariable ['uiControl', _control];
        if (_outputOriented) then {    
            _array =    getArray    (_config >> "output");
            _outputClass = _array select 0;
            _outputType = _array select 1;
            _name = getText (configFile >> _outputType >> _outputClass >> "displayName");
            _compile =  format["_id = ['%2',%3] %1;",_script,_item,_array];
        };
        
        _menu ctrlSetText format[_type,_name];
        _menu ctrlSetEventHandler ["ButtonClick",_compile];
    };
	
    {
        private["_classname","_text","_execute","_condition"];
        _classname   = _x select 0;
        _text        = _x select 1;
        _execute     = _x select 2;
        _condition   = _x select 3;
        if(_item == _classname && (call compile _condition)) then {
            _menu = _parent displayCtrl (1600 + _numActions);
            _menu ctrlShow true;
            _height = _height + (0.025 * safezoneH);
            uiNamespace setVariable ['uiControl', _control];
            _menu ctrlSetText _text;
            _menu ctrlSetEventHandler ["ButtonClick",_execute];
            _numActions = _numActions + 1;
        };
    } forEach DZE_CLICK_ACTIONS;

        _colors = ["ItemKeyYellow","ItemKeyBlue","ItemKeyRed","ItemKeyGreen","ItemKeyBlack"];
		if (configName(inheritsFrom(configFile >> "CfgWeapons" >> _item)) in _colors) then {
			_keyOwner = getNumber(configFile >> "CfgWeapons" >> _item >> "keyid");
            _keyName = getText(configFile >> "CfgWeapons" >> _item >> "displayName");

            _control =  _parent displayCtrl (1600 + _numActions);
            _control ctrlShow true;
            _height = _height + (0.025 * safezoneH);
            _script =  "custom\vehicle_pointer.sqf";
            _exescript = format["_id = ['%2','%3'] execVM '%1';closeDialog 0;",_script,_keyOwner,_keyName];
            uiNamespace setVariable ['uiControl', _control];
            _control ctrlSetText "Apontar veiculo";
            _control ctrlSetTextColor [0.3,0.4,1,1];
            _control ctrlSetTooltip "Aponta veiculo ou Marca ele no mapa.";
            _control ctrlSetTooltipColorBox [0.3,0.4,1,1];
            _control ctrlSetTooltipColorShade [0, 0, 0, 1];
            _control ctrlSetTooltipColorText [0.3,0.4,1,1];
            _control ctrlSetEventHandler ["ButtonClick",_exescript];
            _numActions = _numActions + 1;
		};

    _pos set [3,_height];  

    _group ctrlShow true;
    ctrlSetFocus _group;
    _group ctrlSetPosition _pos;
    _group ctrlCommit 0;
};