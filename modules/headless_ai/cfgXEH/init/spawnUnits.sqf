/*
 * Author: PiZZADOX & StatusRed
 * Spawns an array of unit types and olsen gear types
 *
 * Arguments:
 * 0: Group Spawn Position <Position>
 * 1: Unit Array in nested format <ARRAY> ([<unit classname>, <olsen gear type>])
 * 2: Side <Side> (default: east)
 *
 * Return Value:
 * Group
 *
 * Example:
 * [[0,0,0], [["LOP_NK_Infantry_TL","NVA_SL"], ["LOP_NK_Infantry_Rifleman","NVA_RF"]], east] call spawnUnits;
 *
 * Public: Yes
 */

params [["_groupPos", [0,0,0], [[]]], ["_units",[],[[]]], ["_side", east, [east]]];

private _group = createGroup _side;

diag_log format ["Spawning %1 units", count _units];

_units apply {
    _x params ["_type", "_gear"];
    diag_log format ["Spawning: %1 with gear: %2", _type, _gear];
    private _unit = _group createUnit [_type, _groupPos, [], 15, "FORM"];
    [_unit, _gear] call FNC_GearScript;
};

_group
