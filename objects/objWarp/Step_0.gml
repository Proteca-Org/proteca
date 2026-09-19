if (variable_global_exists("dialog") && global.dialog) {
	exit
}
if (variable_global_exists("cutscene") && global.cutscene) {
	exit
}
if place_meeting(x, y, objPlayer) and !instance_exists(objFade){
    // Só permite passar se o inventário estiver desbloqueado
	if (global.inventoryUnlocked) {
        var instantiated = instance_create_depth(0, 0, -9999, objFade);
        instantiated.target_x = target_x;
        instantiated.target_y = target_y;
        instantiated.target_room = target_room;
    } else {
        // Opcional: Mostra uma mensagem de que precisa do inventário
        if (!global.dialog) {
            var dialog = instance_create_layer(x, y, "Instances_2", objDialog);
            dialog.objectName = "sair sem inventario";
            global.dialog = true;
			objPlayer.targetY += 32;
        }
    }
}