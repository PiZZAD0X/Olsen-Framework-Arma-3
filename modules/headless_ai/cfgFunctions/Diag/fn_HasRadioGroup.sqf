#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_group"];

_return = false;

{
	if ([_x] call acre_api_fnc_hasRadio) exitwith {_return = true;};
} foreach units _group;

_return
