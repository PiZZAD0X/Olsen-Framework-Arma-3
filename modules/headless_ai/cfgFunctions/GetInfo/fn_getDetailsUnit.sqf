#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_unit",["_pos",[],[[]]],"_vehicle"];
private _unitInit = (GETVAR(_unit,AI_unitInit,""));
if (typename _unitInit isEqualTo "STRING") then {_unitInit = compile _unitInit;};
private _vehAssigned = if ((assignedVehicleRole _unit) isEqualTo []) then {false} else {true};
[true,
typeOf _unit,
_pos,
vectorDir _unit,
vectorUp _unit,
damage _unit,
getUnitLoadout _unit,
typeOf _vehicle,
assignedVehicleRole _unit,
_vehAssigned,
_unit getVariable ["ACE_captives_isHandcuffed",false],
(surfaceIsWater (getposATL _unit)),
(GETVAR(_unit,AI_unitPersistent,true)),
(GETVAR(_unit,AI_stance,"AUTO")),
_unitInit,
(GETVAR(_unit,AI_unitName,"")),
(GETVAR(_unit,AI_unitIdentity,""))]
