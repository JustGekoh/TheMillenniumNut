dialog = new Dialogue();

key_next = vk_anykey;

showing_dialogue = false; 

curr_dialogue = "";

draw_set_alpha(1);

if(instance_exists(obj_player)) {
	obj_player.stunned = true;
	obj_player.invincible = true;
	obj_player.xspd = 0;
	obj_player.yspd = 0;
}