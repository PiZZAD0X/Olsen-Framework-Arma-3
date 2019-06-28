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
    ["_oncomplete",QUOTE(this call FUNC(taskSearchNearby)),[""]],
    ["_compradius",0,[0]],
    ["_wpcount",10,[0]]
];

_group setBehaviour _behave;
_group setCombatMode _combat;
_group setSpeedMode _speed;
_group setFormation _formation;
private _units = units _group;
for "_i" from 0 to (count _units) do {
    private _u = _units select _i;
    _u doWatch ((getPosATL _u) vectorAdd((vectorDir _u) vectorMultiply 100));
    _u disableAI "MOVE";
};
SETVAR(_group,InitialWPSet,true);
SETVAR(_group,Mission,"STATIONARY");
true
