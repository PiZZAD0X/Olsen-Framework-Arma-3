// Vcom module root file
// Author: StatusRed (EM-Creations.co.uk)

#ifdef framework
	[] execVM "VcomInit.sqf";
#endif

#ifdef preinit
	VCM_CBASettings = call compile preprocessFileLineNumbers "Functions\VCM_CBASettings.sqf";
#endif

#ifdef description_functions
  #include "cfgFunctions.hpp"
#endif
