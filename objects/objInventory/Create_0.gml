if (instance_number(objInventory) > 1) {
    instance_destroy();
    exit;
}

global.isInventoryOpen = false;
global.inventoryConsumedClick = false;

if (!variable_global_exists("inventoryUnlocked")) {
    global.inventoryUnlocked = false;
}

if (!variable_global_exists("inventory")) {
    global.inventory = new Inventory();
    global.inventory.addItem(scrGetItemById(1));
    global.inventory.addItem(scrGetItemById(2));
}

selectedSlot = -1;

slotSize = 64;
startX = display_get_gui_width() / 2 - 2 * slotSize;
startY = display_get_gui_height() / 2 - 2 * slotSize;
padding = 10;