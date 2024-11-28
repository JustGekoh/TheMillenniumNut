/// @description Reset speed after hitting player
path_speed = custom_path_speed;
speed = custom_path_speed;

if(distance_to_object(obj_player) > aggro_range){
	closest_point = 0;
		
	for(var _i = 0.0; _i <= 1; _i += 0.05) {
		var _distance_curr = distance_to_point(path_get_x(path, _i), path_get_y(path, _i));
		var _distance_prev = distance_to_point(path_get_x(path, closest_point), path_get_y(path, closest_point));
		if(_distance_curr < _distance_prev) {
			closest_point = _i;	
		}
	}
	state = IDLE_BEE;
}
else {
	if(path_index != -1) {
		path_end();	
	}
	state = AGGRO_BEE;	
}