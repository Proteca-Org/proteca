if (abertoAgora) {
    abertoAgora = false;
} else if (estado == "senha") {
    for (var i = 0; i <= 9; i++) {
        if (keyboard_check_pressed(ord("0") + i) && string_length(senhaDigitada) < maxDigitos) {
            senhaDigitada += string(i);
        }
    }
    if (keyboard_check_pressed(vk_backspace)) {
        senhaDigitada = string_copy(senhaDigitada, 1, string_length(senhaDigitada) - 1);
    }

} else if (estado == "sucesso") {
    if (mouse_check_button_pressed(mb_left)) {
	    if (!global.dialog && !global.pause && !global.isInventoryOpen) {
	        var dialog = instance_create_layer(x, y, "Instances_2", objDialog);
	        dialog.objectName = "Inventario desbloqueado";
	        global.dialog = true;
	        global.inventoryUnlocked = true;
	        scrCompleteMission("flag_backpack_found");

	        with (objSchoolLocker) {
	            if (modoInspecao) {
	                padlockVisible = false;
	                objPlayer.emInspecao = false;
	                modoInspecao = false;
	            }
	        }
	        instance_destroy();
	    }
	}
}