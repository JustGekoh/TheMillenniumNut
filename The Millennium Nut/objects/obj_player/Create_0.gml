//Setup
control_setup();
environment_variables();

//Moving
move_dir = 0;
prev_move_dir = 0
move_spd = 5;
xspd = 0;
yspd = 0;

//Vertical Movement
jspd = -7;

double_jump = false;
if(global.cashew_collected) {
	double_jump = true;
}

//Shooting
almond_cd = false;

//Chestnut
dashing = false;
chestnut_id = 0;

//Player health
player_health = 3

invincible = false;

hostile_obj = [obj_spike, obj_enemy_bee]
stunned = false;