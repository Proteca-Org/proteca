if (mouse_check_button_pressed(mb_left)) {
    if (!global.dialog || isManagingDialog) {
        if (isManagingDialog) global.dialog = false;
        instance_destroy(self);
    }
}