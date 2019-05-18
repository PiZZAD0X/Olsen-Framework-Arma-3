#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

GVAR(UnitQueue) = [];
GVAR(ActiveList) = [];
GVAR(TrackedUnits) = [];
GVAR(zoneEntities) = [];
GVAR(BasicCheckCurrent) = 0;
GVAR(LeaderExecuteCurrent) = 0;

//Lets gets the queue handler going
[] call FUNC(QueueHandle);
[] call FUNC(ActiveHandler);
[] call FUNC(GroupHandler);

//leader/group behavior handling loop
//[] spawn PZAI_fnc_MainLoop;

#include "..\..\settings.sqf"

//Gathers HC Arrays
if (!isNil "_ArrayObjects") then {
	LOG_1("_ArrayObjects %1",_ArrayObjects);
	[{
		params ["_ArrayObjects"];
		{
			LOG_1("Getting Array data for %1",_x);
			private _entities = [(call compile (_x))] call PZAI_fnc_getSyncedObjects;
			LOG_1("_entities %1",count _entities);
	        GVAR(zoneEntities) pushBack [_x,_entities];
		} foreach _ArrayObjects;
	}, [_ArrayObjects]] call CBA_fnc_execNextFrame;
};

//Spawns initial HC arrays
if (!isNil "_InitialSpawn") then {
	LOG_1("_InitialSpawn %1",_InitialSpawn);
	[{
		params ["_InitialSpawn"];
		LOG_1("zoneEntities %1",GVAR(zoneEntities));
		LOG_1("_InitialSpawn next frame %1",_InitialSpawn);
		{
			LOG_1("Attempting to initial spawn %1",_x);
			LOG_1("zoneEntities %1",GVAR(zoneEntities));
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
if !(hasInterface) then {
	setViewDistance GVAR(HCviewdistance);
	setTerrainGrid 50;
	if !(isNil QGVAR(ForceTime)) then {
		private _forcedDate = [date select 0, date select 1, date select 2, GVAR(ForceTime) select 0, GVAR(ForceTime) select 1];
		GVAR(TimeHandlePFH) = [{
			params ["_argNested", "_idPFH"];
			_argNested params ["_forcedDate"];
			setdate _forcedDate;
		}, 1, [_forcedDate]] call CBA_fnc_addPerFrameHandler;
	};
};
