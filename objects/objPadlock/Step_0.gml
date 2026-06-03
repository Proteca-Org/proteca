if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {    
    // Só permite clicar se estiver em modo inspeção
    if (!instance_exists(objSchoolLocker)) return;
    if (!objSchoolLocker.modoInspecao) return;
    if (instance_exists(objDialog)) {
        instance_destroy(objDialog);
        global.dialog = false;
    }
    // Antes de achar o papel
    if (!variable_global_exists("encontrouPapel") || !global.encontrouPapel) {                
        if (!global.dialog && !global.pause) {
            var dialog = instance_create_layer(x, y, "Instances_2", objDialog);			
            dialog.objectName = "Cadeado sem senha";
            global.dialog = true;
        }
    }    
    // Se achou o papel
    else { 
        if (!instance_exists(objGame)) {
            instance_create_layer(x, y, "Instances_2", objGame);
        }
    }
}