["Environment / Mission Parameters", "1.1", "Allows the admin to choose between different weather parameters.", "Starfox64, Olsen, brndd, StatusRed"] call FNC_RegisterModule;

#include "settings.sqf"

if (isMultiplayer) then {
	private ["_TimeParam", "_WeatherParam", "_WindParam", "_FogParam", "_date", "_overcast", "_wind", "_windDir", "_fog"];

	if (isServer) then {

		_TimeParam = ["TimeOfDay", -1] call BIS_fnc_getParamValue;

		private _t = -1;

		if (_TimeParam in [-2,-3,-4,-5]) then {

			_sunsetSunrise = [] call BIS_fnc_sunriseSunsetTime;
			if (_sunsetSunrise in [[-1,0],[0,-1]]) then {
				_t = -1;
			} else {

				switch (_TimeParam) do {
					case -2: {
						_t = (_sunsetSunrise select 0) - 1.25;
					};
					case -3: {
						_t = (_sunsetSunrise select 0) - 0.75;
					};
					case -4: {
						_t = (_sunsetSunrise select 1);
					};
					case -5: {
						_t = (_sunsetSunrise select 1) + 0.5;
					};
				};
			};
		} else {
			_t = _TimeParam;
		};
		if (-10 == _t) then {
			_t = random 23.9;
		};

		if (-1 != _t) then {
			_t = [floor _t, floor ((_t % 1) * 60)];

			_date = date;
			_date set [3, _t select 0];
			_date set [4, _t select 1];
			[_date] call BIS_fnc_setDate;

		};
	};

	_WeatherParam = ["Weather", -1] call BIS_fnc_getParamValue;

	if (-1 != _WeatherParam) then {

		_overcast = _WeatherParam;
		if (-10 == _overcast) then {
			_overcast = random 10;
		};
		0 setOvercast (_overcast / 10);

	};

	_wind = ["Wind", -1] call BIS_fnc_getParamValue;
  _windDir = ["WindDir", 90] call BIS_fnc_getParamValue;

  if (-1 != _wind) then {
      // Calculate X and Y component of wind direction vector
      // Convert to CCW from X-axis, inverted (so the wind blows *from* that dir)
      _windDir = 90 + (180 - _windDir);
      _dirX = cos _windDir;
      _dirY = sin _windDir;

      0 setWindStr 1;
      setWind [_dirX * _wind, _dirY * _wind, true];
  };

	_FogParam = ["Fog", -1] call BIS_fnc_getParamValue;

	if (-1 != _FogParam) then {

		if (-10 == _FogParam) then {
			_FogParam = (floor random [0, 10, 30]) / 10;
		};

		if (defaultFogType) then {
			_fog = _FogParam;
			0 setFog (_fog / 3.2);
		} else {
			_fog = (fogArrays select _FogParam);
			if (0 == (count _fog)) then {
				_fog = [0, 0, 0];
			};
			0 setFog _fog;
		};

	};
};
