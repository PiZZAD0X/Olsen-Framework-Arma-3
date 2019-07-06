#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params [
    "_group",
    "_pos",
    ["_radius",30,[0]],
    ["_wait",3,[0]],
    ["_behave","SAFE",[""]],
    ["_combat","RED",[""]],
    ["_speed","LIMITED",[""]],
    ["_formation","WEDGE",[""]],
    ["_Type","MOVE",[""]],
    ["_oncomplete","",[""]],
    ["_compradius",0,[0]],
    ["_wpcount",10,[0]]
];

_group setBehaviour _behave;
_group setCombatMode _combat;
_group setSpeedMode _speed;
_group setFormation _formation;
private _units = units _group;
{
    _x doWatch ((getPosATL _x) vectorAdd((vectorDir _x) vectorMultiply 100));
    _x disableAI "MOVE";
} foreach _units;
SETVAR(_group,InitialWPSet,true);
SETVAR(_group,Mission,"STATIONARY");
true
