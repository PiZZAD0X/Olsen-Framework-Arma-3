#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

GVAR(ActiveList) = [];

GVAR(ActiveHandlePFH) = [{
    if (isNil QGVAR(ActiveList)) exitwith {GVAR(ActiveList) = [];};
    {
        if (isNull _x) then {
            GVAR(ActiveList) deleteAt _foreachIndex;
        };
    } foreach GVAR(ActiveList);
}, 1] call CBA_fnc_addPerFrameHandler;
