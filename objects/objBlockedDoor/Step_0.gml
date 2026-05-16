if (srcCanOpenDialog()) {
    dialogInitialized = true;
}

if (mouse_check_button_pressed(mb_left) && !position_meeting(mouse_x, mouse_y, id)) {
    dialogInitialized = false;
}

if (dialogInitialized) {
    if (distance_to_object(objPlayer) <= 15) {
       
        if ((!variable_global_exists("dialog") || !global.dialog) 
            && !global.pause && !global.inventory) {

            var dialog = instance_create_layer(x, y, "Instances", objDialog);
            
            dialog.objectName = "objBlockedDoor"; 
            
            global.dialog = true;
            
            dialogInitialized = false; 
        }
    }
}
