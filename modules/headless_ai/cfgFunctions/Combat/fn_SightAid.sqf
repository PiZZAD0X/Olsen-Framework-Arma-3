#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_unit"];

if (vehicle _unit != _unit) exitwith {};
private _MyNearestEnemySight = _Unit call GVAR(fnc_ClosestEnemy);
private _distance = _unit distance2d _MyNearestEnemySight;
if (_distance > GVAR(SightAid_Distance)) exitwith {};
private _knowsabouttarget = _unit knowsabout _MyNearestEnemySight;
if (_knowsabouttarget < 4) then {
	private _cansee = [objNull, "VIEW"] checkVisibility [eyePos _Unit, eyePos _MyNearestEnemySight];
	//diag_log format ["%1 cansee %2 by %3",_unit,_MyNearestEnemySight,_cansee];
	if ((_cansee > 0.6) && {(_distance < GVAR(SightAid_EngageDistance))}) exitwith {
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
		private _revealValue = linearConversion [100,GVAR(SightAid_Distance),_distance,4,GVAR(SightAid_MinIncrease)];
		_unit reveal [_MyNearestEnemySight,_knowsabouttarget + _revealValue];
		if (GVAR(UseMarkers)) then {
			diag_log format ["revealing: %1 to %2, old knows: %3 new: %4",_MyNearestEnemySight,_unit,_knowsabouttarget,(_unit knowsabout _MyNearestEnemySight)];
		};
	};
};
