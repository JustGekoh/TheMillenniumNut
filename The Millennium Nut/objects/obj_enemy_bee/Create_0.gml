//State macros
	#macro IDLE_BEE 0
	#macro AGGRO_BEE 1
	#macro STUNNED_BEE 2

//Check if path coordinate array has an equal amount of defined x and y coordinates.
//Throw an error if not
var _temp = [];
_temp = x_path_coords
_temp = y_path_coords
_temp = 0;
_temp = attack_cd;

//General variables
	collision_objs = [obj_wall, obj_wall_break];
	state = IDLE_BEE;

//Path variables
	idle = true;
	prev_idle = true;
	closest_point = 0;

//Code for path following. This is idle behaviour.
	if(array_length(x_path_coords) != array_length(y_path_coords)) {
		throw("Instance " + id + " doesn't have an equal amount of x and y coordinates defined for a valid path");
	}

	//Create path
	path = path_add()

	var _create_path = function(_element, _index) {
		path_add_point(path, x_path_coords[_index], y_path_coords[_index], 100);
	}

	array_foreach(x_path_coords, _create_path)

	path_start(path, custom_path_speed, path_end_action, absolute_path)