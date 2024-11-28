angle += rotation_spd;

yspd += grav;
if (yspd > terminal_velocity) {
	yspd = terminal_velocity;	
}

//Y Collision
	if(place_meeting(x,y+yspd, collision_objs)){
		yspd = 0;
	}

y += yspd;

if(id == obj_player.chestnut_id && (((x > obj_player.x + 16) || (x < obj_player.x - 16)))){
	obj_player.dashing = false;
	persistent = false;
	alarm_set(0, 500);
}

if (place_meeting(x+xspd, y, collision_objs)){
	audio_play_sound(snd_chestnut_contact, 10, false, .7, 0.1, 1.5);
	instance_destroy();
}
else {
	x += xspd;	
}