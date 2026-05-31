if (!variable_global_exists("hasBackpack") || !global.hasBackpack) {
    exit;
}

if (keyboard_check_pressed(ord("M")) && !global.pause) {
    global.inventory = !global.inventory; // Alterna entre aberto/fechado
}


if (mouse_check_button_pressed(mb_left)) {
    var mx = device_mouse_x_to_gui(0); // Posição X do mouse na GUI
    var my = device_mouse_y_to_gui(0); // Posição Y do mouse na GUI
    
	selectedSlot = -1
	
    for (var i = 0; i < 4; i++) {
        for (var j = 0; j < 4; j++) {
            var xPos = startX + j * (slotSize + padding);
            var yPos = startY + i * (slotSize + padding);
			
            // Verifica se o clique está dentro do slot
            if (mx >= xPos && mx < xPos + slotSize && my >= yPos && my < yPos + slotSize) {
                var indexSlot = i * 4 + j;
                var item = inventory.slots[indexSlot];
                if (is_struct(item)) {
					selectedSlot = indexSlot;
                }
            }
        }
    }
}

if !global.inventory {selectedSlot=-1}