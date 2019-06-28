#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_unit",["_pos",[],[[]]]];
private _group = (group _unit);
private _groupInit = _group getVariable [QGVAR(groupInit),""];
private _occupy = GETVAR(_group,occupyOption,0);
if (_occupy isEqualTo 1) then {_occupy = floor(random [2,5,7])};
if (typename _groupInit isEqualTo "STRING") then {_groupInit = compile _groupInit;};
private _vehAssigned = if ((assignedVehicleRole _unit) isEqualTo []) then {false} else {true};
[side _unit,
getpos _unit,
GETVAR(_group,behaviour,"safe"),
GETVAR(_group,combatMode,"red"),
GETVAR(_group,speed,"limited"),
GETVAR(_group,formation,"wedge"),
GETVAR(_group,groupStance,"auto"),
_groupInit,
GETVAR(_group,createRadius,0),
GETVAR(_group,patrolRadius,30),
GETVAR(_group,waypointWait,3),
GETVAR(_group,startBuilding,false),
GETVAR(_group,task,4),
GETVAR(_group,TaskTimer,0),
GETVAR(_group,multiplier,0),
_occupy,
_vehAssigned,
([(waypoints _unit)] call FUNC(getWaypointDetails)),
(surfaceIsWater (getposATL _unit)),
([_group,[QGVAR(TaskModule)]] call FUNC(getTasks)),
GETVAR(_group,forceLights,false),
GETVAR(_group,surrender,false),
GETVAR(_group,Tracker,false)
]
