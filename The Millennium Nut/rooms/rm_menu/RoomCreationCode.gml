if(!audio_is_playing(bg_loop_music)) {
	audio_play_sound(bg_loop_music, 1, true, 1);
	audio_sound_gain(bg_loop_music, global.bg_vol, 0);
}