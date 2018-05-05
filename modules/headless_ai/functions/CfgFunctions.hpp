class HC {
	class HCspawn
	{
		file = "modules\headless_ai\functions\HCSpawn";
		class spawnonHC {};
		class spawnFromArray {};
		class liveSpawnFromArray {};
		class setunitskill {};
		class checkifHC {preInit = 1;};
	};
	class Export
	{
		file = "modules\headless_ai\functions\Export";
		class ExportSQF {};
		class ExportInText {};
		class ReplaceText {};
		class SelTypeExport {};
	};
	class Inits
	{
		file = "modules\headless_ai\functions\HCInits";
		class playerInit {postInit = 1;};
		class initHC {};
	};
};

class VCOMAI {
	class Main
	{
		file = "modules\headless_ai\functions\VCOMAI";
		class initMain {};
		class AIHit {};
		class ArmEmptyStatic {};
		class AttachPosition {};
		class BuildingCheck {};
		class BuildingSpawnCheck {};
		class CheckStatic {};
		class Classvehicle {};
		class ClosestAllyWarn {};
		class ClosestEnemy {};
		class ClosestObject {};
		class CombatMode {};
		class DebugText {};
		class DefaultGroupPatrol {};
		class DestroyBuilding {};
		class DetermineLeader {};
		class DetermineRank {};
		class DriverCheck {};
		class EnemyArray {};
		class EraseMarkers {};
		class FindCoverPos {};
		class FlankManeuver {};
		class FocusedAccuracy {};
		class ForceHeal {};
		class FormationChange {};
		class FragmentMove {};
		class FriendlyArray {};
		class Garrison {};
		class GarrisonClear {};
		class GarrisonClearPatrol {};
		class GroupLoiter {};
		class GroupPatrol {};
		class HearingAids {};
		class HasMine {};
		class IRCheck {};
		class LightGarrison {};
		class LoiterAction {};
		class MapMarkers {};
		class MoveInCombat {};
		class MoveToCover {};
		class NightSight {};
		class PlaceMine {};
		class QueueHandle {};
		class RearmGo {};
		class RearmSelf {};
		class ReGroup {};
		class StanceModifier {};
		class SuppressingShots {};
		class SuppressedEffect {};
		class ThrowGrenade {};
		class UnitInit {};
		class VehicleHandle {};
		class Waypointcheck {};
		class WepSupCheck {};	
		class LOSCheck {};		
	};
	class Danger
	{
		file = "modules\headless_ai\functions\VCOMAI\dangercauses";
		class CombatMovement {};	
		class CurrentStance {};	
		class DeadBodyDetection {};	
		class ExplosionDetection {};	
		class MoveToCoverGroup {};	
		class RecentEnemyDetected {};	
		class SetCombatStance {};	
		class VehicleHandleDanger {};	
	};
};
