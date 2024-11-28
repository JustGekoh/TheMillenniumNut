if(obj_player.player_health < 3){
	draw_sprite_ext(spr_healthpoint_empty, 0, x_coord3, y_coord, 4, 4, 0, c_white, 1);
}
else {
	draw_sprite_ext(spr_healthpoint, 0, x_coord3, y_coord, 4, 4, 0, c_white, 1);
}


if(obj_player.player_health < 2){
	draw_sprite_ext(spr_healthpoint_empty, 0, x_coord2, y_coord, 4, 4, 0, c_white, 1);
}
else {
	draw_sprite_ext(spr_healthpoint, 0, x_coord2, y_coord, 4, 4, 0, c_white, 1);
}

if(obj_player.player_health < 1){
	draw_sprite_ext(spr_healthpoint_empty, 0, x_coord1, y_coord, 4, 4, 0, c_white, 1);
}
else {
	draw_sprite_ext(spr_healthpoint, 0, x_coord1, y_coord, 4, 4, 0, c_white, 1);
}
