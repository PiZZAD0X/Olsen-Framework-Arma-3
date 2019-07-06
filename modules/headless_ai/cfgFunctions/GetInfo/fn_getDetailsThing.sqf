#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_obj",["_pos",[],[[]]]];
private _objectInit = (GETVAR(_obj,unit_Init,""));
if (typename _objectInit isEqualTo "STRING") then {_objectInit = compile _objectInit;};
if (_pos isEqualTo []) then {_pos = (getposATL _obj)};
[typeOf _obj,
getpos _obj,
vectorDir _obj,
vectorUp _obj,
damage _obj,
surfaceIsWater (getposATL _obj),
_obj getVariable [QGVAR(unit_Name),""],
_obj getVariable [QGVAR(unit_Persistent),true],
_objectInit]
