#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

private _object = (_this deleteAt 0);
private _type = if (_object isEqualType grpNull) then {
    "Group"
} else {
    "Unit"
};

private _varNameList = [];
private _varNameValues = [];

{
    private _argItem = _x;
    if (_argItem isEqualType "") then {
        private _splitString = _argItem splitString ":";
        if ((count _splitString) isEqualTo 2) then {
            _splitString params ["_varName","_varValue"];
            _varValue = call compile _varValue;
            private _varNameF = format [QUOTE(DOUBLES(COMPONENT,%1_%2)),_type,_varName];
            LOG_1("Variable %1",_varNameF);
            _object setvariable [_varNameF,_varValue];
            _varNameList pushBack _varNameF;
            _varNameValues pushBack _varValue;
            LOG_3("Set %1 variable %2 with value: %3",_object,_varNameF,_varValue);
        };
    };
} foreach _this;

private _storedVars = [_varNameList,_varNameValues];

SETVAR(_object,StoredVars,_storedVars);
