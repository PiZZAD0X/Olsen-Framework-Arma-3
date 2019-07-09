#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(ALL);

LOG("HC Global Pre Init");

#include "..\..\settings.sqf"

[] call FUNC(checkifHC);

//exit clients
AI_EXEC_CHECK(SERVERHC);

GVAR(zoneEntities) = [];

[QGVAR(PlayerShotEvent), {
    params ["_firer","_weapon","_ammo"];
    allUnits select {
        (!isplayer _x)
        && {(local _x)}
        && {(_x distance _firer <= GVAR(HEARINGDISTANCE))}
    } apply {
        private _distance = _x distance _firer;
        private _travelTime = _distance / 343;
        private _revealValue = linearConversion [200,GVAR(HEARINGDISTANCE),_distance,4,GVAR(HEARINGMININCREASE)];
        [{
            params ["_firer","_AIunit","_revealValue"];
            _AIunit reveal [_firer,_revealValue];
            if (GVAR(UseMarkers)) then {
                LOG_5("%1 got revealed to %2\n %3m, %4 seconds, %5 reveal value.",_firer,_x,_distance,_travelTime,_revealValue);
            };
        }, [_firer,_x,_revealValue], _travelTime] call CBA_fnc_waitAndExecute;
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(SpawnArrayEvent), {
    params ["_arrayName"];
    private _initial = if (CBA_MissionTime <= 0) then {true} else {false};
    LOG_2("SpawnArray _Array: %1 _initial: %2",_arrayName,_initial);
    private _logic = (call compile (_arrayName));
    private _entities = (([_arrayName,GVAR(zoneEntities)] call FUNC(getDetails)) select 1);
    LOG_2("SpawnArray _Array: %1 _entities: %2",_arrayName,_entities);

    if !(_entities isEqualTo []) then {
        LOG_2("Spawning %1 on %2",_logic,clientowner);
        [_initial,[_logic,_entities]] call FUNC(createZone);
    } else {
        LOG_2("Did not find array %1 on %2",_logic,clientowner);
    };
}] call CBA_fnc_addEventHandler;
