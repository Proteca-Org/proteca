if (keyboard_check_pressed(ord("M"))) {
    is_open = !is_open; // Alterna entre aberto/fechado
}


if (mouse_check_button_pressed(mb_left)) {
    var mx = device_mouse_x_to_gui(0); // Posição X do mouse na GUI
    var my = device_mouse_y_to_gui(0); // Posição Y do mouse na GUI
    
	select_slot = -1
	
    for (var i = 0; i < 4; i++) {
        for (var j = 0; j < 4; j++) {
            var x_pos = start_x + j * (slot_size + padding);
            var y_pos = start_y + i * (slot_size + padding);
         
			
            // Verifica se o clique está dentro do slot
            if (mx >= x_pos && mx < x_pos + slot_size && my >= y_pos && my < y_pos + slot_size) {
                var index_slot = i * 4 + j;
                var item = inventory.slots[index_slot];
                if (is_struct(item)) {
					select_slot = index_slot;
                }
            }
        }
    }
}

if !is_open {select_slot=-1}