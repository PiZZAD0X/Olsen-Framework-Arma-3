params ["_groupcaller","_enemycaller","_timeCalled","_group"];

private _return = false;
private _lastReinforcmentTime = _group getVariable ["PZAI_Group_ReinforceTime", CBA_MissionTime];
if (_lastReinforcmentTime < CBA_MissionTime + 120) exitwith {false};
private _groupReinforcement = _group getVariable ["PZAI_Group_Reinforce", (PZAI_Reinforce)];
private _groupQRF = _group getVariable ["PZAI_Group_QRF", false];
private _groupReinforcementDistance = if (_groupQRF) then {
    _group getVariable ["PZAI_Group_QRF_Distance", (PZAI_QRF_Distance)];
} else {
    _group getVariable ["PZAI_Group_Reinforce_Distance", (PZAI_Reinforce_Distance)];
};
private _distance = (leader _group) distance2d _enemycaller;

if (!(_groupReinforcement) && {!(_groupQRF)}) exitwith {false};
if (_distance > _groupReinforcementDistance) exitwith {false};

private _currenttarget = _group getvariable ["PZAI_CurrentTarget",objnull];
private _currenttargetDist = (leader _group) distance2d _currenttarget;

if (isNull _currenttarget) exitwith {
    true
};

if ((_currenttargetDist > (_distance * 2)) || ((_lastReinforcmentTime < (CBA_MissionTime + 600)) && {_currenttargetDist > 300})) exitwith {
    true
};


_return
