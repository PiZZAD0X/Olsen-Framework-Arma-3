#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_arrayName"];

private _initial = if (CBA_MissionTime <= 0) then {true} else {false};
LOG_2("SpawnArray _Array: %1 _initial: %2",_arrayName,_initial);

private _logic = (call compile (_arrayName));
private _entities = (([_arrayName,GVAR(zoneEntities)] call FUNC(getDetails)) select 1);

if !(_entities isEqualTo []) then {
    if (!isMultiplayer) then {
        LOG("!isMultiplayer, createZone function executed");
        [_initial,[_logic,_entities]] call FUNC(createZone);
    } else {
        LOG_1("sending createZone function to clientid %1",GVAR(HC_ID));
        [_initial,[[_logic,_entities]], {if (GVAR(HC_isHC)) then {_this call FUNC(createZone);};}] remoteExec ["bis_fnc_call", GVAR(HC_ID)];
    };
};
