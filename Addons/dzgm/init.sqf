private ["_loginGroup","_loginVar"];

_loginVar = if (isClass(configFile >> "CfgWeapons" >> "Chainsaw")) then {"PVDZE_plr_LoginRecord"} else {"PVDZ_plr_LoginRecord"};
waitUntil {uiSleep .25;(!isNil _loginVar)};
if (count units group player > 1) then {[player] join grpNull;};

_savedGroup = profileNamespace getVariable["savedGroup",[]];
player setVariable ["savedGroup",_savedGroup,true];
player setVariable ["purgeGroup",0,true];
if (count _savedGroup > 1) then {
	{
		if (((getPlayerUID _x) in _savedGroup) && {(getPlayerUID player) in (_x getVariable["savedGroup",[]])} && {_x != player}) exitWith {
			_loginGroup = group player;
			[player] join (group _x);
			if (count units _loginGroup < 1) then {deleteGroup _loginGroup;};
		};
	} count playableUnits;
};

acceptGroupInvite = compile preprocessFileLineNumbers "addons\dzgm\acceptGroupInvite.sqf";
declineGroupInvite = compile preprocessFileLineNumbers "addons\dzgm\declineGroupInvite.sqf";
disbandGroup = compile preprocessFileLineNumbers "addons\dzgm\disbandGroup.sqf";
dzgmSlowLoop = compile preprocessFileLineNumbers "addons\dzgm\slowLoop.sqf";
inviteToGroup = compile preprocessFileLineNumbers "addons\dzgm\inviteToGroup.sqf";
kickFromGroup = compile preprocessFileLineNumbers "addons\dzgm\kickFromGroup.sqf";
leaveGroup = compile preprocessFileLineNumbers "addons\dzgm\leaveGroup.sqf";
playerSelectChange = compile preprocessFileLineNumbers "addons\dzgm\playerSelectChange.sqf";
tagName = true;
updatePlayerList = compile preprocessFileLineNumbers "addons\dzgm\updatePlayerList.sqf";
	
if (isNil "dzgmInit") then {call compile preprocessFileLineNumbers "addons\dzgm\icons.sqf";};
uiSleep 1;
[] spawn dzgmInit;
[] spawn dzgmSlowLoop;
systemChat "Clique com o botao direito do mouse no Radio para abrir o menu de Grupos";