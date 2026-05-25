function Inventory() constructor{
	slots := array_create(4 * 4, -1);  //inicializa vazio
	max_slots := 16;
	
	static add_item = function(_item) {
		for(var i = 0; i <= max_slots; i++) {
			if (slots[i] == -1) {
				slots[i] = _item;
				show_message("Add Item")	
				return true;
			}
		}
		return false;  //Inventario cheio
	}
	
	static remove_item = function(index_slot) {
		if (index_slot >= 0 && index_slot <= max_slots) {
			var item := slots[index_slot];
			slots[index_slot] = -1;
			show_message("Removed Item")	
			return item;
		}
		return -1;   //slot já vazio
	}
	
	static inspect_item = function(index_slot) {
		if (index_slot >= 0 && index_slot <= max_slots && slots[index_slot] != -1) {
			var item := slots[index_slot];
			show_message("Inspect Item")
			return item
		}
	}
	
	static use_item = function(index_slot) {
		var item := inspect_item(index_slot);
		if (item != -1) {
			item.effect_item();
		}
	}
}

function Item(_id_item, _name_item, _sprite_item, _description_item, _effect_item) constructor {
	id_item := _id_item;
	name_item := _name_item;
	sprite_item := _sprite_item;
	description_item := _description_item;
	efect_item := _effect_item;
}