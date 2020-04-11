/*
 * Author: Olsen
 *
 * Starts tracking all units, except ones with FW_DontTrack set to true.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Public: No
 */

allUnits select {
    !(_x getVariable ["FW_DontTrack", false])
} apply {
    _x call FNC_TrackUnit;
};
