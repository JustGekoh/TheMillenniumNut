//State macros
	#macro IDLE 0
	#macro STUNNED 1

//Environment
	environment_variables();

//General variables
	collision_objs = [obj_wall, obj_wall_break];
	stunned = false;
	state = IDLE;
	
//Y speed
	yspd = 0;