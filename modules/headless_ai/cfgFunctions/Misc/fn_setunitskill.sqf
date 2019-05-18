#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_unit"];

if (GETVAR(_unit,ManualSkill,false)) exitwith {};

//Set custom skills set in settings.sqf
if (GVAR(customskill)) then {
	_unit setSkill ["aimingspeed", GVAR(aimingspeed)];
	_unit setSkill ["spotdistance", GVAR(spotdistance)];
	_unit setSkill ["aimingaccuracy", GVAR(aimingaccuracy)];
	_unit setSkill ["aimingshake", GVAR(aimingshake)];
	_unit setSkill ["spottime", GVAR(spottime)];
	_unit setSkill ["reloadspeed", GVAR(reloadspeed)];
	_unit setSkill ["endurance", GVAR(endurance)];
	_unit setSkill ["commanding", GVAR(commanding)];
	_unit setSkill ["general", GVAR(general)];
	_unit setSkill ["courage", GVAR(courage)];
};
