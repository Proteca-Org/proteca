// Reset do flag toda vez que um frame começa.
// Este evento roda ANTES de qualquer Step de qualquer instância no mesmo frame,
// garantindo que objPlayer leia o valor correto ao processar cliques.
global.inventoryConsumedClick = false;

if (!global.inventoryUnlocked) exit;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var hotbarSlots = 4;
var hotbarX = display_get_gui_width() / 2 - (hotbarSlots * (slotSize + padding)) / 2;
var hotbarY = display_get_gui_height() - slotSize - 20;

if (mouse_check_button_pressed(mb_left)) {
    for (var h = 0; h < hotbarSlots; h++) {
        var hxPos = hotbarX + h * (slotSize + padding);
        if (mx >= hxPos && mx < hxPos + slotSize && my >= hotbarY && my < hotbarY + slotSize) {
            var hItem = global.inventory.slots[h];
            if (is_struct(hItem)) {
                selectedSlot = h;
                global.inventoryConsumedClick = true;
            }
        }
    }
}