#include "..\..\script_macros.hpp"


params ["_unit", ["_pos",[],[[]]], "_vehicle"];
private _unitInit = GETVAR(_unit,Init,"");
if (typename _unitInit isEqualTo "STRING") then {_unitInit = compile _unitInit;};
private _vehAssigned = if ((assignedVehicleRole _unit) isEqualTo []) then {false} else {true};
private _stance = GETVAR(_unit,stance,"AUTO");
private _identity = [
    name _unit,
    face _unit,
    speaker _unit,
    nameSound _unit,
    pitch _unit
];
LOG_2("unit:%1 identity:%2",_unit,_identity);

[true,
typeOf _unit,
getposATL _unit,
vectorDir _unit,
vectorUp _unit,
damage _unit,
getUnitLoadout _unit,
typeOf _vehicle,
assignedVehicleRole _unit,
_vehAssigned,
_unit getVariable ["ACE_captives_isHandcuffed",false],
surfaceIsWater (getposATL _unit),
GETVAR(_unit,Persistent,true),
_stance,
_unitInit,
GETVAR(_unit,Name,""),
_identity,
GETVAR(_unit,storedVars,[])]
