switch(state) {
	case IDLE_BEE:
	if(path_index == -1){
		//Check if path has been reached and start path on reached path_position
		if(distance_to_point(path_get_x(path, closest_point), path_get_y(path, closest_point)) < speed) {
			path_start(path, custom_path_speed, path_action_restart, true);
			path_position = closest_point;
		}
		//If path has not been reached, recalculate direction needed to reach it
		else {
			direction = point_direction(x, y, path_get_x(path, closest_point), path_get_y(path, closest_point));
			speed = custom_path_speed;
		}
	}
	//Check if player is in aggro range and change state
	if(distance_to_object(obj_player) <= aggro_range){
		if(path_index != -1) {
			path_end();
		}
		state = AGGRO_BEE;
	}
	break;
	
	case AGGRO_BEE:
	direction = point_direction(x, y, obj_player.x, obj_player.y);
	speed = custom_path_speed;
	//Check if player is in aggro range and change state
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
	break;
	
	case STUNNED_BEE:
	speed = 0;
	path_speed = 0;
	break;
}
	
//Collision with environment
	var _dir_radians = degtorad(direction);
		
	var _speed_x = speed * cos(_dir_radians);
	var _speed_y = speed * sin(_dir_radians);
	
	if(place_meeting(x + _speed_x, y, collision_objs)) {
		x -= _speed_x * 4;
	}
	if(place_meeting(x, y - _speed_y, collision_objs)) {
		y += _speed_y * 4;
	}
	
//Collision with player
	if(place_meeting(x, y, obj_player)) {
		alarm_set(0, attack_cd);
		state = STUNNED_BEE;
	}
	
//Collision with almond projectile
	if(place_meeting(x, y, obj_almond_proj)) {
		bee_health -= 1;
		if(bee_health >= 1){
			alarm_set(0, attack_cd);
			state = STUNNED_BEE;
		}
		with(instance_place(x, y, obj_almond_proj)) {
			instance_destroy();
		}
		if (bee_health <= 0) {
			instance_destroy();
		}
	}