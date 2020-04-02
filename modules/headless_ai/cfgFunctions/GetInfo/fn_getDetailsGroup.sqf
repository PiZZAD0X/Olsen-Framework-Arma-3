#include "..\..\script_macros.hpp"


params ["_unit",["_pos",[],[[]]]];
private _group = (group _unit);
private _groupInit = _group getVariable [QGVAR(Init),""];
private _occupy = GETVAR(_group,occupyOption,0);
if (_occupy isEqualTo 1) then {_occupy = floor(random [2,5,7])};
if (typename _groupInit isEqualTo "STRING") then {_groupInit = compile _groupInit;};
private _vehAssigned = if ((assignedVehicleRole _unit) isEqualTo []) then {false} else {true};
[side _unit,
getposATL _unit,
behaviour _unit,
combatMode _group,
speedMode _group,
formation _group,
GETVAR(_group,Stance,"AUTO"),
_groupInit,
GETVAR(_group,createRadius,0),
GETVAR(_group,taskRadius,30),
GETVAR(_group,taskWait,3),
GETVAR(_group,startBuilding,false),
GETVAR(_group,task,"PATROL"),
GETVAR(_group,TaskTimer,0),
GETVAR(_group,multiplier,0),
_occupy,
_vehAssigned,
([(waypoints _unit)] call FUNC(getWaypointDetails)),
(surfaceIsWater (getposATL _unit)),
GETVAR(_group,forceLights,false),
GETVAR(_group,surrender,false),
GETVAR(_group,Tracker,false),
GETVAR(_group,storedVars,[])]
