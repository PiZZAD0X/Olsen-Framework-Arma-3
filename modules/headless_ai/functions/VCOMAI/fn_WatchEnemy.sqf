//unit 1, unit 2
params ["_unit","_target"];

_return = true;

_oldgroup = _unit getvariable "oldgroup";
_unit dowatch objNull;
[_unit] joinsilent grpNull;
[_unit] joinsilent _oldgroup;
_unit dowatch _target;

_return