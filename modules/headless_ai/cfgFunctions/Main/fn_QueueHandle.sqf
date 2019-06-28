#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

LOG("Starting UnitQueue Function");

GVAR(UnitQueue) = [];
GVAR(QueueHandlePFH) = [{
    if (GVAR(UnitQueue) isEqualTo []) exitwith {};
    private _ConsideringUnit = GVAR(UnitQueue) select 0;
    private _Disabled = GETVAR(_ConsideringUnit,NOAI,false);
    if ((typeOf _ConsideringUnit) isEqualTo "HeadlessClient_F") then {
        _Disabled = true;
    };
    if ((vehicle _ConsideringUnit) isKindOf "Plane") then {
        _Disabled = true;
        SETVAR(_ConsideringUnit,NOAI,true);
    };
    if (!(isNull _ConsideringUnit) && {!(_Disabled)}) then {
        private _leader = leader _ConsideringUnit;
        if ((side _leader in GVAR(SideBasedExecution)) || (((INDEPENDENT in GVAR(SideBasedExecution)) || (RESISTANCE in GVAR(SideBasedExecution))) && (str(side _leader) isEqualTo "GUER"))) then {
            diag_log format ["adding %1 to FSM",_ConsideringUnit];
            [_ConsideringUnit] execFSM "modules\headless_ai\cfgFunctions\FSM\AIBEHAVIORTEST.fsm";
        } else {
            diag_log format ["invalid unit %1 not added to FSM",_ConsideringUnit];
            _ConsideringUnit forcespeed -1;
        };
            GVAR(ActiveList) pushback _ConsideringUnit;
            GVAR(UnitQueue) deleteAt 0;
    } else {
            GVAR(UnitQueue) deleteAt 0;
            _ConsideringUnit forcespeed -1;
    };
    GVAR(UnitQueue) deleteAt 0;
}, 1] call CBA_fnc_addPerFrameHandler;
