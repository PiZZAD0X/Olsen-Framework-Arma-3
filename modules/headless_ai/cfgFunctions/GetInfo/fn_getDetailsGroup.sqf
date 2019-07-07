#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_unit",["_pos",[],[[]]]];
private _group = (group _unit);
private _groupInit = _group getVariable [QGVAR(group_Init),""];
private _occupy = GETVAR(_group,group_occupyOption,0);
if (_occupy isEqualTo 1) then {_occupy = floor(random [2,5,7])};
if (typename _groupInit isEqualTo "STRING") then {_groupInit = compile _groupInit;};
private _vehAssigned = if ((assignedVehicleRole _unit) isEqualTo []) then {false} else {true};
[side _unit,
getposATL _unit,
behaviour _unit,
combatMode _group,
speedMode _group,
formation _group,
GETVAR(_group,group_Stance,"auto"),
_groupInit,
GETVAR(_group,group_createRadius,0),
GETVAR(_group,group_taskRadius,30),
GETVAR(_group,group_taskWait,3),
GETVAR(_group,group_startBuilding,false),
GETVAR(_group,group_task,"PATROL"),
GETVAR(_group,group_TaskTimer,0),
GETVAR(_group,group_multiplier,0),
_occupy,
_vehAssigned,
([(waypoints _unit)] call FUNC(getWaypointDetails)),
(surfaceIsWater (getposATL _unit)),
GETVAR(_group,group_forceLights,false),
GETVAR(_group,group_surrender,false),
GETVAR(_group,group_Tracker,false),
GETVAR(_group,storedVars,[])]
