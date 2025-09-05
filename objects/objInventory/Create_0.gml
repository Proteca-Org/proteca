inventory := new Inventory();
is_open := true;
select_slot = -1;
previous_color = draw_get_color();


slot_size = 64;
start_x = display_get_gui_width() / 2 - 2 * slot_size; // Centraliza horizontalmente
start_y = display_get_gui_height() / 2 - 2 * slot_size; // Centraliza verticalmente
padding = 10; // Espaçamento entre slots

function no_effect(){return "use"};

var hair := new Item(1, "cabelo", sprHair, "cabelo loiro", no_effect);
var pants := new Item(2, "calca", sprPants, "Calça jeans", no_effect);
inventory.add_item(hair);
inventory.add_item(pants);