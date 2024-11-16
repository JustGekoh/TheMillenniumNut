//Check if player is in aggro range and change state accordingly
	if(distance_to_object(obj_player) <= aggro_range){
		idle = false;
	}
	else {
		idle = true;	
	}

//State change code
	if(idle != prev_idle){
		//Aggro code
		if(!idle){
			if(path_index != -1) {
				path_end();
			} 
		}
		//Idle code
		else {
			closest_point = 0;
			
			for(var _i = 0.0; _i <= 1; _i += 0.05) {
				var _distance_curr = distance_to_point(path_get_x(path, _i), path_get_y(path, _i));
				var _distance_prev = distance_to_point(path_get_x(path, closest_point), path_get_y(path, closest_point));
				if(_distance_curr < _distance_prev) {
					closest_point = _i;	
				}
			}
		}
	}
	
//Idle state code
	if(idle) {
		if(path_index == -1){
			if(distance_to_point(path_get_x(path, closest_point), path_get_y(path, closest_point)) < (speed * 2)) {
				path_start(path, custom_path_speed, path_action_restart, true);
				path_position = closest_point;
			}
			else {
				direction = point_direction(x, y, path_get_x(path, closest_point), path_get_y(path, closest_point));
				speed = custom_path_speed;
			}
		}
		if(stunned) {
			path_speed = 0;	
			speed = 0;
		}
	}
//Aggro state code
	else if(!idle) {
		direction = point_direction(x, y, obj_player.x, obj_player. y + 32);
		if(!stunned){
			speed = custom_path_speed;
		}
	}
	
//Collision
	var _dir_radians = degtorad(direction);
		
	var _speed_x = speed * cos(_dir_radians);
	var _speed_y = speed * sin(_dir_radians);
	
	if(place_meeting(x + _speed_x, y, collision_objs)) {
		x -= _speed_x * 4;
	}
	if(place_meeting(x, y - _speed_y, collision_objs)) {
		y += _speed_y * 4;
	}
	
	if(place_meeting(x, y, obj_player)) {
		alarm_set(0, attack_cd);
		stunned = true;
		speed = 0;
		path_speed = 0;
	}
	
	if(place_meeting(x, y, obj_almond_proj)) {
		bee_health -= 1;
		with(instance_place(x, y, obj_almond_proj)) {
			instance_destroy();
		}
	}

if (bee_health <= 0) {
	instance_destroy();
}

prev_idle = idle;