//((_StartWaypointIs isEqualTo "MOVE") && (!((group _Unit) getVariable ["VCOM_PATROLLING",false])) && (!((group _Unit) getVariable ["VCOM_DEFAULTPATROLLING",false])) && (!(_Unit getVariable ["VCOM_LOITERING",false])) && (!(_Unit getVariable ["VCOM_GARRISONED",false])))


//This script will dictate how the loiter WP works for the AI
params ["_unit", "_Group"];

_Unitleader = leader _unit;

_Group setVariable ["VCOM_DEFAULTPATROLLING",true];

if (isNil "VCOM_PatrolDistance") then {VCOM_PatrolDistance = 250;};
 
[_Unitleader, _Unitleader, VCOM_PatrolDistance] call CBA_fnc_taskPatrol;


