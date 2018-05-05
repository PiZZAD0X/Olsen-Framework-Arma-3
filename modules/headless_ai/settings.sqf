//This module enables live spawning of arrays including AI on the HC machine locally.
//designed to spawn HC locally in order to improve performance, as well as enabling the 
//option of having randomized enemy composition, size, etc, or to allow for live spawning 
//of reinforcements or subsequent AOs.

//This module needs to be activated with this line in modules.sqf
//#include "headless_ai\root.sqf"

//In the editor, select the AI you want to spawn in a particular instance/array, and open the debug console and run
//["Groups",1] call HC_fnc_ExportSQF;
//which will copy the AI array data to the clipboard, which you can paste in the AIArrays.sqf file and name the array something.
//change the start of the array to NAMEOFARRAY = [
//You can have multiple arrays and spawn arrays not in the _initialspawn array with
//["NAMEOFARRAY"] call HC_fnc_spawnOnHC;
//You can also randomize the array spawned (for different composition of enemies or patrol groups with
//_randomspawn = ["NAMEOFARRAY1","NAMEOFARRAY2","NAMEOFARRAY3"] call bis_fnc_selectrandom;
//[_randomspawn] call HC_fnc_spawnOnHC;

//this setvariable ["VCOM_NOAI",true];
//this setvariable ["VCOM_BUNKER",true];

//Initial spawns are spawned upon init, at the start of the mission.
//_InitialSpawn = ["NAMEOFARRAY1"];

//Custom viewdistance for the AI
HC_viewdistance = 2500;

//Forces Time on the HC to simulate better AI [HOUR,MINUTE]
//Comment out to disable
HC_ForceTime = [12,00];

//Custom AI Skill settings for all spawned AI
HC_customskill = true;
HC_aimingspeed = 1;
HC_spotdistance = 1;
HC_aimingaccuracy = 0.65;
HC_aimingshake = 0.8;
HC_spottime = 1;
HC_reloadspeed = 1;
HC_commanding = 1;
HC_endurance = 1;
HC_general = 1;
HC_courage = 1;

//VCOMAI settings
VCOM_Enabled = true;
//Should the AI lay mines?
VCOM_MineLaying = true;
//Chance of AI to lay a mine.
VCOM_MineLayChance = 40;
//The distance a unit needs to be away for Vcom AI to temporary disable itself upon the unit? The AI unit will also need to be out of combat.
VCOM_DisableDistance = 5000;
//Should the AI consider stealing/using empty ground vehicles?
VCOM_VehicleUse = true;
//The distance, in meters, of how far AI will look for empty unlocked vehicles to steal.
VCOM_AIDistanceVehPath = 150;
//Aid to the AI during night time - spotting distance and time
VCOM_NightAid = true;
//Distance at which the AI will start seeings enemies in LOS of them
VCOM_NightAid_Distance = 800;
//Minimum reveal value per increase +n reveal value per check every 5 seconds of targets in LOS of enemies.
VCOM_NightAid_MinIncrease = 2;
//Distance at which the AI will force engage the enemies
VCOM_NightAid_EngageDistance = 400;
//How far can the AI hear gunshots from?
VCOM_HearingDistance = 1400;
//How revealed an enemy is from a gunshot report
VCOM_HearingMinIncrease = 1;
//Distance a bunker enemy can see/engage the enemy
VCOM_Bunker_Distance = 1200;
//Whether Bunker AI get released and act normally/free to move if enemies get too close
VCOM_Bunker_Release = true;
//Sensitivity/Sightlevel needed for Bunker AI to engage - lower is more sensitive.
VCOM_Bunker_Sightlevel = 0.1;
//Distance at which AI are released from bunker
VCOM_Bunker_Release_Dist = 50;
//Distance AI will respond to call of help from each other
VCOM_Unit_AIWarnDistance = 1000;
//Distance the AI will patrol when set to "GUARD" waypoint
VCOM_PatrolDistance = 250;
//Whether the AI will patrol between garrison positions. Pretty buggy, but nice for 'mersion
VCOM_GarrisonPatrol = true;

//More obscure settings are found in:
#include "functions\VCOMAI\fn_defaultsettings.sqf"





