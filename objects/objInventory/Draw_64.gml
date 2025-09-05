if (!is_open) exit; // Não desenha se o inventário estiver fechado


draw_rectangle(start_x - 20 , start_y -20 , start_x + 306, start_y + 336, false) // Desenha container do inventario

for (var i = 0; i < 4; i++) {
    for (var j = 0; j < 4; j++) {
        var index_slot = i * 4 + j;
        var x_pos = start_x + j * (slot_size + padding);
        var y_pos = start_y + i * (slot_size + padding);
        
        // Desenha o fundo do slot
        draw_sprite(spr_slot_background, 0, x_pos, y_pos);
        
        // Desenha o item, se existir
        var items = inventory.slots[index_slot];
        if (is_struct(items)) {
            draw_sprite(items.sprite_item , 0, x_pos + 32, y_pos + 32);
        }
		
		// Desenha um retangulo ao redor do item selecionado
		if (index_slot == select_slot) {
			draw_set_color(c_white)
			draw_set_alpha(0.3)
			draw_rectangle(x_pos, y_pos, x_pos + slot_size - 1, y_pos + slot_size - 1, false)
			draw_set_alpha(1)
			draw_set_color(previous_color)
		}
    }
}