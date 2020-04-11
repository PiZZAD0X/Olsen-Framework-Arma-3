//ace_cookoff_enable = false; // This disables cookoff fire effect
//ace_cookoff_enableAmmoCookoff = false; // This disables secondary explosions

if (isServer) then {
	setViewDistance 2500; // View distance for the server (the ai's)

	FW_TimeLimit = 30; // Time limit in minutes, to disable the time limit set it to 0
	FW_TimeLimitMessage = "TIME LIMIT REACHED!"; //The message displayed when the time runs out

	[blufor, "BLUFOR", "player"] call FNC_AddTeam; // Adds a player team called BLUFOR on side blufor
	[opfor, "OPFOR", "ai"] call FNC_AddTeam; // Adds a ai team called OPFOR on side opfor

	// [resistance, "INDFOR", "player"] call FNC_AddTeam; // Adds a player team called INFOR on side resistance (aka independent)

	// Ticket pools for different sides
	FW_RespawnTicketsWest = 0;
	publicVariable "FW_RespawnTicketsWest";
	FW_RespawnTicketsEast = 0;
	publicVariable "FW_RespawnTicketsEast";
	FW_RespawnTicketsInd = 0;
	publicVariable "FW_RespawnTicketsInd";
	FW_RespawnTicketsCiv = 0;
	publicVariable "FW_RespawnTicketsCiv";

	// Wave respawn
	FW_WaveSizeWest = 0; // How many players have to respawn before wave is released
	FW_WaveSizeEast = 0;
	FW_WaveSizeInd = 0;
	FW_WaveSizeCiv = 0;

	// Players should be put in enclosed space, when their number reaches treshold, the defined "gate" will disappear for 30 seconds
	// It has to be defined for wave respawn to work
	//FW_RespawnPenGateWest = YourEditorObjectName;
	//FW_RespawnPenGateEast = YourEditorObjectName;
	//FW_RespawnPenGateInd = YourEditorObjectName;
	//FW_RespawnPenGateCiv = YourEditorObjectName;
};

if (!isDedicated) then {
	FW_DebugMessagesEnabled = true; // Only disable debug messages when the mission is released

	setViewDistance 2500; // View distance for the player

	// Call FNC_forceTerrainGrid; // Uncomment this to force high terrain setting. This will prevent faraway objects from appearing as floating. Useful for missions with long sightlines.

	switch (side player) do { // Checks what team the player is on
		case blufor: {
			FW_RespawnTickets = 0; // If respawn is enabled you must create empty game logics, for respawn points, following the name format fw_side_respawn. Example: fw_west_respawn
		};

		case opfor: {
			// Do something.
		};

		case independent: {
			// Do something.
		};
		// Add more cases for other factions here..
	};
};
