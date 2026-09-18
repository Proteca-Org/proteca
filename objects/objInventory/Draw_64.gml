if (!global.inventoryUnlocked) {
    exit;
}

draw_set_alpha(1);
draw_set_color(c_white);

// --- HOTBAR (sempre visivel quando tem mochila) ---
var hotbarSlots = 4;
var hotbarX = display_get_gui_width() / 2 - (hotbarSlots * (slotSize + padding)) / 2;
var hotbarY = display_get_gui_height() - slotSize - 20;

for (var h = 0; h < hotbarSlots; h++) {
    var hxPos = hotbarX + h * (slotSize + padding);
    draw_sprite(sprSlotBackground, 0, hxPos, hotbarY);

    var hItem = global.inventory.slots[h];
    if (is_struct(hItem)) {
        draw_sprite(hItem.spriteItem, 0, hxPos + 32, hotbarY + 32);
    }

    if (h == selectedSlot) {
        var prev_color = draw_get_color();
        draw_set_color(c_white);
        draw_set_alpha(0.3);
        draw_rectangle(hxPos, hotbarY, hxPos + slotSize - 1, hotbarY + slotSize - 1, false);
        draw_set_alpha(1);
        draw_set_color(prev_color);
    }
}

// --- GRID COMPLETO (soh quando inventario aberto) ---
if (!global.isInventoryOpen || instance_exists(objInspectOverlay) || global.dialog) {
	exit;
}

draw_rectangle(startX - 20 , startY -20 , startX + 306, startY + 336, false); // Desenha container do inventario

for (var i = 0; i < 4; i++) {
    for (var j = 0; j < 4; j++) {
        var indexSlot = i * 4 + j;
        var xPos = startX + j * (slotSize + padding);
        var yPos = startY + i * (slotSize + padding);
        
        // Desenha o fundo do slot
        draw_sprite(sprSlotBackground, 0, xPos, yPos);
        
        // Desenha o item, se existir
        var items = global.inventory.slots[indexSlot];
        if (is_struct(items)) {
            draw_sprite(items.spriteItem , 0, xPos + 32, yPos + 32);
        }
		
		// Desenha um retangulo ao redor do item selecionado
		if (indexSlot == selectedSlot) {
            var previous_color = draw_get_color();

			draw_set_color(c_white);
			draw_set_alpha(0.3);
			draw_rectangle(xPos, yPos, xPos + slotSize - 1, yPos + slotSize - 1, false);
            
			draw_set_alpha(1);
			draw_set_color(previous_color)
		}
    }
}
