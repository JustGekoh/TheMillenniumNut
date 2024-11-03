//Setup
control_setup();

//Moving
move_dir = 0;
prev_move_dir = 0
move_spd = 5;
xspd = 0;
yspd = 0;

//Vertical Movement
grav = 0.25;
terminal_velocity = 9;
jspd = -7;

double_jump = false;
if(global.cashew_collected) {
	double_jump = true;
}