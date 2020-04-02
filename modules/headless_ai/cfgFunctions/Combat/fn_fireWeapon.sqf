#include "..\..\script_macros.hpp"


//unit 1, unit 2
params [["_unit",objnull,[objnull]],["_suppressMode",false,[false]]];

private _isVehicle = !(vehicle _unit isEqualTo _unit);

if (_isVehicle) then {
    (vehicle _unit) fireAtTarget [objnull];
} else {
    private _weaponType = ((currentWeapon _unit) call BIS_fnc_itemType) select 1;
    private _fireMode = currentWeaponMode _unit;
    if (_weaponType isEqualTo "MachineGun") then {
        private _weaponModes = (getArray (configFile >> "CfgWeapons" >> (currentWeapon _unit) >> "modes"));
        _fireMode = switch (true) do {
            case ("FullAuto" in _weaponModes): {
                "FullAuto"
            };
            case ("close" in _weaponModes): {
                "close"
            };
            case ("medium" in _weaponModes): {
                "medium"
            };
            default {
                currentWeaponMode _unit
            };
        };
    };
    _unit forceWeaponFire [currentWeapon (vehicle _unit), _fireMode];
};
