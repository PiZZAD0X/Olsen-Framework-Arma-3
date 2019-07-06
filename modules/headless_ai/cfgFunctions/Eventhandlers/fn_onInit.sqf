#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(HC);

params ["_unit"];
LOG_1("_unit started onInit",_unit);
if !(local _unit) exitwith {};

if (isNil QGVAR(UnitQueue)) then {
    GVAR(UnitQueue) = [_unit];
} else {
    GVAR(UnitQueue) append [_unit];
};
LOG_1("UnitQueue: %1",GVAR(UnitQueue));
