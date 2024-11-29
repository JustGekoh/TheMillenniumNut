dialog = new Dialogue();

key_next = vk_anykey;

showing_dialogue = false; 

curr_dialogue = "";

alpha = 0;

if(instance_exists(obj_player)) {
	obj_player.stunned = true;
	obj_player.invincible = true;
	obj_player.xspd = 0;
	obj_player.yspd = 0;
}