#include "..\..\script_macros.hpp"

params ["_unit"];


private _targetSet = GETVAR(_unit,TargetSet,false);

if !(_targetSet) then {
	if (leader _unit isEqualTo _unit) then {
		SETVAR(group _unit,CurrentTarget,_enemyTarget);
	};
	SETVAR(_unit,TargetSet,true);
	SETVAR(_unit,TargetStartTime,CBA_MissionTime);
	
	private _enemyTarget = GETVAR(_unit,enemyTarget,objnull);
	private _laserTarget = GETVAR(_unit,laserTarget,objnull);
	[_unit, _enemyTarget, _laserTarget] call FUNC(WatchEnemy);
	[{
		_this call FUNC(WatchEnemy);
	}, [_unit, _enemyTarget, _laserTarget]] call CBA_fnc_execNextFrame;
};

