if (!global.inventory) {
	exit; // Não desenha se o inventário estiver fechado
}

draw_rectangle(startX - 20 , startY -20 , startX + 306, startY + 336, false) // Desenha container do inventario

for (var i = 0; i < 4; i++) {
    for (var j = 0; j < 4; j++) {
        var indexSlot = i * 4 + j;
        var xPos = startX + j * (slotSize + padding);
        var yPos = startY + i * (slotSize + padding);
        
        // Desenha o fundo do slot
        draw_sprite(sprSlotBackground, 0, xPos, yPos);
        
        // Desenha o item, se existir
        var items = inventory.slots[indexSlot];
        if (is_struct(items)) {
            draw_sprite(items.spriteItem , 0, xPos + 32, yPos + 32);
        }
		
		// Desenha um retangulo ao redor do item selecionado
		if (indexSlot == selectedSlot) {
			draw_set_color(c_white)
			draw_set_alpha(0.3)
			draw_rectangle(xPos, yPos, xPos + slotSize - 1, yPos + slotSize - 1, false)
			draw_set_alpha(1)
			draw_set_color(previous_color)
		}
    }
}