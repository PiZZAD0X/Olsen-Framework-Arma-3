#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_unit","_target",["_rounds",1,[0]],["_fireMode","close",[""]]];
_unit doWatch _target;
