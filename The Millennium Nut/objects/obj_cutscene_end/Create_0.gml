audio_listener_position(room_width/2, room_height/2, 0);
audio_listener_orientation(0, 0, 1000, 0, -1 ,0);

sequence_id = 0;

if(global.true_nut_collected) {
	sequence_id = layer_sequence_create("Assets_1", room_width / 2, room_height/2, sq_true_nut);
}
else {
	sequence_id = layer_sequence_create("Assets_1", room_width / 2, room_height/2, sq_milenium_nut);
}


if(instance_exists(obj_chestnut_dash)) {
	instance_destroy(obj_chestnut_dash);	
}

if(instance_exists(obj_player)) {
	instance_destroy(obj_player);	
}

if(instance_exists(obj_healthbar)) {
	instance_destroy(obj_healthbar);	
}

audio_pause_sound(bg_loop_music);