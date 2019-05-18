#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_Unit"];

private _Group = (group _unit);

//Add necessary eventhandlers.
_Unit addEventHandler ["Killed",{_this spawn PZAI_fnc_ClosestAllyWarn;}];
_Unit addEventHandler ["FiredMan",{[_this] call PZAI_fnc_SuppressingShots; [_this] call PZAI_fnc_HearingAids;}];
_Unit addEventHandler ["Hit",{_this call PZAI_fnc_AIHit;}];

if (GVAR(Debug)) then {
	diag_log format ["unit %1 completed UnitInit",_unit];
};
