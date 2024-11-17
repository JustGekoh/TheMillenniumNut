/// @description Reset speed after hitting player
state = IDLE_BEE;
path_speed = custom_path_speed;
speed = custom_path_speed;

for(var _i = 0.0; _i <= 1; _i += 0.05) {
	var _distance_curr = distance_to_point(path_get_x(path, _i), path_get_y(path, _i));
	var _distance_prev = distance_to_point(path_get_x(path, closest_point), path_get_y(path, closest_point));
	if(_distance_curr < _distance_prev) {
		closest_point = _i;	
	}
}