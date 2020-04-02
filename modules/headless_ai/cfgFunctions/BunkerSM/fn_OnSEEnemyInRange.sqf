#include "..\..\script_macros.hpp"

params ["_unit"];

private _enemyInRange = [];
private _enemyArray = _unit call FUNC(EnemyArray);
private _distance = GETVAR(_unit,bunkerDistance,(GVAR(bunkerDistance)));
if !(_enemyArray isEqualTo []) then {
	_enemyInRange = _enemyArray select {((vehicle _unit) distance2d _x) <= _distance};
};

SETVAR(_unit,seeChecks,0);
SETVAR(_unit,enemyInRange,_enemyInRange);
SETVAR(_unit,TargetSet,false);
SETVAR(_this,burstCount,0);