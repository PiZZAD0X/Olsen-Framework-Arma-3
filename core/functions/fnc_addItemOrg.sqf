/*
 * Author: Olsen
 *
 * Add item to unit.
 *
 * Arguments:
 * 0: unit to add item to <object>
 * 1: name of loadout <string>
 * 2: item classname <string>
 * 3: amount <number> (optional)
 * 4: container ("uniform"/"vest"/"backpack") <string> (optional)
 *
 * Return Value:
 * nothing
 *
 * Public: No
 */

params ["_unit", "_loadoutType", "_item", "_success", "_parents", "_type", "_message", ["_amount", 1, [1]], ["_position", "none", [""]]];

if !([_item, _unit] call FNC_checkClassname) exitWith {};

if (count _this > 3) then {
	_amount = _this select 3;
};

if (count _this > 4) then {
	_position = toLower (_this select 4);
};

for "_x" from 1 to _amount step 1 do {
	_success = false;
	_parents = [configFile >> "CFGweapons" >> _item, true] call BIS_fnc_returnParents;
	_type = (_item call BIS_fnc_itemType) select 1;

	if (_position isEqualTo "none") then {
		if (!_success && "Rifle" in _parents) then {
			if (primaryWeapon _unit isEqualTo "") then {
				_unit addWeaponGlobal _item;
				_success = true;
			};
		};
		if (!_success && "Pistol" in _parents) then {
			if (handgunWeapon _unit isEqualTo "") then {
				_unit addWeaponGlobal _item;
				_success = true;
			};
		};
		if (!_success && "Launcher" in _parents) then {
			if (secondaryWeapon _unit isEqualTo "") then {
				_unit addWeaponGlobal _item;
				_success = true;
			};
		};
		if (!_success && _type in ["Map", "GPS", "Compass", "Watch", "NVGoggles"]) then {
			if ([_unit, _type] call FNC_CanLinkItem) then {
				_unit linkItem _item;
				_success = true;
			};
		};
		if (!_success && _type == "uniform") then {
			if (uniform _unit isEqualTo "") then {
				_unit forceAddUniform _item;
				_success = true;
			};
		};
		if (!_success && _type == "vest") then {
			if (vest _unit isEqualTo "") then {
				_unit addVest _item;
				_success = true;
			};
		};
		if (!_success && _type == "backpack") then {
			if (backpack _unit isEqualTo "") then {
				_unit addBackpackGlobal _item;
				_success = true;
			};
		};
		if (!_success && _type == "Headgear") then {
			if (headgear _unit isEqualTo "") then {
				_unit addHeadgear _item;
				_success = true;
			};
		};
		if (!_success && _type == "Glasses") then {
			if (goggles _unit isEqualTo "") then {
				_unit addGoggles _item;
				_success = true;
			};
		};
		if (!_success && _type == "Binocular") then {
			if (binocular _unit isEqualTo "") then {
				_unit addWeaponGlobal _item;
				_success = true;
			};
		};
		if (!_success && _type in ["AccessoryMuzzle", "AccessoryPointer", "AccessorySights", "AccessoryBipod"]) then {
			if ([primaryWeapon _unit, _item] call FNC_CanAttachItem) then {
				if (!(_type in primaryWeaponItems _unit)) then {
					_unit addPrimaryWeaponItem _item;
					_success = true;
				};
			}
			else {
				if ([handgunWeapon _unit, _item] call FNC_CanAttachItem) then {
					if (!(_type in handgunItems _unit)) then {
						_unit addHandgunItem _item;
						_success = true;
					};
				}
				else {
					if ([secondaryWeapon _unit, _item] call FNC_CanAttachItem) then {
						if (!(_type in secondaryWeaponItems _unit)) then {
							_unit addSecondaryWeaponItem _item;
							_success = true;
						};
					};
				}
			}
		};
	} else {
		if !(_success) then {
			switch (_position) do {
				case "backpack": {
					if (_unit canAddItemToBackpack _item || FW_enableOverfill) then {
						if (FW_enableOverfill) then {
							(backpackContainer _unit) addItemCargoGlobal [_item, 1];
						}
						else {
							_unit addItemToBackpack _item;
						};
						_success = true;
					};
				};
				case "vest": {
					if (_unit canAddItemToVest _item || FW_enableOverfill) then {
						if (FW_enableOverfill) then {
							(vestContainer _unit) addItemCargoGlobal [_item, 1];
						}
						else {
							_unit addItemToVest _item;
						};
						_success = true;
					};
				};
				case "uniform": {
					if (_unit canAddItemToUniform _item || FW_enableOverfill) then {
						if (FW_enableOverfill) then {
							(uniformContainer _unit) addItemCargoGlobal [_item, 1];
						}
						else {
							_unit addItemToUniform _item;
						};
						_success = true;
					};
				};
			};
			if (!_success) then {
				(format ["FNC_AddItem: Warning %1 overflown from %2, in %3, case %4", _item, _position, _unit, _loadoutType]) call FNC_DebugMessage;
			};
		};
	};

	if (!_success) then {
		if (_unit canAdd _item && _type != "Backpack") then {
			_unit addItem _item;
			_success = true;
		} else {
			_message = "FNC_AddItem: Warning couldn't fit %1 anywhere, originally intended for %2, in %3, case %4";

			if (_position isEqualTo "none") then {
				_message = "FNC_AddItem: Warning couldn't fit %1 anywhere, in %3, case %4";
			};
			(format [_message, _item, _position, _unit, _loadoutType]) call FNC_DebugMessage;
		};
	};
};
