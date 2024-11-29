if (place_meeting(x, y, obj_player)) {
	global.almond_collected = true;
	
	save_game(room_get_name(room));
	
	audio_play_sound(snd_nut_pickup, 10, false, 1, 0, 1.2);
	
	instance_create_depth(0, 0, -1000, obj_dialogue_child, {
		text : ["You have collected the almond!",
				"You can now shoot the almond. It will destroy weak walls and damage and stun enemies.",
				"To use it press E on keyboard or X on an Xbox360 controller"
			   ]
	});
	
	instance_destroy();
}