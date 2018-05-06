params ["_group"];

_hasLR = leader _group getVariable "tin_aiLink_hasLR";
_hasSR = leader _group getVariable "tin_aiLink_hasSR";
_count = leader _group getVariable "tin_aiLink_count";
_eval = false;

if (isNil "_count") then {
	_count = count units _group;
	leader _group setVariable ["tin_aiLink_count",_count];
	_eval = true;
} else {
	if (_count != count units _group) then {
		leader _group setVariable ["tin_aiLink_count",_count];
		_eval = true;
	};
};

if (isNil "_hasLR" || isNil "_hasSR" || _eval) then {
	{
		{
			if (_x isKindOf ["ACRE_SEM70", configFile >> "CfgWeapons"]) then {_hasLR = true};
			if (_x isKindOf ["ACRE_PRC117F", configFile >> "CfgWeapons"]) then {_hasLR = true};
			if (_x isKindOf ["ACRE_PRC152", configFile >> "CfgWeapons"]) then {_hasLR = true};
			if (_x isKindOf ["ACRE_PRC148", configFile >> "CfgWeapons"]) then {_hasLR = true};
			if (_x isKindOf ["ACRE_PRC77", configFile >> "CfgWeapons"]) then {_hasLR = true};
			if (_x isKindOf ["ACRE_SEM52SL", configFile >> "CfgWeapons"]) then {_hasSR = true};
			if (_x isKindOf ["ACRE_PRC343", configFile >> "CfgWeapons"]) then {_hasSR = true};
		} forEach items _x;

		if (isNil "_hasLR") then {
			leader _group setVariable ["tin_aiLink_hasLR",false];
			_hasLR = false;
		} else {
			leader _group setVariable ["tin_aiLink_hasLR",_hasLR];
		};
		if (isNil "_hasSR") then {
			leader _group setVariable ["tin_aiLink_hasSR",false];
			_hasSR = false;
		} else {
			leader _group setVariable ["tin_aiLink_hasSR",_hasSR];
		};
	} forEach units _group;
};

_array = [_hasLR,_hasSR];

_array