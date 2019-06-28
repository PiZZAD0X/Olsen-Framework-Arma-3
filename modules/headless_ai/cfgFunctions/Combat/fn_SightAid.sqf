#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_unit"];

//exit if sightaid for vehicles disabled
if (!(GVAR(SightAidVehicles)) && {vehicle _unit != _unit}) exitwith {};

private _MyNearestEnemySight = _Unit call GVAR(fnc_ClosestEnemy);
private _distance = _unit distance _MyNearestEnemySight;
if (_distance > GVAR(SightAidDistance)) exitwith {};
private _knowsabouttarget = _unit knowsabout _MyNearestEnemySight;
if (_knowsabouttarget < 4) then {
	private _cansee = [objNull, "VIEW"] checkVisibility [eyePos _Unit, eyePos _MyNearestEnemySight];
	//diag_log format ["%1 cansee %2 by %3",_unit,_MyNearestEnemySight,_cansee];
	if ((_cansee > 0.6) && {(_distance < GVAR(SightAidEngageDistance))}) exitwith {
		_unit reveal [_MyNearestEnemySight,4];
		if (vehicle _unit == _unit) then {
			_unit dotarget _MyNearestEnemySight;
			_unit fireAtTarget [_MyNearestEnemySight];
		};
		if (GVAR(UseMarkers)) then {
			diag_log format ["revealing: %1 to %2, engage!",_MyNearestEnemySight,_unit];
		};
	};
	if (_cansee > 0.05) then {
		private _revealValue = linearConversion [100,GVAR(SightAidDistance),_distance,4,GVAR(SightAidMinIncrease)];
		_unit reveal [_MyNearestEnemySight,_knowsabouttarget + _revealValue];
		if (GVAR(UseMarkers)) then {
			diag_log format ["revealing: %1 to %2, old knows: %3 new: %4",_MyNearestEnemySight,_unit,_knowsabouttarget,(_unit knowsabout _MyNearestEnemySight)];
		};
	};
};
