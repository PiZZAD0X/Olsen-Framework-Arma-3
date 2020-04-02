#include "..\..\script_macros.hpp"

params ["_unit"];

private _invisibleTarget = GETVAR(_unit,InvisibleTarget,objnull);

if (_invisibleTarget isEqualTo objnull) exitwith {
    if (GETMVAR(FSMDebug,false)) then {
    	LOG_1("_unit: %1 cannot find invisible target",_unit);
    };
    false
};

private _vehicleUnit = vehicle _unit;
private _isAimed = (
    (((_vehicleUnit weaponDirection (currentWeapon _vehicleUnit)) vectorCos ((getposASL _invisibleTarget) vectorDiff (eyepos _unit))) > (0.999 min ((GETMVAR(AimConeAdjust,0.975)) + ((GETMVAR(AimDistAdjust,0.00024)) * (_vehicleUnit distance _invisibleTarget))))) && 
    {((units _unit) isEqualTo []) || 
    ({
        !([getPosATL _vehicleUnit, getDir _vehicleUnit, 5, getPosATL _x] call BIS_fnc_inAngleSector)
    } foreach (units _unit))}
);

_isAimed
