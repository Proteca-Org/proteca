if (!global.inventoryUnlocked) {
    exit;
}

if (keyboard_check_pressed(ord("M")) && !global.pause) {
    global.isInventoryOpen = !global.isInventoryOpen;
}

// Teclas 1-4 selecionam slots da hotbar (slots 0-3 do inventário)
for (var k = 0; k < 4; k++) {
    if (keyboard_check_pressed(ord("1") + k)) {
        if (is_struct(global.inventory.slots[k])) {
            selectedSlot = k;
        }
    }
}

// Cliques no grid (apenas quando o menu está aberto)
// inventoryConsumedClick: se o Begin Step já processou um clique na hotbar neste frame,
// não processa o grid para não sobrescrever a seleção.
if (global.isInventoryOpen && !global.inventoryConsumedClick) {
    var leftBtnPressed = mouse_check_button_pressed(mb_left);
    var rightBtnPressed = mouse_check_button_pressed(mb_right);
    
    if (leftBtnPressed || rightBtnPressed) {
        var mx = device_mouse_x_to_gui(0);
        var my = device_mouse_y_to_gui(0);
        
        selectedSlot = -1;
        
        for (var i = 0; i < 4; i++) {
            for (var j = 0; j < 4; j++) {
                var xPos = startX + j * (slotSize + padding);
                var yPos = startY + i * (slotSize + padding);
                
                if (mx >= xPos && mx < xPos + slotSize && my >= yPos && my < yPos + slotSize) {
                    var indexSlot = i * 4 + j;
                    var item = global.inventory.slots[indexSlot];
                    if (is_struct(item)) {
                        selectedSlot = indexSlot;
                    }
                    
                    if (rightBtnPressed) {
                        global.inventory.removeItem(selectedSlot);
                    }
                }
            }
        }
    }
}

// Ao fechar o menu, só limpa selectedSlot se for um slot do grid exclusivo (>= 4).
// Slots de hotbar (0-3) persistem a seleção mesmo com o menu fechado.
if (!global.isInventoryOpen && selectedSlot >= 4) {
    selectedSlot = -1;
}