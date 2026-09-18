image_index = global.inventoryUnlocked ? 1 : 0;

if (!modoInspecao && srcCanOpenDialog()) {
    dialogInitialized = true;
}
if (mouse_check_button_pressed(mb_left) && !position_meeting(mouse_x, mouse_y, id)) {
    dialogInitialized = false;
}
if (dialogInitialized && distance_to_object(objPlayer) <= 15 && !global.inventoryUnlocked) {
    // Modo inspeção
    if (!modoInspecao && (!variable_global_exists("dialog") || !global.dialog) && !global.pause && !global.isInventoryOpen) {
	    modoInspecao = true;
	    mask_index = -1;
	    global.posPlayerOriginalX = objPlayer.x;
	    global.posPlayerOriginalY = objPlayer.y;
	    padlockVisible = true;
	    objPlayer.emInspecao = true;
        var dialog = instance_create_layer(x, y, "Instances_2", objDialog);
        dialog.objectName = "Armário";
        global.dialog = true;
        dialogInitialized = false;
    }
}

// Sair do modo com a tecla de ESPAÇO
if (modoInspecao && keyboard_check_pressed(vk_space)) {
	padlockVisible = false;
	objPlayer.emInspecao = false;
	modoInspecao = false;
    if (instance_exists(objDialog)) { 
		instance_destroy(objDialog); 
	}
    if (instance_exists(objLockerGame)) { 
		instance_destroy(objLockerGame); 
	}
    global.dialog = false;
    dialogInitialized = false;
}

if (modoInspecao && padlockVisible && mouse_check_button_pressed(mb_left)) {
	var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
	if (point_in_rectangle(mx, my, padlockX - padlockHalfW, padlockY - padlockHalfH, padlockX + padlockHalfW, padlockY + padlockHalfH)) {
        if (instance_exists(objDialog)) {
            instance_destroy(objDialog);
            global.dialog = false;
        }
        
        if (!variable_global_exists("encontrouPapel") || !global.encontrouPapel) {
            if (!global.dialog && !global.pause) {
                var dialog = instance_create_layer(x, y, "Instances_2", objDialog);
                dialog.objectName = "Cadeado sem senha";
                global.dialog = true;
            }
        } else {
            if (!instance_exists(objLockerGame)) {
                instance_create_layer(x, y, "Instances_2", objLockerGame);
            }
        }
    }
}