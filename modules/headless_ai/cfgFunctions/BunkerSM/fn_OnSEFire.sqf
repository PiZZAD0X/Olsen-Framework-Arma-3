#include "..\..\script_macros.hpp"

params ["_unit"];

[_unit] call FUNC(fireWeapon);

SETVAR(_unit,LastFiredTime,CBA_MissionTime);
private _burstCount = (GETVAR(_unit,burstCount,0)) + 1;
SETVAR(_unit,burstCount,_burstCount);

private _enemyTarget = GETVAR(_unit,enemyTarget,objnull);
private _targetPos = getposASL _enemyTarget;
private _lastKnownTargetPos = [_targetPos select 0, _targetPos select 1,(_targetPos select 2) + 2];

SETVAR(_unit,lastKnownTargetPos,_lastKnownTargetPos);
