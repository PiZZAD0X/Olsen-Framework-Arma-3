#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_GroupUnits","_Group"];

{
	[_x] joinSilent _group;
	SETVAR(_x,LOITERING,false);
	if (_x isEqualTo (leader _x)) then {
		SETVAR(_x,FLANKING,false);
	};
	SETVAR(_x,MovedRecently,false);
} foreach _GroupUnits;

SETVAR(_Group,Mission,"DEFEND");
