#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

//Currently not being used
{
		[_x,false,false,false,false] spawn PZAI_fnc_MoveToCover;
} foreach (units (group _this));
