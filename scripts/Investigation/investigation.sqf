_pathtoscrts = "Scripts\investigation\";
_EXECscrt = 'player execVM "'+_pathtoscrts+'%1"';
Investigation =
[
        ["",true],
        ["Investigar:", [-1], "", -5, [["expression", ""]], "1", "0"],
        ["", [-1], "", -5, [["expression", ""]], "1", "0"],
        ["Prender", [2],  "", -5, [["expression", format[_EXECscrt,"Detain.sqf"]]], "1", "1"],
        ["Procurar", [3],  "", -5, [["expression", format[_EXECscrt,"Search.sqf"]]], "1", "1"],
        ["Escoltar", [4],  "", -5, [["expression", format[_EXECscrt,"Escort.sqf"]]], "1", "1"],
        ["Parar escolta", [4],  "", -5, [["expression", format[_EXECscrt,"stop_escort.sqf"]]], "1", "1"],
        ["Soltar", [6],  "", -5, [["expression", format[_EXECscrt,"Release.sqf"]]], "1", "1"],
        ["", [-1], "", -5, [["expression", ""]], "1", "0"],
        ["Sair", [-1], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:Investigation";