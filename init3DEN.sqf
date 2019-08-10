diag_log "started init3den";

{
	_x addEventHandler ["AttributesChanged3DEN", {
		params ["_object"];
		private _init = (_object get3DENAttribute "init") select 0;
		diag_log format ["_init: %1",_init];
		private _stance = (_object get3DENAttribute "unitpos") select 0;
        diag_log format ["_stance: %1",_stance];
		private _unitstance = ["UP","MIDDLE","DOWN","AUTO"] select _stance;
		diag_log format ["_unitstance: %1",_unitstance];
		private _stanceInit = format ["this setUnitPos '%1'; this setvariable ['unitpos','%1',true];",_unitstance];
		diag_log format ["_stanceInit: %1",_stanceInit];
        if (_init isEqualTo "") then {
            _init = format ["call{%1}",_stanceInit];
        } else {
            if ((_init find _unitstance) isEqualto -1) then {
    			if !((_init find "UP") isEqualto -1) then {
    				_init = [_init,"UP",_unitstance] call CBA_fnc_replace;
    			} else {
    				if !((_init find "MIDDLE") isEqualto -1) then {
    					_init = [_init,"MIDDLE",_unitstance] call CBA_fnc_replace;
    				} else {
    					if !((_init find "DOWN") isEqualto -1) then {
    						_init = [_init,"DOWN",_unitstance] call CBA_fnc_replace;
    					} else {
    						if !((_init find "AUTO") isEqualto -1) then {
    							_init = [_init,"AUTO",_unitstance] call CBA_fnc_replace;
    						} else {
    							_init = _init select [0,((count _init) - 2)];
    							_init = _init + "; " + _stanceInit + "};"
    						};
    					};
    				};
    			};
    		};
        };
		diag_log format ["_init: %1",_init];
		_object set3DENAttribute ["init",_init];
	}];
} foreach (all3DENEntities select 0);
