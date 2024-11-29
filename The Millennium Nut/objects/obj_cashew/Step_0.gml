if (place_meeting(x, y, obj_player) && !global.cashew_collected) {
	global.cashew_collected = true;

	save_game(room_get_name(room));
	
	audio_play_sound(snd_nut_pickup, 10, false, 1, 0, 1.2);
	
	instance_create_depth(0, 0, -1000, obj_dialogue_child, {
		text : ["You have collected the cashew nut!",
				"You can now jump again while in midair."
			   ]
	});
	
	instance_destroy()
}