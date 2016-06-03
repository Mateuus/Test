private ["_unit"];

_unit = thesuv turretUnit [0];
if (!(isNull _unit)) exitWith {
	titleText ["\n\nTem alguem na gunner.","PLAIN DOWN"];titleFadeOut 4;
};

thesuv animate ["HideGun_01", 1];
sleep 1;
thesuv animate ["CloseCover1", 1];
thesuv animate ["CloseCover2", 1];