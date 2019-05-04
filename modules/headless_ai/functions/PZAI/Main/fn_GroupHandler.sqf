//Handles Group States, communications between friendly groups, and command structure

PZAI_GroupArray = [];

sleep 5;

while {true} do {
	{
		private _group = _x;
		diag_log format ["checking group: %1",_group];
		private _leader = leader _group;
		if ((isNil "_leader") || (isPlayer _leader) || !(alive _leader)) then {
			diag_log format ["invalid group: %1",_group];
		} else {
			if (!(isPlayer _leader) && {!(_leader getvariable ["PZAI_NOAI",false])} && {((side _leader in PZAI_SideBasedExecution) || (((INDEPENDENT in PZAI_SideBasedExecution) || (RESISTANCE in PZAI_SideBasedExecution)) && (str(side _leader) isEqualto "GUER")))}) then {
				diag_log format ["valid group: %1",_group];
				private _side = side _leader;
				private _behaviourtasking = (_Group getVariable ["PZAI_Mission","NONE"]);
				private _groupcount = (count units _group);
				private _behaviour = behaviour _leader;
				private _target = _group getvariable ["PZAI_CurrentTarget",objnull];
				private _position = getposASL _leader;
				private _hasradio = _group getvariable ["PZAI_HasRadio",false];
				private _index = [PZAI_GroupArray, _group, 1] call PZAI_fnc_searchNestedArray;
				
				if (!(_index isEqualto -1)) then {
					//PZAI_GroupArray deleteAt _index;
					PZAI_GroupArray set [_index,[_side,_group,_leader,_groupcount,_behaviourtasking,_behaviour,_target,_position,_hasradio]];
				} else {
					PZAI_GroupArray pushback [_side,_group,_leader,_groupcount,_behaviourtasking,_behaviour,_target,_position,_hasradio];
				};
			} else {
				diag_log format ["invalid group: %1",_group];
			};
		};
	} forEach allGroups;
	sleep (random (2) + 2);
};
