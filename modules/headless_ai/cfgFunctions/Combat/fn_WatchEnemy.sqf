#include "..\..\script_macros.hpp"


//unit 1, unit 2
params [["_unit",objnull,[objnull]],["_target",objnull,[objnull]],["_laserTarget",objnull,[objnull]],["_suppressMode",false,[false]]];

private _group = group _unit;
private _invisibleTarget = GETVAR(_unit,InvisibleTarget,objnull);
if (_invisibleTarget isEqualTo objnull) then {
    private _targetClass = "CBA_O_InvisibleTarget";
    private _side = side _unit;
    if ([_side, east] call BIS_fnc_sideIsEnemy) then {
        _targetClass = "CBA_O_InvisibleTarget";
    } else {
        if ([_side, west] call BIS_fnc_sideIsEnemy) then {
            _targetClass = "CBA_B_InvisibleTarget";
        } else {
            if ([_side, independent] call BIS_fnc_sideIsEnemy) then {
                _targetClass = "CBA_I_InvisibleTarget";
            };
        };
    };
    _invisibleTarget = _targetClass createVehicleLocal [0,0,0];
    _invisibleTarget allowdamage false;
    private _invisibleTargetHelper = "Sign_Sphere100cm_F" createVehicleLocal [0,0,0];
    if (GETMVAR(UseMarkers,false)) then {
        _invisibleTargetHelper setobjecttexture [0,"#(rgb,8,8,3)color(1,0,0,1)"];
    } else {
        _invisibleTargetHelper setobjecttexture [0,""];
    };
    _invisibleTargetHelper attachTo [_invisibleTarget, [0,0,0]];
    SETVAR(_unit,InvisibleTarget,_invisibleTarget);
};

private _getposTarget = getposASL _target;

_unit doWatch objnull;
_unit doTarget objnull;

if ((_laserTarget isEqualTo objnull) && {!_suppressMode}) then {
    if (GETMVAR(FSMDebug,false)) then {
    	LOG_2("_unit: %1 targeting: %2 in laserTarget mode",_unit,_target);
    };
    _unit reveal [_target,4];
    _unit doWatch _target;
    _unit doTarget _target;
    _unit reveal [_invisibleTarget,0];
    _invisibleTarget setposASL [0,0,0];
    //_unit glanceAt _getposTarget;
    //_unit lookAt _getposTarget;
} else {
    if (GETMVAR(FSMDebug,false)) then {
    	LOG_2("_unit: %1 targeting: %2 in normal mode",_unit,_target);
    };
    private _targetpos = [_getposTarget select 0, _getposTarget select 1,(_getposTarget select 2) + 4];
    _laserTarget setposASL _targetpos;
    _invisibleTarget setposASL _targetpos;
    _unit reveal [_invisibleTarget,4];
    _unit doWatch _targetpos;
    _unit doTarget _invisibleTarget;
    //_unit glanceAt _targetpos;
    //_unit lookAt _targetpos;
};

true
