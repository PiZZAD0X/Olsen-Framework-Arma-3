#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_grp","_gpos",["_grpSet",[],[[]]]];
_grpSet params [
    /*0*/    "_side",
    /*1*/    "_pos",
    /*2*/    "_behave",
    /*3*/    "_combat",
    /*4*/    "_speed",
    /*5*/    "_formation",
    /*6*/    "_grpStance",
    /*7*/    "_grpInit",
    /*8*/    "_createRadius",
    /*9*/    "_taskRadius",
    /*10*/    "_wait",
    /*11*/    "_startBld",
    /*12*/    "_task",
    /*13*/    "_taskTimer",
    /*14*/    "_multi",
    /*15*/    "_occupyOption",
    /*16*/    "_vehAssigned",
    /*17*/    "_waypoints",
    /*18*/    "_onWater",
    /*19*/    "_fl",
    /*20*/    "_surrender"
    ];
_grp setVariable [QGVAR(group_Pos),_gpos];
_grp setVariable [QGVAR(group_behaviour),_behave];
_grp setVariable [QGVAR(group_combatMode),_combat];
_grp setVariable [QGVAR(group_speed),_speed];
_grp setVariable [QGVAR(group_formation),_formation];
_grp setVariable [QGVAR(group_taskRadius),_taskRadius];
_grp setVariable [QGVAR(group_taskWait),_wait];
_grp setVariable [QGVAR(group_task),_task];
_grp setVariable [QGVAR(group_TaskTimer),_taskTimer];
_grp setVariable [QGVAR(group_occupyOption),_occupyOption];
_grp setVariable [QGVAR(group_Waypoints),_waypoints];
_grp setVariable [QGVAR(group_forceLights),_fl];
_grp setVariable [QGVAR(group_surrender),_surrender];
//_grp call CBA_fnc_clearWaypoints;
[_grp,_behave,_combat,_speed,_formation] call FUNC(setGroupBehaviour);
{
    _x setUnitPos _grpStance;
    if (!isNull(assignedVehicle _x)) then {[_x] orderGetIn true;};
} forEach (units _grp);
if (_fl) then {[_grp] call FUNC(setFlashlights);};
if (_surrender) then {[_grp] call FUNC(setSurrender);};
_grp spawn _grpinit;
true
