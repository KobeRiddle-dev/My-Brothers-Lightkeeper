// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.pixelsToMeter = 64;

function MetersToPixels(meters)
{
	return meters * global.pixelsToMeter;
}

function PixelsToMeters(pixels)
{
	return pixels / global.pixelsToMeter;
}

/// @function
/// @param {Real} microSeconds
/// @return {Real} seconds
/// @description Converts
function convertMicroSecondsToSeconds(microSeconds)
{
	return microSeconds / 1_000_000;
}