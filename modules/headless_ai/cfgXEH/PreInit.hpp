#include "..\script_macros.hpp"

class EGVAR(AI,PreInit) {
    Init = "call compile preProcessFileLineNumbers 'modules\headless_ai\cfgXEH\init\GlobalPreInit.sqf';";
    serverInit = "call compile preProcessFileLineNumbers 'modules\headless_ai\cfgXEH\init\ServerPreInit.sqf';";
    clientInit = "call compile preProcessFileLineNumbers 'modules\headless_ai\cfgXEH\init\ClientPreInit.sqf';";
};
