#include "script_macros.hpp"
//This module enables live spawning of arrays including AI on the HC machine locally.
//designed to spawn HC locally in order to improve performance, as well as enabling the
//option of having randomized enemy composition, size, etc, or to allow for live spawning
//of reinforcements or subsequent AOs.

//Array objects
_ArrayObjects = ["ree"];

//Initial spawns are spawned upon init, at the start of the mission.
_InitialSpawn = [];

//Custom viewdistance for the AI
GVAR(HCviewdistance) = 2500;
//Forces Time on the HC to simulate better AI [HOUR,MINUTE]
//Comment out to disable
GVAR(ForceTime) = [12,00];

//Custom AI Skill settings for all spawned AI
GVAR(customskill) = true;
GVAR(aimingspeed) = 1;
GVAR(spotdistance) = 1;
GVAR(aimingaccuracy) = 0.65;
GVAR(aimingshake) = 0.8;
GVAR(spottime) = 1;
GVAR(reloadspeed) = 1;
GVAR(commanding) = 1;
GVAR(endurance) = 1;
GVAR(general) = 1;
GVAR(courage) = 1;

//PZAI settings
GVAR(Enabled) = true;
//The distance a unit needs to be away for PZAI scripts to temporary disable itself upon the unit? The AI unit will also need to be out of combat.
GVAR(DisableDistance) = 3000;
//Aid to the AI spotting distance and time
GVAR(SightAid) = true;
//Distance at which the AI will start seeings enemies in LOS of them
GVAR(SightAid_Distance) = 1200;
//Minimum reveal value per increase +n reveal value per check every 5 seconds of targets in LOS of enemies.
GVAR(SightAid_MinIncrease) = 2;
//Distance at which the AI will force engage the enemies
GVAR(SightAid_EngageDistance) = 400;
//How far can the AI hear gunshots from?
GVAR(HearingDistance) = 2000;
//How revealed an enemy is from a gunshot report
GVAR(HearingMinIncrease) = 1;
//Distance a bunker enemy can see/engage the enemy
GVAR(Bunker_Distance) = 900;
//Whether Bunker AI get released and act normally/free to move if enemies get too close
GVAR(Bunker_Release) = true;
//Sensitivity/Sightlevel needed for Bunker AI to engage - lower is more sensitive.
GVAR(Bunker_Sightlevel) = 0.25;
//Distance at which AI are released from bunker
GVAR(Bunker_Release_Dist) = 25;
//Distance AI will respond to call of help from each other
GVAR(Radio_Distance) = 1200;
//Whether or not AI need ACRE radios to broadcast info to other groups
GVAR(Radio_NeedRadio) = false;
//Distance the AI will patrol to by default when set to "GUARD" waypoint
GVAR(PatrolDistance) = 200;
//Whether the AI will patrol between garrison positions. Pretty buggy, but nice for 'mersion
GVAR(GarrisonPatrol) = false;
//Turn this on to see certain debug messages.
GVAR(Debug) = true;
//Turn on map markers that track AI movement
GVAR(UseMarkers) = true;
//Default group reinforcement behaviour
GVAR(Reinforce) = true;
//Default distance for radio reinforcment calls
GVAR(Reinforce_Distance) = 2500;
//Default distance for radio reinforcment calls for QRF
GVAR(QRF_Distance) = 2500;
//Will AI garrison static weapons nearby?
GVAR(STATICGARRISON) = 1;
//Should we let AI use flanking manuevers? false means they can flank
GVAR(REINFORCE) = false;
//Should AI use smoke grenades? Besides default A3 behavior?
GVAR(USESMOKE) = false;
//Chance of AI using grenades
GVAR(GRENADECHANCE) = 45;
//AI will automatically disembark from vehicles when in combat.
GVAR(AIDisembark) = true;
//How low should an AI's mag count be for them to consider finding more ammo? This DOES NOT include the mag loaded in the gun already.
GVAR(AIMagLimit) = 2;
//Should the rain impact accuracy of AI? DEFAULT = true;
GVAR(RainImpact) = true;
//How much should rain impact the accuracy of AI? Default = 3. Default formula is -> _WeatherCheck = (rain)/3; "rain" is on a scale from 0 to 1. 1 Being very intense rain.
GVAR(RainPercent) = 3;
//Should AI and players have an additional layer of suppression that decreases aiming when suppressed? Default = true;
GVAR(Suppression) = false;
//How much should suppression impact both AI and player aiming? Default is 5. Normal ArmA is 1.
GVAR(SuppressionVar) = 5;
//Should AI/players be impacted by adrenaline? This provides players and AI with a small speed boost to animations to assist with cover seeking and positioning for a short time. Default = true;
GVAR(Adrenaline) = false;
//How much of a speed boost should players/AI recieve? Default = 1.35; (1 is ArmA's normal speed).
GVAR(AdrenalineVar) = 1.35;
//How many AI UNITS can be calculating cover positions at once?
GVAR(CurrentlyMovingLimit) = 24;
//How many AI UNITS can be suppressing others at once?
GVAR(CurrentlySuppressingLimit) = 40;
//How many AI can be checking roles/equipment/additional commands at once? This will impact FPS of AI in and out of battle. The goal is to limit how many benign commands are being run at once and bogging down a server with over a couple HUNDRED AI.
GVAR(BasicCheckLimit) = 40;
//How many squad leaders can be executing advanced code at once.
GVAR(LeaderExecuteLimit) = 20;
//How low should the FPS be, before Vcom pauses simulation. This will not disable simulation on AI - they will run default Bohemia AI.
GVAR(FPSFreeze) = 10;
//Should the AI notice IR lasers?
GVAR(IRLaser) = true;
//The longer an AI's target stays in 1 location, the more accurate and aware of the target the AI becomes.DEFAULT = [WEST,EAST,CIVILIAN,RESISTANCE];
GVAR(IncreasingAccuracy) = true;
//GVAR(SideBasedMovement)- Remove sides from the array below to force that specific AI side to not execute any advance movement code. (I.E. Moving to reinforce allies, being alerted by distant gunshots and etc). AI with this will still react normally in combat. DEFAULT = [WEST,EAST,CIVILIAN,RESISTANCE];
GVAR(SideBasedMovement) = [EAST,INDEPENDENT,CIVILIAN,BLUFOR];
//GVAR(SideBasedExecution)- Remove sides from the array below to remove that specific AI side from executing any of the VCOMAI scripts at all. DEFAULT = [WEST,EAST,CIVILIAN,RESISTANCE];
GVAR(SideBasedExecution) = [EAST,INDEPENDENT,CIVILIAN,BLUFOR];
//Whether the AI will set up campfires at night if they are set to "DISMISS" waypoint
GVAR(Campfires) = false;
//Distance the AI will attempt to flank around the enemy. I.E. How far off a waypoint, or around the enemy squad, the AI are willing to go in combat.
GVAR(WaypointDistance) = 300;
