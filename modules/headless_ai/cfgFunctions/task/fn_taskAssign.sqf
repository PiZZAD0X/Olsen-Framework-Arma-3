#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params [
    ["_task",4,[0]],
    ["_group",grpNull,[grpNull]],
    ["_pos",[],[[]]],
    ["_radius",50,[0]],
    ["_wait",3,[0]],
    ["_behaviour", "UNCHANGED", [""]],
    ["_combat", "NO CHANGE", [""]],
    ["_speed", "UNCHANGED", [""]],
    ["_formation", "NO CHANGE", [""]],
    ["_occupyOption",0,[0]],
    ["_bld",objNull,[objNull]],
    ["_blds",[],[[]]]
];

private _taskSet = [_group,_pos,_radius,_wait,_behaviour,_combat,_speed,_formation];
private _taskSetBasic = [_group,_behaviour,_combat,_speed,_formation];
private _taskSetBld = [_bld,_group,_pos,_radius,_wait,_behaviour,_combat,_speed,_formation];
private _taskSetBlds = [_blds,_group,_pos,_radius,_wait,_behaviour,_combat,_speed,_formation];

switch (_task) do {
    case 0: {
        _taskSet spawn FUNC(taskLoiter);
    };     //Loiter
    case 1: {
        _taskSetBasic spawn FUNC(taskHoldUntil);
    };     //Hold Until
    case 2: {
        _taskSet call FUNC(taskSentry);
    };                //Sentry
    case 3: {
        _taskSetBasic call FUNC(taskPlacement);
    };        //Stationary
    case 4: {
        _taskSet call FUNC(taskPatrol);
    };                //Patrol
    case 5: {
        _taskSet call FUNC(taskPatrolPerimeter);
    };    //Patrol Perimeter
    case 6: {
        switch (_occupyOption) do {
            case 2: {
                _taskSetBld call FUNC(taskMoveNearestBuildingPatrol);
            };
            case 3: {
                _taskSetBld call FUNC(taskMoveRandomBuildingPatrol);
            };
            case 4: {
                _taskSetBlds call FUNC(taskMoveGroupBuildingsPatrol);
            };
            case 5: {
                _taskSetBlds call FUNC(taskMoveRandomGroupBuildingsPatrol);
            };
            case 6: {
                _taskSetBlds call FUNC(taskMoveMultipleBuildingsPatrol);
            };
            case 7: {
                _taskSetBlds call FUNC(taskMoveRandomMultipleBuildingsPatrol);
            };
            default {
                _taskSetBld call FUNC(taskMoveNearestBuildingPatrol);
            };
        };
    };
    case 7: {
        switch (_occupyOption) do {
            case 2: {
                _taskSetBld call FUNC(taskMoveNearestBuildingDefend);
            };
            case 3: {
                _taskSetBld call FUNC(taskMoveRandomBuildingDefend);
            };
            case 4: {
                _taskSetBlds call FUNC(taskMoveGroupBuildingsDefend);
            };
            case 5: {
                _taskSetBlds call FUNC(taskMoveRandomGroupBuildingsDefend);
            };
            case 6: {
                _taskSetBlds call FUNC(taskMoveMultipleBuildingsDefend);
            };
            case 7: {
                _taskSetBlds call FUNC(taskMoveRandomMultipleBuildingsDefend);
            };
            default {
                _taskSetBld call FUNC(taskMoveNearestBuildingDefend);
            };
        };
    };
    case 8: {
        _taskSet call FUNC(TaskSetBunker);
    };    //Entrenched
    case 9: {
        _taskSet call {};
    };    //Reinforcements
    case 10: {
        _taskSet call {};
    };    //NONE
    default {
        _taskSet call FUNC(taskPatrol);
    };
};
true
