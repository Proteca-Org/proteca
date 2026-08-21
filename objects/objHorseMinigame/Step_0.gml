var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (state == HorseMiniState.INTRO) {

    if (mouse_check_button_pressed(mb_left)) {

        var frame_w = sprite_get_width(sprFrameMiniGame);
        var frame_h = sprite_get_height(sprFrameMiniGame);

        var dentro_frame =
            mx >= frame_x - frame_w / 2 &&
            mx <= frame_x + frame_w / 2 &&
            my >= frame_y - frame_h / 2 &&
            my <= frame_y + frame_h / 2;

        if (dentro_frame) {
    state = HorseMiniState.PUZZLE;
	objPlayer.visible = false;
    if (instance_exists(horse_original)) {
        horse_original.visible = false;
    }
}
    }
}
else if (state == HorseMiniState.PUZZLE) {

    // Movimento da seta
    arrow_x += arrow_speed * arrow_dir;

    if (arrow_x <= arrow_left) {
        arrow_x = arrow_left;
        arrow_dir = 1;
    }

    if (arrow_x >= arrow_right) {
        arrow_x = arrow_right;
        arrow_dir = -1;
    }


    // Clique durante a primeira tentativa
   if (mouse_check_button_pressed(mb_left)) {
	   if (!global.horseEscaped) {
		   instance_destroy(objHorseMinigame);
		   instance_destroy(objHorse);
		   objPlayer.visible =true;
		   global.horseEscaped = true;
	   }
	   else {
        if (arrow_x >= green_left && arrow_x <= green_right) {
            show_debug_message("ACERTOU!");
			
        }
        else {

            show_debug_message("ERROU!");

        }
    }
}
}
