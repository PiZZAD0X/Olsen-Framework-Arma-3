/*
 * Author: Olsen
 *
 * Counts units on set side in area of set diameter around object.
 *
 * Arguments:
 * 0: side <side>
 * 1: radious <number>
 * 2: center of area <object>
 *
 * Return Value:
 * amount of units in area <number>
 *
 * Public: Yes
 */

params [
	["_side", sideUnknown, [sideUnknown]],
	["_radius", 0, [0]],
	["_logic", objNull, [objNull]],
	["_noUntracked", false]
];

private _count = {
    (side _x isEqualTo _side) &&
    {(!(_x getVariable ["FW_DontTrack", false]) || !_noUntracked)} &&
    {((_x distance2d _logic) < _radius)} &&
    {(_x call FNC_Alive)}
} count allUnits;

_count
