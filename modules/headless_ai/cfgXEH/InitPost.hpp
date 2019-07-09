class Extended_InitPost_EventHandlers {
	class CAManBase {
		class PZAI_InitPost {
			init = "\
				if (isPlayer (_this select 0)) then {\
					_this call PZAI_fnc_playerInit;\
				} else {\
					_this call PZAI_fnc_onInit;\
				};\
			";
		};
	};
};

