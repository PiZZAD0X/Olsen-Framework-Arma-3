#include "..\..\script_macros.hpp"


params ["_obj",["_pos",[],[[]]]];
private _objectInit = (GETVAR(_obj,Init,""));
if (typename _objectInit isEqualTo "STRING") then {_objectInit = compile _objectInit;};
if (_pos isEqualTo []) then {_pos = (getposATL _obj)};
[typeOf _obj,
getposATL _obj,
vectorDir _obj,
vectorUp _obj,
damage _obj,
surfaceIsWater (getposATL _obj),
_obj getVariable [QGVAR(Name),""],
_obj getVariable [QGVAR(Persistent),true],
_objectInit,
(GETVAR(_obj,StoredVars,[]))]
