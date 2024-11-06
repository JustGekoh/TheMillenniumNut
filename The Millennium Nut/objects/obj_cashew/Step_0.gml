/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y, obj_player) && !global.cashew_collected) {
	global.cashew_collected = true;

	save_game(room_get_name(room));
	
	instance_destroy()
}