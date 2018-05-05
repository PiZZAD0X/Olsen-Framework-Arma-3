waitUntil {!isNil "BIS_fnc_init"};
if (!(FW_var_isHC)) exitWith {};
waitUntil {!isNil "VCOM_Enabled"};
if (!(VCOM_Enabled)) exitWith {};
waitUntil {!(isNil "VCOM_SideBasedExecution")};

MarkerArray = [];
VcomAI_UnitQueue = [];
VcomAI_ActiveList = [];
Vcom_ActivateAI = true;
VCOM_CurrentlyMoving = 0;
VCOM_CurrentlySuppressing = 0;
VCOM_BasicCheckCurrent = 0;
VCOM_LeaderExecuteCurrent = 0;

//Global actions compiles
playMoveEverywhere = compileFinal "(_this select 0) playMoveNow (_this select 1);";
switchMoveEverywhere = compileFinal "(_this select 0) switchMove (_this select 1);";
playActionNowEverywhere = compileFinal "(_this select 0) playActionNow (_this select 1);";
DisableCollisionALL = compileFinal "(_this select 0) disableCollisionWith player";
3DText = compile "[_this select 0,_this select 1,_this select 2,_this select 3] call VCOMAI_fnc_DebugText;";
PSup = compile "[] spawn VCOMAI_fnc_SuppressedEffect;";

//Lets gets the queue handler going
[] spawn VcomAI_fnc_QueueHandle;

while {true} do {
	if (Vcom_ActivateAI) then {
		{
			if (local _x && {simulationEnabled _x}) then {
					if (!(_x in VcomAI_ActiveList) && {!(_x in VcomAI_UnitQueue)}) then {
						VcomAI_UnitQueue pushback _x;
					};
			};
		} forEach allUnits;
	};
	sleep 10;
};