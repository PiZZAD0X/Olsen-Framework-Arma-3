#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

#include "..\..\settings.sqf"

GVAR(zoneEntities) = [];
GVAR(BasicCheckCurrent) = 0;
GVAR(LeaderExecuteCurrent) = 0;

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
	}, [_ArrayObjects]] call CBA_fnc_execNextFrame;
};

//Lets gets the queue handler going
[{
	[] call FUNC(QueueHandle);
	[] call FUNC(ActiveHandler);
	[] call FUNC(GroupHandler);
}, [], 2] call CBA_fnc_waitAndExecute;

if (GVAR(CommanderEnabled)) then {
	[{
		[] call FUNC(CommanderHandler);
	}, []] call CBA_fnc_execNextFrame;
};

//Spawns initial HC arrays
if !(GVAR(InitialSpawn) isEqualTo []) then {
	private _InitialSpawn = GVAR(InitialSpawn);
	LOG_1("InitialSpawn %1",_InitialSpawn);
	[{
		params ["_InitialSpawn"];
		{
			[_x] call FUNC(spawnArray);
		} foreach _InitialSpawn;
	}, [_InitialSpawn]] call CBA_fnc_execNextFrame;
};

//marker function
if (GVAR(UseMarkers)) then {
	[{
		[] call FUNC(MapMarkers);
	}, [], 2] call CBA_fnc_waitAndExecute;
};

//ForceTime
if (!(hasInterface) && {!(isServer)}) then {
	setViewDistance GVAR(AIViewDistance);
	setTerrainGrid 50;
	if (GVAR(ForceTimeEnable)) then {
		private _forcedDate = [date select 0, date select 1, date select 2, GVAR(ForceTime) select 0, GVAR(ForceTime) select 1];
		GVAR(TimeHandlePFH) = [{
			params ["_argNested", "_idPFH"];
			_argNested params ["_forcedDate"];
			setdate _forcedDate;
		}, 1, [_forcedDate]] call CBA_fnc_addPerFrameHandler;
	};
};
