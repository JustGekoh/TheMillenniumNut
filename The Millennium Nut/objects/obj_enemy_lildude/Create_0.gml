//State macros
	#macro IDLE_LILDUDE 0
	#macro STUNNED_LILDUDE 1

//Environment
	environment_variables();

//General variables
	collision_objs = [obj_wall, obj_wall_break];
	stunned = false;
	state = IDLE_LILDUDE;
	
//Y speed
	yspd = 0;