if (global.rm_saved == room_get_name(rm_nut)){
	obj_player.x = 128;
	obj_player.y = 640;
	global.rm_saved = "none";
}

save_game(room_get_name(rm_nut));