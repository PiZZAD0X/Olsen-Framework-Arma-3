//unit 1, unit 2
params ["_unit","_target"];
private ["_cansee"];

private _canseeReturn = false;

private _getpos1 = getposASL (vehicle _unit);
private _getposTarget = getposASL (vehicle _unit);
private _unitdirtotarget = (vehicle _unit) getdir (vehicle _unit);
private _aheadUnit = (vehicle _unit) getpos [10,_unitdirtotarget];
private _eyeP1 = [_aheadUnit select 0, _aheadUnit select 1, (_getpos1 select 2) + 1.5];
private _eyeP2 = [_getposTarget select 0, _getposTarget select 1,(_getposTarget select 2) + 1];

if ((vehicle _unit) == _unit) then {
    _cansee = [(vehicle _unit), "VIEW", objNull] checkVisibility [getPosWorld (vehicle _unit), _eyeP2];
} else {
    _cansee = [_unit, "VIEW", objNull] checkVisibility [eyepos _unit, _eyeP2];
};

if (_cansee > 0.10) then {_canseeReturn = true;};

_canseeReturn
