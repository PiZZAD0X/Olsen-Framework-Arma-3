#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_unit"];

//Determine if this AI should even execute new code
private _UseAI = _Unit getVariable ["PZAI_NOAI",false];
private _BunkerAI = _Unit getVariable ["PZAI_BUNKER",false];

private _Passarray = [_UseAI,(isPlayer _Unit),_BunkerAI];
diag_log format ["%1 unitcheck array: %2",_unit,_Passarray];
_Passarray
