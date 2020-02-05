["Headless Spawn", "1.0", "Spawn units on a connected headless client.", "StatusRed &amp; PiZZADOX"] call FNC_RegisterModule;

#include "settings.sqf"

private _hcPresent = if (isNil "HC_1") then {false} else {true};

doSpawn = {
  private _group = nil;

  {
    _group = _x call FNC_SpawnUnits;
  } forEach _groups;
};

if (_hcPresent && isMultiplayer) then { // If HC is connected
  if (!isServer && !hasInterface) then { // If this unit is the HC
    call doSpawn;
  } else {
    // Do nothing.
  };
} else {
  if (isServer) then { // If HC isn't connected and this is the server
    call doSpawn;
  } else {
    // Do nothing.
  };
};
