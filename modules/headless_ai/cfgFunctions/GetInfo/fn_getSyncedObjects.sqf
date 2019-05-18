#include "..\..\script_macros.hpp"
AI_EXEC_CHECK(SERVERHC);

params ["_logic",["_entities",[[], [], []],[[]]],["_vehLog",[],[[]]]];
// Get all Synced units/objects to module (excludes other modules)
private _synced = [_logic] call FUNC(getSynced);
LOG_1("_synced %1",_synced);
{
    private _obj =  _x;
    if (!(_obj isKindOf "Logic")) then {
        if (_obj isKindOf "Thing") then {
            (_entities select 2) pushback ([_obj] call FUNC(getDetailsThing));
        };
        if (_obj isKindOf "StaticWeapon" || _obj isKindOf "Static" || _obj isKindOf "Air" || _obj isKindOf "Ship" || _obj isKindOf "LandVehicle") then {
            private _grp = if (_obj isKindOf "StaticWeapon" || _obj isKindOf "Static") then {group (gunner _obj)} else {group (driver _obj)};
            if (isNull _grp) then {
                (_entities select 1) pushback ([_obj] call FUNC(getDetailsVehicleEmpty));
            };
        };
        if (_obj isKindOf "Man") then {
            private _grp = (group _obj);
            private _grpldr = (leader _grp);
            if (_grpldr isEqualTo _obj) then {
                private _grpPos = getposATL _grpldr;
                private _units = units _grp;
                private _group = [str _grp,[],[]];
                private _gx = _grp getVariable [QGVAR(multiplier),0];
                private _grpPosArray = [];
                private _grpPosNew = _grpPos;
                if (_grp getVariable [QGVAR(createRadius),0] > 1) then {
                    _grpPosArray = [_grpPos,0,(_grp getVariable QGVAR(createRadius)),(_gx*5)] call FUNC(getRandomPositionCircle);
                    if (!(_grpPosArray isEqualTo [])) then {
                        private _index = (floor random (count _grpPosArray));
                        _grpPosNew = _grpPosArray select _index;
                        _grpPosArray deleteAt _index;
                    };
                };
                {
                    private _unit = _x;
                    private _unitpos = getPosATL _unit;
                    if (!(_grpPosNew isEqualTo _grpPos)) then {
                        _unitpos = [_grpPosNew,_grpldr,_unit] call FUNC(getNewPos);
                    };
                    private _veh = assignedVehicle _unit;
                    if (!isNull _veh) then {
                        private _vehPos = getposATL _veh;
                        if (!(_grpPosNew isEqualTo _grpPos)) then {_vehPos = _grpPosNew;};
                        if (!(_veh in _vehLog)) then {
                            (_group select 2) pushBack ([_veh,_vehPos] call FUNC(getDetailsVehicle));
                            _vehLog pushBack _veh;
                        };
                    };
                    if (_grpldr isEqualTo _unit) then {
                        {
                            (_group select 1) pushback _x;
                        } forEach ([_unit,_grpPosNew] call FUNC(getDetailsGroup));
                    };
                    (_group select 2) pushback ([_unit,_unitpos,_veh] call FUNC(getDetailsUnit));
                } foreach _units;
                private _occupy = ((_group select 1) select 15);
                private _newOccupy = [(_grp getVariable [QGVAR(multiOccupy),0]),_gx] call FUNC(setMultiOccupy);
                private _currentPos = ((_group select 1) select 1);
                for "_g" from 0 to _gx step 1 do {
                    if (_newOccupy isEqualTo 0 && {_gx isEqualTo 1}) then {
                        (_entities select 0) pushback _group;
                    } else {
                        if (_gx > 1) then {
                            if (!(_grpPosArray isEqualTo [])) then {
                                private _index = (floor random (count _grpPosArray));
                                _currentPos = _grpPosArray select _index;
                                _grpPosArray deleteAt _index;
                            };
                        };
                        if (_g < _newOccupy || _newOccupy isEqualTo 0) then {
                            private _newgroup = +_group;
                            _newgroup set [0,format["%1_%2",(str _grp),_g]];
                            (_newgroup select 1) set [1, _currentPos];
                            (_newgroup select 1) set [15, _occupy];
                            {
                                _x set [2,(_currentPos vectorAdd [-3 + random 3, -3 + random 3, 0])];
                            } foreach (_newgroup select 2);
                            (_entities select 0) pushback _newgroup;
                        } else {
                            private _newgroup = +_group;
                            _newgroup set [0,format["%1_%2",(str _grp),_g]];
                            (_newgroup select 1) set [1, _currentPos];
                            (_newgroup select 1) set [15, 0];
                            {
                                _x set [2,(_currentPos vectorAdd [-3 + random 3, -3 + random 3, 0])];
                            } foreach (_newgroup select 2);
                            (_entities select 0) pushback _newgroup;
                        };
                    };
                };
            };
        };
    };
} foreach _synced;
LOG_1("Deleting Objects for Logic: %1",_logic);
[_synced] call FUNC(deleteVehicles);
LOG_1("Deleting %1 Objects",count _synced);
LOG_1("return _entities %1",_entities);
_entities
