/*
 * Author: Sacher
 *
 * Spawns a Vehicle, if side is defined it will try to track it
 *
 * Arguments:
 * 0: className <String>
 * 1: Position <Pos>
 * 2: side <side>
 * Return Value:
 * unit Spawned <object>
 *
 * Public: Yes
 */

params ["_className", "_position", ["_side", sideEmpty, [sideEmpty]]];

private _unit = _className createVehicle _position;
if(!isNil "aCount_addEH") then { ["aCount_event_addEH", _unit] call CBA_fnc_serverEvent};
if ((_unit getVariable ["FW_AssetName", ""] isEqualTo "") && {!(_side isEqualTo sideEmpty)}) then
{
  {
	if (_x select 1 == (_this select 2)) exitWith {
	  private _vehCfg = (configFile >> "CfgVehicles" >> (typeOf _unit));
	  if (isText(_vehCfg >> "displayName")) then
	  {
		[_unit, getText (_vehCfg >> "displayName"), _x select 0] call FNC_TrackAsset;
	  };
	};
  } forEach FW_Teams;
};
_unit
