#include "..\script_macros.hpp"

class EGVAR(AI,InitPost) {
    init = QUOTE(\
        if (isPlayer (_this select 0)) then {\
            _this call FUNC(playerInit);\
        } else {\
            _this call FUNC(onInit);\
        };\
    );
};
