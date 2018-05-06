//This script will dictate how the loiter WP works for the AI
params ["_unit", "_Group", "_wp"];

_Unitleader = leader _unit;
_wpPos = waypointPosition [_group, _wp];

_Group setVariable ["VCOM_PATROLLING",true];

if (isNil "VCOM_PatrolDistance") then {VCOM_PatrolDistance = 250;};
 
[_Unitleader, _wpPos, VCOM_PatrolDistance] call CBA_fnc_taskPatrol;


