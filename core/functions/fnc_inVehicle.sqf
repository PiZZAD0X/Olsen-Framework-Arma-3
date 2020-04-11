/*
 * Author: Olsen
 *
 * Checks if unit is in a vehicle.
 *
 * Arguments:
 * 0: unit <object>
 *
 * Return Value:
 * is inside vehicle <bool>
 *
 * Public: Yes
 */

params ["_unit"];

((vehicle _unit) != _unit)
