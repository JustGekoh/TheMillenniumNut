if (place_meeting(x, y, obj_player)) {
	global.almond_collected = true;
	
	save_game();
	
	instance_destroy();
}