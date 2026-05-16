if (srcCanOpenDialog()) {
    dialogInitialized = true;
}

if (mouse_check_button_pressed(mb_left) && !position_meeting(mouse_x, mouse_y, id)) {
    dialogInitialized = false;
}

if (dialogInitialized) {
    if (distance_to_object(objPlayer) <= 15) {

        // Se encontrou o papel
        if (variable_global_exists("encontrouPapel") && global.encontrouPapel) {

            if ((!variable_global_exists("dialog") || !global.dialog) 
                && !global.pause && !global.inventory) {

                var dialog = instance_create_layer(x, y, "Instances", objDialog);
                dialog.objectName = "Armário com papel";
                global.dialog = true;

                dialogInitialized = false;
            }
        }
        else {
            // Se não encontrou o papel
            var dialog = instance_create_layer(x, y, "Instances", objDialog);
            dialog.objectName = "Armário sem papel";
            global.dialog = true;

            dialogInitialized = false;
        }
    }
}