#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_veh",["_pos",[],[[]]]];
private _vehInit = (GETVAR(_veh,AI_vehInit,""));
if (typename _vehInit isEqualTo "STRING") then {_vehInit = compile _vehInit;};
if (_pos isEqualTo []) then {_pos = getPosATL _veh;};
[false,
typeOf _veh,
_pos,
vectorDir _veh,
vectorUp _veh,
damage _veh,
fuel _veh,
magazinesAllTurrets _veh,
locked _veh,
surfaceIsWater (getposATL _veh),
(GETVAR(_veh,AI_vehName,"")),
(GETVAR(_veh,AI_vehPersistent,true)),
_vehInit,
(GETVAR(_veh,AI_unitFlying,false)),
(GETVAR(_veh,AI_unitFlyInHeight,250))]
