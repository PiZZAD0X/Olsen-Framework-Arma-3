#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_veh",["_pos",[],[[]]]];
private _vehInit = (GETVAR(_veh,AI_unitInit,""));
if (typename _vehInit isEqualTo "STRING") then {_vehInit = compile _vehInit;};
if (_pos isEqualTo []) then {_pos = (getposATL _veh)};
[typeOf _veh,
_pos,
vectorDir _veh,
vectorUp _veh,
damage _veh,
fuel _veh,
magazinesAllTurrets _veh,
locked _veh,
surfaceIsWater (getposATL _veh),
(GETVAR(_veh,AI_unitName,"")),
(GETVAR(_veh,AI_unitPersistent,true)),
_vehInit]
