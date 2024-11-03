/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y, obj_player) && !global.cashew_collected) {
	global.cashew_collected = true;
	instance_destroy()
}