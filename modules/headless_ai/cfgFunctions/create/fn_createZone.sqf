#include "..\..\script_macros.hpp"


params [["_initmode",false,[false]],"_args"];
_args params [["_logic",objNull,[objNull]],["_entities",[],[[]]]];

LOG_3("CreateZone for %1 _args: %2 _initmode: %3",_logic,_args,_initmode);

_entities params [["_groups",[],[[]]],["_emptyVehs",[],[[]]],["_objects",[],[[]]]];
{
    _x call FUNC(createEmptyVehicle);
} forEach _emptyVehs;
{
    _x call FUNC(createObject);
} forEach _objects;
{
    private _groupSet = _x select 1;
    if (((_groupSet select 15) > 0) && {!(_groupSet select 16)}) then {
        [_x] call FUNC(createOccupyGroup);
    } else {
        [_x] call FUNC(createGroup);
    };
} forEach _groups;
true
