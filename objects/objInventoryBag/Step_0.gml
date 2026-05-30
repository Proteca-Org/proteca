if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        if (!aberto) {
            aberto = true;
        }
    } 
    else {
        if (aberto) {
            aberto = false;
        }
    }
}