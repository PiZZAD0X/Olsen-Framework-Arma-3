#include "..\..\script_macros.hpp"


params ["_veh",["_pos",[],[[]]]];
private _vehInit = (GETVAR(_veh,Init,""));
if (typename _vehInit isEqualTo "STRING") then {_vehInit = compile _vehInit;};
if (_pos isEqualTo []) then {_pos = getPosATL _veh;};
[false,
typeOf _veh,
_veh call BIS_fnc_getVehicleCustomization,
getposATL _veh,
vectorDir _veh,
vectorUp _veh,
damage _veh,
fuel _veh,
magazinesAllTurrets _veh,
locked _veh,
surfaceIsWater (getposATL _veh),
(GETVAR(_veh,Name,"")),
(GETVAR(_veh,Persistent,true)),
_vehInit,
(GETVAR(_veh,Flying,false)),
(GETVAR(_veh,FlyInHeight,250)),
(GETVAR(_veh,StoredVars,[]))]