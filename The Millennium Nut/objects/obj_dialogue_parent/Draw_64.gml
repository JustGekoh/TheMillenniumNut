if(showing_dialogue == true) {
	var text_x = 30;
	var text_y = 18;
	var offset_y = 100;
	var height = 32;
	var border = 5;
	var padding = 30;
	var scale = 5;
	
	height = string_height_ext(curr_dialogue, 16, (display_get_gui_width() - 100) / 5) * scale - 25;
	
	height += padding * 2;
	
	if(size == "wrap_text"){
		offset_y = (display_get_gui_height() / 2) - (height / 2);
	}	
	else if(size == "match_parent") {
		offset_y = 0;
		border = 0;
		padding = 0;
	}
	
	if(has_border){
		draw_set_color(make_color_rgb(130, 60, 61));
		draw_rectangle(0 + padding, offset_y, display_get_gui_width() - padding, offset_y + height, false);
	
		draw_set_color(make_color_rgb(255, 252, 235));
		draw_rectangle(border + padding, offset_y + border, display_get_gui_width() - border - padding, offset_y + height - border, false);
	}
	
	draw_set_color(make_color_rgb(130, 60, 61));
	
	if(size == "wrap_text"){
		draw_rectangle((border * 2)  + padding, offset_y + (border * 2), display_get_gui_width() - (border * 2) - padding, offset_y + height - (border * 2), false);
	}
	else if(size == "match_parent") {
		draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	}
	
	draw_set_color(make_color_rgb(255, 252, 235));
	draw_set_font(global.font_main);
	
	if(text_align == "center"){
		draw_set_halign(fa_center);	
		draw_set_valign(fa_middle);	
		text_x =  display_get_gui_width() / 2;
		text_y = (display_get_gui_height() / 2);
	}
	
	draw_text_ext_transformed(text_x + padding, offset_y + text_y, curr_dialogue, 16, (display_get_gui_width() - 100) / 5, scale, scale, 0);
	
}
