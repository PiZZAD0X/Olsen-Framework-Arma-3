while {true} do {
	sleep 0.25;
	//systemchat format ["PZAI_UnitQueue: %1",PZAI_UnitQueue];
	if !(PZAI_UnitQueue isEqualTo []) then
	{
		private _ConsideringUnit = PZAI_UnitQueue select 0;
		private _Disabled = _ConsideringUnit getVariable ["PZAI_NOAI",false];
		if ((vehicle _ConsideringUnit) isKindOf "Plane") then {_Disabled = true;_ConsideringUnit setvariable ["PZAI_NOAI",true];};
		if (!(isNull _ConsideringUnit) && !(_Disabled)) then {
			private _leader = leader _ConsideringUnit;
			if ((side _leader in PZAI_SideBasedExecution) || (((INDEPENDENT in PZAI_SideBasedExecution) || (RESISTANCE in PZAI_SideBasedExecution)) && (str(side _leader) isEqualto "GUER"))) then {
				diag_log format ["adding %1 to FSM",_ConsideringUnit];
				[_ConsideringUnit] execFSM "modules\headless_ai\functions\PZAI\FSM\AIBEHAVIORTEST.fsm";
			} else {
				diag_log format ["invalid unit %1 not added to FSM",_ConsideringUnit];
				_ConsideringUnit forcespeed -1;
			};
				PZAI_ActiveList pushback _ConsideringUnit;
				PZAI_UnitQueue deleteAt 0;
		} else {
				PZAI_UnitQueue deleteAt 0;
				_ConsideringUnit forcespeed -1;
		};
		
		{
			if (isNull _x) then {PZAI_ActiveList = PZAI_ActiveList - [_x];};
		} foreach PZAI_ActiveList;		
	};
};