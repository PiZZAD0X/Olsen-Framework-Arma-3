#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_unit",["_pos",[],[[]]],"_vehicle"];
private _unitInit = (GETVAR(_unit,unit_Init,""));
if (typename _unitInit isEqualTo "STRING") then {_unitInit = compile _unitInit;};
private _vehAssigned = if ((assignedVehicleRole _unit) isEqualTo []) then {false} else {true};
private _stance = switch (stance _unit) do {
    default {"AUTO"};
    case "STAND": {
        "UP";
    };
    case "CROUCH": {
        "MIDDLE";
    };
    case "PRONE": {
        "DOWN";
    };
};
LOG_4("_unit:%1 name:%2 pos: %3 passedpos: %4",_unit,(name _unit),(getpos _unit),_pos);
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
GETVAR(_unit,unit_Persistent,true),
_stance,
_unitInit,
GETVAR(_unit,unit_Name,""),
GETVAR(_unit,unit_Identity,""),
GETVAR(_unit,storedVars,[])]
