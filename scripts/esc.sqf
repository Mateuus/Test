for "_x" from 5 to 1 step -1 do {
(findDisplay 106) closeDisplay 1;
uiSleep 0.1;
(findDisplay 106) closeDisplay 1;
uiSleep 0.1;
(findDisplay 106) closeDisplay 1;
uiSleep 0.1;
(findDisplay 106) closeDisplay 1;
uiSleep 0.1;
(findDisplay 106) closeDisplay 1;
uiSleep 0.1;
(findDisplay 106) closeDisplay 1;
uiSleep 0.1;
(findDisplay 106) closeDisplay 1;
uiSleep 0.1;
(findDisplay 106) closeDisplay 1;
uiSleep 0.1;
(findDisplay 106) closeDisplay 1;
uiSleep 0.1;
(findDisplay 106) closeDisplay 1;
uiSleep 0.1;
    
    if (isNil "EscBlock") then {
     systemchat "<Anti-dupe>: Inventario Bloqueado por 5 segundos.";
     EscBlock = true;
    };
};
EscBlock = nil;