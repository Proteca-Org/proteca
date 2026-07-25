// Handler unificado de interações

if (srcCanOpenDialog()) {
    if (requireProximity) {
        dialogInitialized = true;
    } else {
        // abre imediatamente, sem precisar de proximidade
        scrTriggerDialog(id);
    }
}

// cancela se clicado fora
if (mouse_check_button_pressed(mb_left) && !position_meeting(mouse_x, mouse_y, id)) {
    dialogInitialized = false;
}

// diálogo que depende de estar próximo
if (dialogInitialized) {
    if (distance_to_object(objPlayer) <= proximityRange) {
        if ((!variable_global_exists("dialog") || !global.dialog)
            && !global.pause && !global.isInventoryOpen) {
            scrTriggerDialog(id);
            dialogInitialized = false;
        }
    }
}

if (hasItem && item != noone) {
    if (dialogOpened && (!variable_global_exists("dialog") || !global.dialog)) {
        if (global.inventory.addItem(item)) {
            if (pickupDialog != "") {
                var d = instance_create_layer(x, y, dialogLayer, objDialog);
                d.objectName = pickupDialog;
                global.dialog = true;
            }
            hasItem = false;
            instance_destroy();
        } else {
            show_debug_message("Inventário cheio");
        }
    }
}

// define o nível de profundidade entre dois objetos, quem está mais abaixo na tela é desenhado na frente
depth = -bbox_bottom;