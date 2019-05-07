//PZAI_fnc_CombatMode

params ["_unit","_PZAI_LastCStance"];

private _NearestEnemy = _Unit call PZAI_fnc_ClosestEnemy;
if (isNil "_NearestEnemy") exitwith {};
if (_NearestEnemy isEqualTo [0,0,0]) exitwith {};

private _TimeShot = _Unit getVariable ["PZAI_FiredTime",0];

if ((CBA_MissionTime - _TimeShot) > 120 && {((_NearestEnemy distance _Unit) > 1000)}) then
{
	_Unit setBehaviour (_PZAI_LastCStance);
};
