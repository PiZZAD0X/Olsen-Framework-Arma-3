#include "..\..\script_macros.hpp"


params ["_args"];
_args params ["","_groupSet","_groupMem",["_currentVeh",objNull,[objNull]]];
_groupSet params ["_side","_groupPos","_behaviour","_combat","_speed","_formation","_groupStance","_groupInit","_createRadius","_taskRadius","_wait","_startBld","_task","_taskTimer", "_multi", "_occupyOption", "_vehAssigned","_waypoints","_onWater","_fl","_surrender", "_tracker", "_storedVars"];
createCenter _side;
private _group = createGroup _side;
{
    if ((_x select 0)) then {
        private _u = [false,_group,_groupPos,_startBld,_foreachIndex,_x,_taskRadius,_currentVeh] call FUNC(createUnit);
    } else {
        private _vpos = (_x select 2);
        private _v = [_vpos,_x,_side] call FUNC(createVehicle);
        _currentVeh = _v;
    };
} foreach _groupMem;

[_group,_groupSet] call FUNC(setGroupVariables);
_group call CBA_fnc_clearWaypoints;

if !(_storedVars isEqualTo []) then {
    {
        _x params ["_varName","_varValue"];
        _group setvariable [_varName,_varValue];
    } forEach _storedVars;
};
//if !(_tasks isEqualTo []) then {
//    [_group,_tasks] call FUNC(taskRegister);
//    _tasks = _tasks call FUNC(taskRemoveZoneActivated);
//};
//if !(_tasks isEqualTo []) then {GVAR(taskedGroups) pushBack [_group];};
if (count _waypoints > 1) then {
    LOG_2("Setting %1 to manual wp mode with: %2",_group,_waypoints);
    [_group,_waypoints] call FUNC(createWaypoints);
} else {
    LOG_2("Setting %1 to task: %2",_group,_task);
    private _passarray = [_task,_group,_groupPos,_taskRadius,_wait,_behaviour,_combat,_speed,_formation,_occupyOption];
    [{!((count waypoints (_this select 1)) isEqualTo 0)},{
        _this call FUNC(taskAssign);
    },_passarray] call CBA_fnc_waitUntilAndExecute;
    //if (!(_tasks isEqualTo []) && {(_group getVariable [QGVAR(TaskTimer),0]) isEqualTo 0}) then {
    //    [_group,_tasks] call FUNC(taskInit);
    //} else {
    //    _group setVariable [QGVAR(CurrentTaskEndTime),(CBA_MissionTime + _taskTimer)];
    //    private _passarray = [_task,_group,_groupPos,_taskRadius,_wait,_behaviour,_combat,_speed,_formation,_occupyOption];
    //    [{!((count waypoints (_this select 1)) isEqualTo 0)},{
    //        _this call FUNC(taskAssign);
    //    },_passarray] call CBA_fnc_waitUntilAndExecute;
    //};
};
_group
