//audio variable
global.bg_vol = 0.15;

//savefile
global.save_file = "save.ini";

//Declaring save variables
global.cashew_collected = false;
global.almond_collected = false;
global.chestnut_collected = false;
global.peanut_collected = false;
global.millennium_nut_collected = false;
global.true_nut_collected = false;
	
global.player_x_save = 128;
global.player_y_save = 640;
	
global.save_exists = false;

global.rm_saved = "rm_start";

//Load game
function load_game() {

	ini_open(global.save_file);

	global.cashew_collected = ini_read_real("nuts", "cashew", false);
	global.almond_collected = ini_read_real("nuts", "almond", false);
	global.chestnut_collected = ini_read_real("nuts", "chestnut", false);
	global.peanut_collected = ini_read_real("nuts", "peanut", false);
	global.millennium_nut_collected = ini_read_real("nuts", "millenniumnut", false);
	global.true_nut_collected = ini_read_real("nuts", "truenut", false);
	
	global.player_x_save = ini_read_real("player", "player_x", 128);
	global.player_y_save = ini_read_real("player", "player_y", 640);
	
	global.save_exists = ini_read_real("save", "exists", false);

	global.rm_saved = ini_read_string("player", "room", "rm_start");

ini_close();

}

