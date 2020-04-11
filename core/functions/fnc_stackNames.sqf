/*
 * Author: Olsen
 *
 * Counts how many elements in set array repeat and outputs it into array of strings in format ["count X value", ...].
 *
 * Arguments:
 * 0: array to process <array>
 *
 * Return Value:
 * array of strings <array>
 *
 * Public: No
 */

params [["_array", [], [[]]]];
private _foundArray = [];
private _newArray = [];

{
    private _string = _x;
	if !(_string in _foundArray) then {
		_foundArray pushBackUnique _string;
		private _count = {
            _x isEqualTo _string
        } count _array;

		private _newItem = format ["%1 X %2", _count, _string];
        _newArray pushBackUnique _newItem;
	};
} forEach _array;

_newArray
