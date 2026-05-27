if (instance_number(objInventory) > 1) {
    instance_destroy();
    exit;
}

inventory = new Inventory();
global.inventory = false;
selectedSlot = -1;

slotSize = 64;
startX = display_get_gui_width() / 2 - 2 * slotSize; // Centraliza horizontalmente
startY = display_get_gui_height() / 2 - 2 * slotSize; // Centraliza verticalmente
padding = 10; // Espaçamento entre slots

function noEffect() {
	show_message("function");
	return "return"
};

var pencil = new Item(1, "Lápis", sprPencil, "lápis", noEffect);
var paper = new Item(2, "Papel", sprFloorPaper, "papel", noEffect);
inventory.addItem(pencil);
inventory.addItem(paper);