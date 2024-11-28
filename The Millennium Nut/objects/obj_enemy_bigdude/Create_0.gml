//State macros
	#macro IDLE_BIGDUDE 0
	#macro STUNNED_BIGDUDE 1

//Environment
	environment_variables();

//General variables
	collision_objs = [obj_wall, obj_wall_break];
	stunned = false;
	state = IDLE_BIGDUDE;
	
//Y speed
	yspd = 0;