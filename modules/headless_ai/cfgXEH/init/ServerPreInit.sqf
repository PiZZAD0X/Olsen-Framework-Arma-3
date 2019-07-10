#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVER);

LOG("HC Server Pre Init");

//[QGVAR(ServerEvent), {
//
//}] call CBA_fnc_addEventHandler;

//[QEGVAR(Core,SettingsLoaded), {
//
//}] call CBA_fnc_addEventHandler;

//Gathers HC Arrays
if !(GVAR(ArrayObjects) isEqualTo []) then {
	private _ArrayObjects = GVAR(ArrayObjects);
	LOG_1("ArrayObjects %1",_ArrayObjects);
	[{
		params ["_ArrayObjects"];
		{
			LOG_1("Getting Array data for %1",_x);
			private _entities = [(call compile (_x))] call FUNC(getSyncedObjects);
			LOG_1("_entities %1",count _entities);
	        GVAR(zoneEntities) pushBack [_x,_entities];
		} foreach _ArrayObjects;
		if (isMultiplayer) then {
			[{GVAR(HC_ID) isEqualType 0}, {
				GVAR(HC_ID) publicVariableClient QGVAR(zoneEntities);
			}] call CBA_fnc_waitUntilAndExecute
		};
	}, [_ArrayObjects]] call CBA_fnc_execNextFrame;
};
