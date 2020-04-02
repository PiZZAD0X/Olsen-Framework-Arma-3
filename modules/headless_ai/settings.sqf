#include "script_macros.hpp"
//This module enables live spawning of arrays including AI on the HC machine locally.
//designed to spawn HC locally in order to improve performance, as well as enabling the
//option of having randomized enemy composition, size, etc, or to allow for live spawning
//of reinforcements or subsequent AOs.

//Array objects
GVAR(ArrayObjects) = ["hcTest","hcTest_1"];

//Initial spawns are spawned upon init, at the start of the mission.
GVAR(InitialSpawn) = [];

//Custom viewdistance for the AI
GVAR(AIViewDistance) = 2500;
//Forces Time on the HC to simulate better AI at night [HOUR,MINUTE]
GVAR(ForceTimeEnable) = true;
GVAR(ForceTime) = [12,00];

//Turn this on to see certain debug messages.
GVAR(Debug) = true;
GVAR(FSMDebug) = false;
//Turn on map markers that track AI movement
GVAR(UseMarkers) = true;
GVAR(GroupDebug) = false;
GVAR(CommanderDebug) = false;

//Custom AI Skill settings for all spawned AI
GVAR(CustomSkillEnabled) = false;
GVAR(CustomSkill_aimingspeed) = 1;
GVAR(CustomSkill_spotdistance) = 1;
GVAR(CustomSkill_aimingaccuracy) = 0.65;
GVAR(CustomSkill_aimingshake) = 0.8;
GVAR(CustomSkill_spottime) = 1;
GVAR(CustomSkill_reloadspeed) = 1;
GVAR(CustomSkill_commanding) = 1;
GVAR(CustomSkill_endurance) = 1;
GVAR(CustomSkill_general) = 1;
GVAR(CustomSkill_courage) = 1;

//AI commander options -WIP
GVAR(CommanderEnabled) = false;
GVAR(CommanderSide) = "EAST";
//"Random" "Aggressive" "Defensive" "Guerilla" "Probing"
GVAR(CommanderPersonality) = "Random";
GVAR(CommanderDelay) = 3;
GVAR(CommanderSkill) = 5;
//Objectives/Areas to consider, order in array determines priority of areas. Required elements: marker name, commander mission.
//Optional array elements: terrain manual define, QRF support for contact encountered in the area, minimum assets to assign for the area, asset threshold for the area (if threshold to assign cannot be met area will not be considered), maximum assets to assign for the area (leftover groups will be assigned to areas that aligns with preferred asset types), preferred asset types.
//Preferred asset types will be determined from terrain setting if not manually defined.
//["_marker","_mission","_min","_max","_threshold","_QRFSupport","_assetSupport","_withdrawalEnabled","_resourceUse","_preferredTypes","_terrainMode"];
GVAR(CommanderAreas) = [
    ["area1", "Defend", 2, 2, 0, true, true, false, true, ["Infantry", "Snipers"]],
    ["area0", "Patrol", 0, 2, 2, false, false, true,  false, ["Infantry"]],
    ["area2", "Patrol", 0, 4, 2, false, false, true,  false, ["Motorized", "Mechanized", "Armor"]],
    ["area3", "Recon", 0, 2, 1, false]
];
GVAR(CommanderQRF) = ["QRF_MotorRifles"];
//"Spotted", "Threatened", "Combat", "Prolonged Combat"
GVAR(CommanderQRFThreshold) = "Combat";
GVAR(CommanderRoam) = false;
GVAR(CommanderWithdrawal) = false;
GVAR(CommanderResourcesArty) = [];
GVAR(CommanderResourcesAirStrikes) = [];
GVAR(CommanderResourcesParadrops) = [];
//Commander fills zones to maximum asset values then starts assigning to next zone, or commander assigns evenly to zones in order of precedent until max values filled
//"FILL" or "EVEN"
GVAR(CommanderFillAssignMode) = "FILL";
//Commander will assign groups that start in a zone to that zone - overlapping zones work in precedence + max asset assignments.
GVAR(CommanderAssignStartZone) = true;

