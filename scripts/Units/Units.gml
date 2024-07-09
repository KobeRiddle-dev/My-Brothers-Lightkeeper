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