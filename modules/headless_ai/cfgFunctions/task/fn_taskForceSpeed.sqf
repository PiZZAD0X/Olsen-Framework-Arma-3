#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_group"];

LOG_1("freeing %1",_group);

{
    _x forcespeed -1;
    _x enableAI "Path";
} foreach (units _group);
