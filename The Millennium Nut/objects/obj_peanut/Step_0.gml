if(place_meeting(x, y, obj_player)) {
	global.peanut_collected = true;
	
	save_game(room_get_name(room));
		
	audio_play_sound(snd_nut_pickup, 10, false, 1, 0, 1.2);
	
	instance_create_depth(0, 0, -1000, obj_dialogue_child, {
		text : ["You have collected the peanut!",
			    "You can now wall jump. To do so, push against a wall and press the jump button."
			   ]
	});
	
	instance_destroy();
}