#include "..\..\script_macros.hpp"


params [
    "_occupy",
    "_group",
    "_gpos",
    "_startBld",
    "_i",
    "_unitArgs",
    "_taskRadius",
    ["_currentVeh",objNull,[objNull]]
];
_unitArgs params [
    "_uv",
    "_unitClass",
    "_unitPos",
    "_unitVectorDir",
    "_unitVectorUp",
    "_damage",
    "_editorGear",
    "_vehicle",
    "_vr",
    "_vehicleAssigned",
    "_handcuffed",
    "_unitOnWater",
    "_unitIsPersistent",
    "_unitStance",
    "_unitInit",
    "_name",
    "_identity", 
    "_storedVars"
];

if (_occupy) then {
    LOG_1("%1 set to occupy",_unitClass);
    _unitPos = _gpos;
} else {
    if (_startBld && {!_vehicleAssigned}) then {
        _unitPos = [_gpos,_taskRadius,_i] call FUNC(getStartBuilding);
    };
};
private _unit = _group createUnit [_unitClass,_unitPos,[],0,"CAN_COLLIDE"];
[_unit] join _group;
_unit disableAI "Path";
_unit forcespeed 0;
_unit setPosATL _unitPos;
//LOG_2("_unit: %1 _unitPos: %2",_unit,_unitPos);
_unit setUnitLoadout _editorGear;
private _VecDirUp = [_unitVectorDir,_unitVectorUp];
_unit setVectorDirAndUp _VecDirUp;
SETVAR(_unit,VecDirUp,_VecDirUp);
_unit setDamage _damage;
if (_handcuffed) then {
    [_unit,_handcuffed] call ACE_captives_fnc_setHandcuffed;
};
if !(_name isEqualTo "") then {
    missionNamespace setVariable [_name, _unit];
};
_unit setVariable [QGVAR(Identity),_identity,true];
[_unit,_unitIsPersistent] call FUNC(setPersistent);
_unit call _unitInit;

if (_vehicleAssigned && {!isNull _currentVeh}) then {
    [_unit,_vr,_currentVeh] call FUNC(setAssignedVehicle);
};

if !(_storedVars isEqualTo []) then {
    {
        _x params ["_varName", "_varValue"];
        _unit setvariable [_varName,_varValue];
    } forEach _storedVars;
};

private _groupStance = GETVAR(_group,Stance,"AUTO");

[{!isNull (_this select 0)},{
	params ["_unit", "_groupStance", "_unitStance"];
    [QGVAR(StanceChangeEvent), [_unit, _groupStance, _unitStance], _unit] call CBA_fnc_targetEvent;
}, [_unit, _groupStance, _unitStance]] call CBA_fnc_waitUntilAndExecute;

_unit