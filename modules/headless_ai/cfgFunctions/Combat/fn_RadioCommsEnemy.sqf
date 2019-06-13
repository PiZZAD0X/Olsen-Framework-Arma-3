#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_groupcaller","_enemycaller","_sidecaller"];

if (GVAR(Debug)) then {
	diag_log format ["radiocomms fnc _this: %1",_this];
};

{
	_x params ["_side","_group","_leader","_groupcount","_behaviourtasking","_behaviour","_target","_position","_hasRadio"];
	if (GVAR(Debug)) then {
		diag_log format ["radiocomms fnc _group: %1",_group];
	};
	if (!(_groupcaller isEqualto _group)) then {
		private _isFriendly = [_sidecaller, _side] call BIS_fnc_sideIsFriendly;
		if (GVAR(Debug)) then {
			diag_log format ["radiocomms fnc _group: %1 _isFriendly: %2",_group,_isFriendly];
		};
		if (_isFriendly) then {
			if (!(_enemycaller isEqualto _target) && {((_enemycaller distance _target) > 100)}) then {
				if ((_hasRadio) || !(PZAI_Radio_NeedRadio)) then {
					private _distanceToUnit = _enemycaller distance2d _leader;
					if (_distanceToUnit <= PZAI_Radio_Distance) then {
						private _needReinforcement = [_groupcaller,_enemycaller,CBA_MissionTime,_group] call PZAI_fnc_ReinforcementResponse;
						[_Group,_enemycaller,_needReinforcement] call PZAI_fnc_CombatResponse;
						if (GVAR(Debug)) then {
							diag_log format ["_group: %1 called combatresponse",_group];
						};
					};
				};
			};
		};
	};
} foreach PZAI_GroupArray;
