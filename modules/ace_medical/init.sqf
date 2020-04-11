["Medical Settings", "1.1", "Setting medical nonsense without modules.", "TinfoilHate, StatusRed"] call FNC_RegisterModule;

#include "settings.sqf"

_medicalParam = ["MedicalType",1] call BIS_fnc_getParamValue;
if (_medicalParam == 1) then {
	ACE_medical_enableRevive = 1;
} else {
	ACE_medical_enableRevive = 0;
};
