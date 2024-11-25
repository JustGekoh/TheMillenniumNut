if(place_meeting(x, y, obj_player)) {
	global.chestnut_collected = true;
	
	save_game(room_get_name(room));
	
	instance_destroy();
}