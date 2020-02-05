// Authors:		StatusRed & PiZZADOX

/* This module allows you to spawn AI units on a connected headless client kitting them out with a gear script.
 * NOTE: If a headless client is not connected the AI units will be spawned on the server instead.
 * STEPS REQUIRED TO USE THIS MODULE:
 *     - The gear script MUST be included in 'customisation\gear.sqf'
 *     - A PLAYABLE headless client unit named 'HC_1' must be added to the mission
 *     - Create AI spawn groups using the format below and include them in the _groups variable
 */

// private _group1 = [POSITION, [[UNIT TYPE, GEAR SCRIPT]], SIDE];
private _group1 = [(getMarkerPos "marker_spawn"), [["B_W_Officer_F", "BAF_PL"], ["B_W_Medic_F", "BAF_MED"]], blufor];
private _group2 = [(getMarkerPos "marker_spawn2"), [["B_W_Officer_F", "BAF_PL"], ["B_W_Medic_F", "BAF_MED"], ["B_W_Medic_F", "BAF_MED"]], blufor];

// Include all of your created AI spawn groups in this variable
// private _groups = [_group1, _group2, _group3, _group4 etc...];
private _groups = [_group1, _group2];

// This function is also available when the module is loaded to use how you see fit.
/*
 * Author: PiZZADOX & StatusRed
 * Spawns an array of unit types and olsen gear types
 *
 * Arguments:
 * 0: Group Spawn Position <Position>
 * 1: Unit Array in nested format <ARRAY> ([<unit classname>, <gear type>])
 * 2: Side <Side> (default: east)
 *
 * Return Value:
 * Group
 *
 * Example:
 * [[0, 0, 0], [["B_W_Officer_F", "BAF_PL"], ["B_W_Medic_F", "BAF_MED"]], east] call FNC_SpawnUnits;
 *
 * Public: Yes
 */
