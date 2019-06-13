#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

//PZAI_fnc_CombatFlank

params ["_Group","_currenttarget","_enemydir"];

[_Group] call CBA_fnc_clearWaypoints;
if ((random 2) > 1) then {_group setformation "LINE";} else {_group setformation "WEDGE";};
_group setformdir _enemydir;
_Group setvariable ["PZAI_Mission","DEFEND"];
