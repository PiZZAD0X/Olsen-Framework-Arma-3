#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_group"];

private _leader = leader _group;
private _buildings = nearestObjects [_leader, ["House", "Building"], 50, true];
if (_buildings isEqualTo []) exitWith {};
private _screenedBuildings = _buildings select {(count ([_x] call BIS_fnc_buildingPositions)) >= 2};
if (_screenedBuildings isEqualTo []) exitWith {};
private _building = selectRandom _screenedBuildings;
_group = _group call CBA_fnc_getGroup;
if !(local _group) exitWith {}; // Don't create waypoints on each machine

private _otask = _group getvariable [QGVAR(Mission),"NONE"];

[_group,_building,_otask] spawn {
    params ["_group","_building","_otask"];
    private _leader = leader _group;

        SETVAR(_Group,InitialWPSet,true);
        _group setVariable [QGVAR(Mission),"BLDSEARCH"];
        [_group] call FUNC(taskForceSpeed);

    // Add a waypoint to regroup after the search
    _group lockWP true;
    private _wp = _group addWaypoint [getPos _leader, 0, currentWaypoint _group];
    private _cond = "({unitReady _x || !(alive _x)} count thisList) isEqualTo count thisList";
    private _comp = format ["this setFormation '%1'; this setBehaviour '%2'; deleteWaypoint [group this, currentWaypoint (group this)];",(formation _group),(behaviour _leader)];
    _wp setWaypointStatements [_cond,_comp];

    // Prepare group to search
    _group setFormDir ([_leader, _building] call BIS_fnc_dirTo);

    // Search while there are still available positions
    private _positions = ([_building] call BIS_fnc_buildingPositions);
        while {!(_positions isEqualTo [])} do {
            private _units = units _group;
            if (_units isEqualTo []) exitWith {};
            if (count (units _group) <= 2) then {
                _units deleteAt (_units find _leader);
            };
            {
                    if (_positions isEqualTo []) exitWith {};
                    if (unitReady _x) then {
                            private _pos = _positions deleteAt 0;
                            _x commandMove _pos;
                            sleep 2;
                    };
            } forEach _units;
        };

    _group lockWP false;
    _group setVariable [QGVAR(Mission),_otask];
};
