if global.dialog == false {
	srcTexts();
	global.dialog = true;
}

if mouse_check_button_pressed(mb_left) {
	if page < array_length(text) - 1 {
		page++;
	} else {
		instance_destroy();
		global.dialog = false;
		mouse_clear(mb_left);
	}
}

