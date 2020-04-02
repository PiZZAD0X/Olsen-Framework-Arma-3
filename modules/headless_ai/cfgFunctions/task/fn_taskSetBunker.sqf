#include "..\..\script_macros.hpp"


params [
    "_group",
    "_pos",
    ["_radius",30,[0]],
    ["_wait",3,[0]],
    ["_behaviour","SAFE",[""]],
    ["_combat","RED",[""]],
    ["_speed","LIMITED",[""]],
    ["_formation","WEDGE",[""]],
    ["_Type","MOVE",[""]],
    ["_oncomplete",QUOTE(this call FUNC(taskSearchNearby)),[""]],
    ["_compradius",0,[0]],
    ["_wpcount",10,[0]],
    "_i"
];

{
    _x setvariable [QGVAR(BUNKER),true];
} foreach (units _group);
SETVAR(_group,InitialWPSet,true);
_group setVariable [QGVAR(Mission),"BUNKER"];
true
