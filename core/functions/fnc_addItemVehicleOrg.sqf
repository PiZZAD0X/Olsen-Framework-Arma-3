/*
 * Author: Olsen
 *
 * Add item to vehicle.
 *
 * Arguments:
 * 0: vehicle <object>
 * 1: loadout name <string>
 * 2: item <string>
 * 3: amount <number> (optional)
 *
 * Return Value:
 * nothing
 *
 * Public: No
 */

params ["_vehicle", "_loadoutType", "_item", ["_amount", 1, [1]]];

private _type = toLower ((_item call BIS_fnc_itemType) select 1);

if !([_item] call FNC_checkClassname) exitWith {};

for "_x" from 1 to _amount step 1 do {

	if (_vehicle canAdd _item) then {
		if (_type isEqualTo "backpack") then {
			_vehicle addBackpackCargoGlobal [_item, 1];
		} else {
			_vehicle addItemCargoGlobal [_item, 1];
		};
	} else {
		(format ["FNC_AddItemVehicle: Warning couldn't fit %1, in %2, case %3", _item, _vehicle, _loadoutType]) call FNC_DebugMessage;
	};
};
