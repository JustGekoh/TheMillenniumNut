if(place_meeting(x, y, obj_player)) {
	global.chestnut_collected = true;
	
	save_game(room_get_name(room));
	
	audio_play_sound(snd_nut_pickup, 10, false, 1, 0, 1.2);
	
	instance_create_depth(0, 0, -1000, obj_dialogue_child, {
		text : ["You have collected the chestnut!",
				"You can now use it to go faster and make farther jumps.",
				"To use it press R on keyboard or B on an Xbox360 controller while walking in a direction."
			   ]
	});
	
	instance_destroy();
}