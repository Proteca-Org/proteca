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
            && !global.pause && !global.inventory) {

            var dialog = instance_create_layer(x, y, "Instances", objDialog);
            dialog.objectName = "Carteiras da introdução";
            global.dialog = true;
            
            dialogInitialized = false;
        }
    }
}

// Define o nível de profundidade entre dois objetos, quem está mais abaixo na tela é desenhado na frente
depth = -bbox_bottom;
