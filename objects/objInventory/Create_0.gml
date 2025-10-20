inventory := new Inventory();
global.inventory = false;
selectedSlot = -1;
previous_color = draw_get_color();

slotSize = 64;
startX = display_get_gui_width() / 2 - 2 * slotSize; // Centraliza horizontalmente
startY = display_get_gui_height() / 2 - 2 * slotSize; // Centraliza verticalmente
padding = 10; // Espaçamento entre slots

function noEffect() {
	return "use"
};

var hair := new Item(1, "cabelo", sprHair, "cabelo loiro", noEffect);
var pants := new Item(2, "calca", sprPants, "Calça jeans", noEffect);
inventory.addItem(hair);
inventory.addItem(pants);