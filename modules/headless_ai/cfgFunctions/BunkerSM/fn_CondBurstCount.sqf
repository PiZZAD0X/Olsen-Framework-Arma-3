#include "..\..\script_macros.hpp"

params ["_unit"];

private _burstCount = GETVAR(_unit,burstCount,0);
private _isVehicle = !(vehicle _unit isEqualTo _unit);
private _maxCount = 5;

if (_isVehicle) then {
    private _weaponType = ((currentWeapon _unit) call BIS_fnc_itemType) select 1;
    _maxCount = switch (_weaponType) do {
        case "MachineGun": {
            (random 10) + 5
        };
        default {
            5
        };
    };
} else {
    private _weaponType = ((currentWeapon _unit) call BIS_fnc_itemType) select 1;
    _maxCount = switch (_weaponType) do {
        case "MachineGun": {
            (random 10) + 5
        };
        default {
            5
        };
    };
};

private _return = (_burstCount > _maxCount);

LOG_2("Burst Check for: %1 burst exit: %2",_unit,_return);

_return

