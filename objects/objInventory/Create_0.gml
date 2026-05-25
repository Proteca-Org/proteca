global.inventory = new Inventory();
global.isInventoryOpen = false;
selectedSlot = -1;

slotSize = 64;
startX = display_get_gui_width() / 2 - 2 * slotSize; // Centraliza horizontalmente
startY = display_get_gui_height() / 2 - 2 * slotSize; // Centraliza verticalmente
padding = 10; // Espaçamento entre slots

function noEffect() {
	show_message("function");
	return "return"
};

var hair = new Item(1, "cabelo", sprHair, "cabelo loiro", noEffect);
var pants = new Item(2, "calca", sprPants, "Calça jeans", noEffect);
global.inventory.addItem(hair);
global.inventory.addItem(pants);