#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

private ["_KnownEnemy"];

_KnownEnemy = _this findNearestEnemy _this;
_KnownEnemy
