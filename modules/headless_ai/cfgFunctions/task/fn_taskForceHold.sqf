#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params["_group",["_behave","SAFE",[""]],["_combat","RED",[""]],["_speed","LIMITED",[""]],["_formation","WEDGE",[""]]];
_group setBehaviour _behave;
_group setCombatMode _combat;
_group setSpeedMode _speed;
_group setFormation _formation;
private _units = units _group;
for "_i" from 0 to (count _units) do {
    private _u = _units select _i;
    _u doWatch ((getPosATL _u) vectorAdd((vectorDir _u) vectorMultiply 100));
    _u disableAI "Path";
};
SETVAR(_group,InitialWPSet,true);
_group setVariable [QGVAR(Mission),"FORCE HOLD"];
[_group] call FUNC(taskForceSpeed);
true