//AI system options
GVAR(Enabled) = true;
//The distance a unit needs to be away for PZAI scripts to temporary disable itself upon the unit? The AI unit will also need to be out of combat.
GVAR(DisableDistance) = 3000;
GVAR(EnemyUpdateFrequency) = 5;
//Aid to the AI spotting distance and time
GVAR(SightAid) = true;
//Aid to the AI spotting distance and time when in a vehicle
GVAR(SightAidVehicles) = false;
//Distance at which the AI will start seeings enemies in LOS of them
GVAR(SightAidDistance) = 600;
//Minimum reveal value per increase +n reveal value per check every 5 seconds of targets in LOS of enemies.
GVAR(SightAidMinIncrease) = 1;
//Distance at which the AI will force engage the enemies
GVAR(SightAidEngageDistance) = 300;
//How far can the AI hear gunshots from?
GVAR(HearingDistance) = 2000;
//How revealed an enemy is from a gunshot report
GVAR(HearingMinIncrease) = 1;
//Distance a bunker enemy can see/engage the enemy
GVAR(BunkerDistance) = 2500;
GVAR(AimDistAdjust) = 0.00024;
GVAR(AimConeAdjust) = 0.975;
//Whether Bunker AI get released and act normally/free to move if enemies get too close
GVAR(BunkerRelease) = true;
//Sensitivity/Sightlevel needed for Bunker AI to engage - lower is more sensitive.
GVAR(BunkerSightlevel) = 0.15;
//Distance at which AI are released from bunker
GVAR(BunkerReleaseDist) = 25;
//Distance AI will respond to call of help from each other
GVAR(RadioDistance) = 1200;
//Whether or not AI need ACRE radios to broadcast info to other groups
GVAR(RadioNeedRadio) = false;
//Distance the AI will patrol to by default
GVAR(PatrolDistance) = 200;
//Whether the AI will patrol between garrison positions. Pretty buggy, but nice for 'mersion
GVAR(GarrisonPatrol) = false;
//Default group reinforcement behaviour
GVAR(Reinforce) = true;
//Default distance for radio reinforcment calls
GVAR(ReinforceDistance) = 2500;
//Default distance for radio reinforcment calls for QRF
GVAR(QRF_Distance) = 2500;
//Will AI garrison static weapons nearby?
GVAR(MountStatics) = true;
//Distance AI will mount empty statics from - maximum of 100m
GVAR(MountStaticsDistance) = 50;
//Should we let AI use flanking manuevers? false means they can flank
GVAR(REINFORCE) = false;
//Should AI use smoke grenades? Besides default A3 behavior?
GVAR(USESMOKE) = false;
//Percentage chance of AI using grenades
GVAR(GRENADECHANCE) = 45;
//AI will automatically disembark from vehicles when in combat.
GVAR(AIDisembark) = true;
//How low should an AI's mag count be for them to consider finding more ammo? This DOES NOT include the mag loaded in the gun already.
GVAR(AIMagLimit) = 2;
//Should the rain impact accuracy of AI? DEFAULT = true;
GVAR(RainImpact) = true;
//How much should rain impact the accuracy of AI? Default = 3. Default formula is -> _WeatherCheck = (rain)/3; "rain" is on a scale from 0 to 1. 1 Being very intense rain.
GVAR(RainPercent) = 3;
//Should AI have an additional layer of suppression that decreases aiming when suppressed?
GVAR(Suppression) = false;
//How much should suppression impact AI aiming? Default is 5. Normal ArmA is 1.
GVAR(SuppressionVar) = 5;
//Should AI be impacted by adrenaline? This provides AI with a small speed boost to animations to assist with cover seeking and positioning for a short time.
GVAR(Adrenaline) = false;
//How much of a speed boost should AI recieve? Default = 1.35; (1 is ArmA's normal speed).
GVAR(AdrenalineVar) = 1.35;
//Should the AI notice IR lasers?
GVAR(IRLaser) = true;
//The longer an AI's target stays in 1 location, the more accurate and aware of the target the AI becomes.
GVAR(IncreasingAccuracy) = true;
//GVAR(SideBasedMovement)- Remove sides from the array below to exclude that AI side to not execute any advance movement code. (I.E. Moving to reinforce allies, being alerted by distant gunshots and etc). AI with this will still react normally in combat.
GVAR(SideBasedMovement) = [EAST,INDEPENDENT,CIVILIAN,BLUFOR];
//GVAR(SideBasedExecution)- Remove sides from the array below to exclude that AI side from executing any of the AI scripts. DEFAULT = [WEST,EAST,CIVILIAN,RESISTANCE];
GVAR(SideBasedExecution) = [EAST,INDEPENDENT,CIVILIAN,BLUFOR];
//Whether the AI will set up campfires at night if they are set to the Loiter task
GVAR(Campfires) = false;
//Distance the AI will attempt to flank around the enemy. I.E. How far off a waypoint, or around the enemy squad, the AI are willing to go in combat.
GVAR(WaypointDistance) = 300;

//Performance options
//How many AI UNITS can be calculating cover positions at once?
GVAR(CurrentlyMovingLimit) = 24;
//How many AI UNITS can be suppressing others at once?
GVAR(CurrentlySuppressingLimit) = 40;
//How many AI can be checking roles/equipment/additional commands at once? This will impact FPS of AI in and out of battle. The goal is to limit how many benign commands are being run at once and bogging down a server with over a couple HUNDRED AI.
GVAR(BasicCheckLimit) = 40;
//How many squad leaders can be executing advanced code at once.
GVAR(LeaderExecuteLimit) = 20;
//How low should the FPS be before simulation is paused on AI. AI routines are still run but simulation is disabled. Acts similar to automatic simulation from ACE.
GVAR(FPSFreeze) = 10;

