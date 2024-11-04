/// @description Script for defining global variables at game start

global.save_file = "save.ini";

if(true) {

	ini_open(global.save_file);

	global.cashew_collected = ini_read_real("nuts", "cashew", false);
	global.almond_collected = ini_read_real("nuts", "almond", false);
	global.chestnut_collected = ini_read_real("nuts", "chestnut", false);
	global.peanut_collected = ini_read_real("nuts", "peanut", false);
	global.millennium_nut_collected = ini_read_real("nuts", "millenniumnut", false);

	global.rm_saved = ini_read_string("player", "room", "rm_hub");

ini_close();

}
else {
	global.cashew_collected = false;
	global.almond_collected = false;
	global.chestnut_collected = false;
	global.peanut_collected = false;
	global.millennium_nut_collected = false;

	global.rm_saved = "rm_hub";
}