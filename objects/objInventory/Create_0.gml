if (instance_number(objInventory) > 1) {
    instance_destroy();
    exit;
}

global.isInventoryOpen = false;
global.inventoryConsumedClick = false;

if (!variable_global_exists("inventoryUnlocked")) {
    global.inventoryUnlocked = false;
}

function noEffect() {
    show_message("function");
    return "return"
};

if (!variable_global_exists("inventory")) {
    global.inventory = new Inventory();
    var pencil = new Item(1, "Lápis", sprPencil, "lápis", noEffect);
    var paper = new Item(2, "Papel", sprFloorPaper, "papel", noEffect);
    global.inventory.addItem(pencil);
    global.inventory.addItem(paper);
}

selectedSlot = -1;

slotSize = 64;
startX = display_get_gui_width() / 2 - 2 * slotSize;
startY = display_get_gui_height() / 2 - 2 * slotSize;
padding = 10;