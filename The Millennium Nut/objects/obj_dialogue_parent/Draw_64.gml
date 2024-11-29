if(showing_dialogue == true) {
	var text_x = 30;
	var text_y = 18;
	var offset_y = 100;
	var height = 32;
	var border = 5;
	var padding = 30;
	var scale = 5;
	
	height = string_height_ext(curr_dialogue, 16, (display_get_gui_width() - 20) / 5) * scale - 25;
	
	offset_y = (display_get_gui_height() / 2) - (height / 2);
	
	height += padding * 2;
	
	draw_set_color(c_black);
	draw_rectangle(0 + padding, offset_y, display_get_gui_width() - padding, offset_y + height, false);
	
	draw_set_color(c_white);
	draw_rectangle(border + padding, offset_y + border, display_get_gui_width() - border - padding, offset_y + height - border, false);
	
	draw_set_color(c_black);
	draw_rectangle((border * 2)  + padding, offset_y + (border * 2), display_get_gui_width() - (border * 2) - padding, offset_y + height - (border * 2), false);
	
	draw_set_color(c_white);
    draw_text_ext_transformed(text_x  + padding, offset_y + text_y, curr_dialogue, 16, (display_get_gui_width() - 100) / 5, scale, scale, 0);
	
	alpha = lerp(alpha, 1, 0.06);
}

draw_set_alpha(1);