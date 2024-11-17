if(obj_player.player_health < 3){
	draw_sprite(spr_healthpoint_empty, 0, x_coord3, y_coord);
}
else {
	draw_sprite(spr_healthpoint, 0, x_coord3, y_coord);
}


if(obj_player.player_health < 2){
	draw_sprite(spr_healthpoint_empty, 0, x_coord2, y_coord);
}
else {
	draw_sprite(spr_healthpoint, 0, x_coord2, y_coord);
}

if(obj_player.player_health < 1){
	draw_sprite(spr_healthpoint_empty, 0, x_coord1, y_coord);
}
else {
	draw_sprite(spr_healthpoint, 0, x_coord1, y_coord);
}
