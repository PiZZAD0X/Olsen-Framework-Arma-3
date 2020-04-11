/*
 * Author: Olsen, StatusRed (EM-Creations.co.uk)
 *
 * Add module to list.
 *
 * Arguments:
 * 0: name <string>
 * 1: version <string>
 * 2: description <string>
 * 3: author <string>
 *
 * Return Value:
 * nothing
 *
 * Public: Yes
 */

params ["_name", "_version", "_description", "_author"];

FW_Modules set [count FW_Modules, [_name, _version, _description, _author]];
