#include "..\..\script_macros.hpp"

params [["_unit", objNull, [objNull]], ["_groupStance", "AUTO", [""]], ["_unitStance", "AUTO", [""]]];

if (_groupStance == _unitStance) then {
    _unit setUnitPos _groupStance;
} else {
    if (_unitStance == 'AUTO') then {
        _unit setUnitPos _unitStance;
    } else {
        _unit setUnitPos _groupStance;
    };
};

true
