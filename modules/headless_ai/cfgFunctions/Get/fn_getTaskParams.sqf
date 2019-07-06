#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_logic",["_params",[],[[]]]];
private _cond = _logic getVariable [QGVAR(taskCondition),"true"];
private _onComp = _logic getVariable [QGVAR(taskOnComplete),"true"];
if (_cond isEqualType "STRING") then {_cond = compile _cond;};
if (typename _onComp isEqualTo "STRING") then {_onComp = compile _onComp;};
_params = [
    _logic,
    _cond,
    (GETVAR(_logic,TaskPriority,1)),
    (_logic getVariable [QGVAR(TaskTime),-1]),
    _onComp,
    (GETVAR(_logic,group_TaskId,0)),
    (GETVAR(_logic,group_taskRadius,100)),
    (GETVAR(_logic,group_taskSet,4)),
    (GETVAR(_logic,group_occupyOptionSet,0)),
    (GETVAR(_logic,group_changetaskWait,3)),
    (_logic getVariable [QGVAR(group_behaviourChange),"unchanged"]),
    (_logic getVariable [QGVAR(group_combatMode),"unchanged"]),
    (_logic getVariable [QGVAR(group_speed),"unchanged"]),
    (_logic getVariable [QGVAR(group_formation),"unchanged"]),
    (_logic getVariable [QGVAR(group_Stance),"unchanged"])
];
_params
