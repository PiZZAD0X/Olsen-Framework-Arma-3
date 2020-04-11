["Start in Vehicle", "1.0", "Moves units into specific vehicle slots upon mission start, includes JiP timeout", "PiZZADOX"] call FNC_RegisterModule;

if (isNil "CBA_LoadedIntoMission") then {
	CBA_LoadedIntoMission = false;
};

["CBA_loadingScreenDone", {
	CBA_LoadedIntoMission = true;
    [] call StartInVehicle_fnc_startInVehicle;
}] call CBA_fnc_addEventHandler;
