["Remove Maps", "1.1", "Removes maps and compasses from specific gear cases.", "TinfoilHate, PiZZADOX"] call FNC_RegisterModule;

#include "settings.sqf"

[{
    params [["_keepMapClasses", [], [[]]], ["_keepCompassClasses", [], [[]]]];
    _keepMapClasses append _keepCompassClasses;

    allUnits select {
        local _x
    } apply {
        private _unit = _x;
        private _gear = _unit getVariable ["FW_Loadout", ""];
        if (_gear in _keepMapClasses) then {
            if (_gear in _keepCompassClasses) then {
                _unit unlinkItem "ItemMap";
            };
        } else {
            _unit unlinkItem "ItemMap";
            _unit unlinkItem "ItemCompass";
        };
    };
}, [_keepMapClasses, _keepCompassClasses]] call CBA_fnc_execNextFrame;
