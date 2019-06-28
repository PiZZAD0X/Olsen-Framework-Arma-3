#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_occupy","_grp","_gpos","_startBld","_i","_unitArgs","_taskRadius",["_currentVeh",objNull,[objNull]],["_initmode",false,[false]]];
_unitArgs params ["_uv","_unitClass","_unitPos","_unitVectorDir","_unitVectorUp","_damage","_editorGear","_vehicle","_vr","_vehicleAssigned","_handcuffed","_unitOnWater","_unitIsPersistent","_unitStance","_unitInit","_name","_identity", "_storedVars"];

if (_occupy) then {
    _unitPos = _gpos;
} else {
    if (_startBld && {!_vehicleAssigned}) then {
        _unitPos = [_gpos,_taskRadius,_i] call FUNC(getStartBuilding);
    };
};
private _unit = _grp createUnit [_unitClass,_unitPos,[],0,"NONE"];
[_unit] join _grp;
_unit disableAI "Path";
_unit forcespeed 0;
_unit setPosATL _unitPos;
_unit setUnitLoadout _editorGear;
_unit setVectorDirAndUp [_unitVectorDir,_unitVectorUp];
_unit setDamage _damage;
if (_handcuffed) then {[_unit,_handcuffed] call ACE_captives_fnc_setHandcuffed;};
if !(_name isEqualTo "") then {
    missionNamespace setVariable[_name, _unit];
};
_unit setVariable [QGVAR(unitIdentity),_identity,true];
[_unit,_unitIsPersistent] call FUNC(setPersistent);
if !(canSuspend) then {
    _unit call _unitInit;
} else {
    _unit spawn _unitInit;
};
if (isNil QGVAR(ActiveList)) then {
    GVAR(ActiveList) = [_unit];
} else {
    GVAR(ActiveList) append [_unit];
};
_unit setUnitPos _unitStance;
[_unit, "Hit", {
    _this call FUNC(onAIHit);
}] call CBA_fnc_addBISEventHandler;
if (_vehicleAssigned && {!isNull _currentVeh}) then {
    [_unit,_vr,_currentVeh] call FUNC(setAssignedVehicle);
};

if !(_storedVars isEqualTo []) then {
    LOG_1("Setting vars: %1",_storedVars);
    _storedVars params ["_varNameList","_varNameValues"];
    {
        private _varName = _x;
        private _varValue = _varNameValues select _foreachIndex;
        LOG_2("Setting _varName: %1 with: %2",_varName,_varValue);
        _unit setvariable [_varName,_varValue];
    } foreach _varNameList;
};

_unit
