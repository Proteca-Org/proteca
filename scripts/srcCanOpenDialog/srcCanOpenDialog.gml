function srcCanOpenDialog(x, y, sprDialog) {
	var x1 = x - sprite_get_width(sprDialog)/2
	var x2 = x + sprite_get_width(sprDialog)/2
	var y1 = y - sprite_get_height(sprDialog)/2
	var y2 = y + sprite_get_height(sprDialog)/2
	
	if (mouse_check_button(mb_left) and point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2) && !(instance_exists(objDialog))) {
		return true	
	}
	return false
}