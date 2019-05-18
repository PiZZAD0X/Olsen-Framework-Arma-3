#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(CLIENT);

private _unit = player;
if (!local _unit) exitwith {};
if (GETVAR(_unit,hearingHandler,false)) exitwith {};

_unit addEventHandler ["FiredMan",{
	params ["_firer","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_gunner"];
	//check for lockout
	if (CBA_MissionTime < (GETVAR(_unit,revealLockout,false))) exitWith {
		if (GVAR(UseMarkers)) then {
			diag_log "Locked out!";
		};
	};
	SETVAR(_firer,revealLockout,CBA_MissionTime + 5);
	allUnits select {(_x distance2d _firer <= PZAI_HEARINGDISTANCE) && (!isplayer _x)} apply {
		private _distance = _x distance _firer;
		private _travelTime = _distance / 343;//not using distance2d since that would be odd
		private _revealValue = linearConversion [200,PZAI_HEARINGDISTANCE,_distance,4,PZAI_HEARINGMININCREASE];
		LOG_5("%1 got revealed to %2 at %3m, %4 seconds, %5 reveal value.",_firer,_x,_distance,_travelTime,_revealValue);
		[{
			params ["_firer","_AIunit","_revealValue"];
			_AIunit reveal [_firer,_revealValue];
		}, [_firer,_x,_distance,_revealValue], _travelTime] call CBA_fnc_waitAndExecute;
	};
}];

SETVAR(_unit,hearingHandler,true);
