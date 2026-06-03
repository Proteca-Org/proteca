if (distance_to_object(objPlayer) > sprite_get_width(item.spriteItem) / 2) {
	exit
}

if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    if (mouse_check_button_pressed(mb_left)) {
        var added = global.inventory.addItem(item);

        if (added) {
            instance_destroy();
        } else {
            show_debug_message("Inventario cheio");
        }
    }
}