if (global.state != gameState.GAME_RUNNING) {
	exit
}

/// @description Verifica clique e abre diálogo
if (srcCanOpenDialog()) {
    dialogInitialized = true;
}

if (mouse_check_button_pressed(mb_left) && !position_meeting(mouse_x, mouse_y, id)) {
    dialogInitialized = false;
}

if (dialogInitialized) {
	if (distance_to_object(objPlayer) <= 100) {
        if ((!variable_global_exists("dialog") || !global.dialog) 
            && !global.pause && !global.isInventoryOpen) {

            var dialog = instance_create_layer(x, y, "Instances_2", objDialog);
            dialog.objectName = "Carteiras da introdução";
            global.dialog = true;
            
            dialogInitialized = false;
        }
    }
}