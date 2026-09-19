if (srcCanOpenDialog()) {
    dialogInitialized = true;
}

if (mouse_check_button_pressed(mb_left) && !position_meeting(mouse_x, mouse_y, id)) {
    dialogInitialized = false;
}

if (dialogInitialized) {
    if (distance_to_object(objPlayer) <= 15) {
        
        if ((!variable_global_exists("dialog") || !global.dialog) 
            && !global.pause && !global.isInventoryOpen) {

            var dialog = instance_create_layer(x, y, "Instances_1", objDialog);
            dialog.objectName = "Papel da introdução";
            global.dialog = true;

            // Só gera a senha se ainda não foi encontrada
            if (!global.encontrouPapel) {
                randomize();
                var code = irandom_range(0, 9999);
                global.paperPassword = string_repeat("0", 4 - string_length(string(code))) + string(code);
                global.encontrouPapel = true;
            }
            
            // Verifica se a camada já existe antes de criar
            if (!layer_exists("TopLayer")) {
                layer_create(-100000, "TopLayer");
            }
            
            var overlay = instance_create_layer(
                camera_get_view_width(view_camera[0]) / 2,
                camera_get_view_height(view_camera[0]) / 2,
                "TopLayer", objInspectOverlay
            );
            overlay.image_xscale = 20;
            overlay.image_yscale = 20;
            overlay.inspectData  = { type: "password" };
            
            dialogInitialized = false;
        }
    }
}