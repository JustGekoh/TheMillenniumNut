if(place_meeting(x, y, obj_player)) {
	global.peanut_collected = true;
	
	save_game(room_get_name(room));
		
	audio_play_sound(snd_nut_pickup, 10, false, 1, 0, 1.2);
	
	instance_destroy();
}