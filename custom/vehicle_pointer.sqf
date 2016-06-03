private ["_vehDistance","_showMarkerSearchText","_inventoryItems","_rNum""_name","_mark","_showMarkerType","_showMarkerColor","_showMarkerShape","_showMarkerSize","_showMarkerSearchText","_showFlareType","_showFlareOthers","_flare","_light","_showTime","_showMarkerTime","_showSign","_signHeight","_showOthers","_scanRadius","_scanRadius2","_showVehMapMarker","_vehTarget","_arrow","_vehsAround","_keyOwner","_x","_keyName","_ownerID","_vehFoundInRange","_classname","_vehDisplayName","_positionArrow","_location","_inventoryItems"];

_showTime = 5;
_showSign = "Sign_arrow_down_large_EP1";
_signHeight = 2;
_scanRadius = 100;
_scanRadius2 = 25000;
_showFlare = true;
_showFlareHeight = 50;
_showFlareType = "F_40mm_White";
_showMarkerTime = 20;
_showMarkerColor = "ColorRedAlpha"; 
_showMarkerType = "Artillery";
_showMarkerShape = "ICON";
_showMarkerSize = [3,3];
_showMarkerSearchText = "Search:";
_showMarkerOthers = false;

_keyOwner = _this select 0;
_keyName = _this select 1;

_vehFoundInRange = false;
_vehTarget = objNull;

_vehsAround = nearestObjects [getPos player, ["Plane","LandVehicle","Helicopter","Ship"], _scanRadius];
{
    _ownerID = _x getVariable ["CharacterID", "0"];
    if ( _keyOwner == _ownerID ) exitWith {
        _vehFoundInRange = true; 
        _vehTarget = _x;
    };
} forEach _vehsAround;  
    
if (_vehFoundInRange) then {
    _classname = typeOf _vehTarget;
    _vehDisplayName = gettext (configFile >> "CfgVehicles" >> (typeof _vehTarget) >> "displayName");
    systemChat format ["VP: %1 belongs to %2 found in range. Trying to mark it...",_keyName, _vehDisplayName];	
    _location = position _vehTarget;
    _positionArrow = _vehTarget modelToWorld [0,0,2];
    _arrow = _showSign createVehicleLocal _location;
    _light = "#lightpoint" createVehicleLocal [0,0,0];
    _arrow setVehiclePosition [_positionArrow, [], 0];
    _arrow attachTo [_vehTarget,[0,0,_signHeight],""];
            
    if ( _showFlare ) then {
        _flare = _showFlareType createVehicleLocal [getPos _vehTarget select 0, getPos _vehTarget select 1, _showFlareHeight];
    };
    _light setLightBrightness 0.01;
    _light setLightAmbient[1.0, 1.0, 1.0];
    _light setLightColor[1.0, 1.0, 1.0];
    _light lightAttachObject [_vehTarget, [0,0,1]];

    sleep _showTime;

    deleteVehicle _arrow;
    deletevehicle _light;
    
} else {

    cutText [format["Chave nao pertence a nenhum veiculo por perto."], "PLAIN DOWN"];
        
    _inventoryItems = [player] call BIS_fnc_invString;
    if !("ItemMap" in _inventoryItems) || !("ItemGPS" in _inventoryItems) exitWith { systemChat "Voce nao tem um mapa para ver a localizacao!";};
    
    systemChat format ["Procurando por veiculo...", _keyName];
    _vehsAround = nearestObjects [getPos player, ["Plane","LandVehicle","Helicopter","Ship"], _scanRadius2];
    {
        _ownerID = _x getVariable ["CharacterID", "0"];
        if ( _keyOwner == _ownerID ) exitWith {
            _vehFoundInRange = true; 
            _vehTarget = _x;
        };
    } forEach _vehsAround;
    
    if (_vehFoundInRange) then {
        _classname = typeOf _vehTarget;
        _vehDisplayName = gettext (configFile >> "CfgVehicles" >> (typeof _vehTarget) >> "displayName");
        _vehDistance = floor (player distance _vehTarget);
        systemChat format ["%1 pertence a um %2. Mostrando no mapa...",_keyName, _vehDisplayName];
        
        _location = position _vehTarget;
        _vehDisplayName = gettext (configFile >> "CfgVehicles" >> (typeof _vehTarget) >> "displayName");
        _rNum = floor random 10;
        _name = format ["Search: %1" + " [%2]", _vehDisplayName, _rNum];
        _mark = createMarkerLocal [_name, _location];
        _name setMarkerShapeLocal _showMarkerShape;
        _name setMarkerTypeLocal _showMarkerType;
        _name setMarkerColorLocal _showMarkerColor;
        _name setMarkerSizeLocal _showMarkerSize;
        _name setMarkerAlphaLocal 1;
        _name setMarkerTextLocal format [_showMarkerSearchText + " " + "%1" + " " + "[%2 m]", _vehDisplayName, _vehDistance];
        sleep _showMarkerTime;
        deleteMarker _name;
    } else {
        systemChat format ["%1 nao pertence a nenhum veiculo ou o veiculo foi destruido.", _keyName];
    };
};