var _break_layer = layer_get_id(tile_layer);

layer_set_visible(_break_layer, false);

audio_play_sound(snd_wall_break, 10, false, 0.5, 0.28, 3);