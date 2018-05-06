params ["_unit"];

_MyNearestEnemySight = _Unit call VCOMAI_fnc_ClosestEnemy;
_distance = _unit distance2d _MyNearestEnemySight;
if (_distance > VCOM_NightAid_Distance) exitwith {};
_knowsabouttarget = _unit knowsabout _MyNearestEnemySight;
if (_knowsabouttarget < 4) then {
	_cansee = [objNull, "VIEW"] checkVisibility [eyePos _Unit, eyePos _MyNearestEnemySight];
	//diag_log format ["%1 cansee %2 by %3",_unit,_MyNearestEnemySight,_cansee];
	if ((_cansee > 0.6) && (_distance < VCOM_NightAid_EngageDistance)) exitwith {
		_unit reveal [_MyNearestEnemySight,4];
		if (vehicle _unit == _unit) then {
			_unit dotarget _MyNearestEnemySight;
			_unit fireAtTarget [_MyNearestEnemySight];
		};
		if (VCOM_UseMarkers) then {
			diag_log format ["revealing: %1 to %2, engage!",_MyNearestEnemySight,_unit];
		};
	};
	if (_cansee > 0) then {
		_revealValue = linearConversion [100,VCOM_NightAid_Distance,_distance,4,VCOM_NightAid_MinIncrease];
		_unit reveal [_MyNearestEnemySight,_knowsabouttarget + _revealValue];
		if (VCOM_UseMarkers) then {
			diag_log format ["revealing: %1 to %2, old knows: %3 new: %4",_MyNearestEnemySight,_unit,_knowsabouttarget,(_unit knowsabout _MyNearestEnemySight)];
		};
	};
};