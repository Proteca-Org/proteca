var results = video_draw()
if (results[0] == 0) {
	draw_surface_stretched(results[1], 0, 0, display_get_gui_width(), display_get_gui_height());
} 

var strHeight = string_height("A")
var xDisplacement = 10
var yDisplacement = 10

draw_set_font(fntCustomization)
for (var i = 0; i < numOptions; i++) {
	var strWidth = string_width(options[i])
	
	var x1 = room_width - strWidth - xDisplacement
	var y1 = i * strHeight + yDisplacement
	
	var x2 = x1 + strWidth
	var y2 = y1 + strHeight  
	
	if (point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2)) {
		selectedOption = i
		if (mouse_check_button_pressed(mb_left)) {
			if (selectedOption == 0) {
				if (video_get_status() == video_status_playing)
					video_pause()
				else if (video_get_status() == video_status_paused)
					video_resume()
			} else if (selectedOption == 1) {
				video_close();
				instance_activate_object(objPlayer);
				room_goto_next();
			}
		}
	}
	
	if (selectedOption == i) {
		draw_set_color(c_yellow)
	} else {
		draw_set_color(c_white)
	}
		
	
	draw_text(x1, y1, options[i])
}

draw_set_font(-1)