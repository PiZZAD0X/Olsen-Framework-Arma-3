#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(CLIENTHC);

LOG("HC Client Pre Init");

["Headless AI", "Spawns AI via logic sync and provides custom AI system", "PIZZADOX"] call FNC_RegisterModule;

//[QGVAR(ClientEvent), {
//
//}] call CBA_fnc_addEventHandler;

AI_EXEC_CHECK(HC);

[] call FUNC(initMain);
