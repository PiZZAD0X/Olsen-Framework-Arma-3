//Handles Group States, communications between friendly groups, and command structure
#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

LOG("Starting GroupArray Function");

GVAR(GroupArray) = [];
GVAR(GroupHandlerPFH) = [{
    GVAR(GroupArray) = [];
    {
        private _group = _x;
        private _leader = leader _group;
        if (isNull _leader || (isPlayer _leader) || !(alive _leader)) exitwith {};
        if (!((side _leader) in GVAR(SideBasedExecution)) || (vehicle _leader getVariable [QGVAR(NOAI),false])) exitwith {};
        private _side = side _leader;
        private _behaviourtasking = (_Group getVariable [QGVAR(Mission),"NONE"]);
        private _groupcount = (count units _group);
        private _behaviour = behaviour _leader;
        private _target = _group getVariable [QGVAR(CurrentTarget),objnull];
        private _position = getposASL _leader;
        private _hasradio = _group getVariable [QGVAR(HasRadio),false];
        private _groupArray = [_side,_group,_leader,_groupcount,_behaviourtasking,_behaviour,_target,_position,_hasradio];

        GVAR(GroupArray) pushback _groupArray;
    } forEach allGroups;
}, 1] call CBA_fnc_addPerFrameHandler;
