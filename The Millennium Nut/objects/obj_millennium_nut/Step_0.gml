if(place_meeting(x, y, obj_player)) {
	global.millennium_nut_collected = true;
	
	save_game(room_get_name(room));
		
	audio_play_sound(snd_nut_pickup, 10, false, 1, 0, 1.2);
	
	instance_create_depth(0, 0, -1000, obj_dialogue_child, {
		text : ["YOU COLLECTED THE MILLENNIUM NUT!!!",
				"NOW GET OUT OF HERE AND PLANT IT!!!"
			   ]
	});
	
	with(instance_nearest(x, y, obj_warp)) {
		rm_next = rm_credits;
	}
	
	instance_destroy();
}