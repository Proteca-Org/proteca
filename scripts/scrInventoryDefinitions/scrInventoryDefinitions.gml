function Inventory() constructor{
	slots := array_create(4 * 4, -1);  //inicializa vazio
	maxSlots := 16;
	
	static addItem = function(item) {
		for(var i = 0; i <= maxSlots; i++) {
			if (slots[i] == -1) {
				slots[i] = item;
				return true;
			}
		}
		return false;  //Inventario cheio
	}
	
	static removeItem = function(indexSlot) {
		if (indexSlot >= 0 && indexSlot <= maxSlots) {
			var item := slots[indexSlot];
			slots[indexSlot] = -1;
			show_message("Removed Item")	
			return item;
		}
		return -1;   //slot já vazio
	}
	
	static inspectItem = function(indexSlot) {
		if (indexSlot >= 0 && indexSlot <= maxSlots && slots[indexSlot] != -1) {
			var item := slots[indexSlot];
			show_message("Inspect Item")
			return item
		}
	}
	
	static useItem = function(indexSlot) {
		var item := inspectItem(indexSlot);
		if (item != -1) {
			item.effectItem();
		}
	}
}

function Item(_idItem, _nameItem, _spriteItem, _descriptionItem, _effectItem) constructor {
	idItem := _idItem;
	nameItem := _nameItem;
	spriteItem := _spriteItem;
	descriptionItem := _descriptionItem;
	effectItem := _effectItem;
}