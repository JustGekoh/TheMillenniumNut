if(place_meeting(x, y, obj_player)) {
	global.true_nut_collected = true;
	
	save_game(room_get_name(room));
		
	audio_play_sound(snd_nut_pickup, 10, false, 1, 0, 1.2);
	
	instance_create_depth(0, 0, -1000, obj_dialogue_child, {
		text : ["You have collected a weird nut!",
				"You can now understand the weakness of your flesh.",
				"It disgusts you."
			   ]
	});
	
	instance_destroy();
}