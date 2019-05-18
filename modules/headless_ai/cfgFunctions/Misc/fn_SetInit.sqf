#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

private _object = (_this deleteAt 0);
private _type = if (_object isEqualType grpNull) then {
    "Group"
} else {
    "Unit"
};

{
    private _argItem = _x;
    if (_argItem isEqualType "") then {
        private _splitString = _argItem splitString ":";
        if ((count _splitString) isEqualTo 2) then {
            _splitString params ["_varName","_varValue"];
            private _varNameF = format ["%1_%2",_type,_varName];
            SETVAR(_object,_varNameF,_varValue);
            LOG_3("Set %1 variable %2 with value: %3",_object,_varNameF,_varValue);
        };
    };
} foreach _this;
