private ["_info"];

player createDiarySubject ["FW_Menu", "RR Framework"];

_info = "
<font size='18'>Welcome to the RapidRabbit Framework!</font><br/>
The RapidRabbit Framework is a simple framework designed for ArmA 3, based on the Olsen Framework. It supports modules and is easy to configure.<br/>
<br/>
Find out more about the framework on GitHub.<br/>
github.com/EM-Creations/RapidRabbit-Framework-ArmA-3<br/>
<br/>
Current Version: 4.0.0
";

player createDiaryRecord ["FW_Menu", ["Framework Info", _info]];
