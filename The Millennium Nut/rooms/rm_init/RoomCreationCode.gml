if (!global.save_exists) {
	obj_player.x = 56;
	obj_player.y = 280;
}
else if (global.save_exists) {
	obj_player.x = global.player_x_save;
	obj_player.y = global.player_y_save;
}

obj_player.double_jump = 0;

room_goto(asset_get_index(global.rm_saved));