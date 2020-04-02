#include "..\..\script_macros.hpp"

params ["_group"];

private _leader = leader _group;
private _enemyInRange = [];
private _enemyArray = _leader call FUNC(EnemyArray);
if !(_enemyArray isEqualTo []) then {
	_enemyInRange = _enemyArray select {((vehicle _leader) distance2d _x) <= (GETMVAR(DisableDistance,3000))};
};

SETVAR(_group,CH_enemyInRange,_enemyInRange);