function scrSaveGame() {
	var missionsData = [];
	var currentMission = 0;
	if (variable_global_exists("missions")) {
		for (var i = 0; i < array_length(global.missions); i++) {
			array_push(missionsData, { flag: global.missions[i].flag, done: global.missions[i].done });
		}
		currentMission = global.current_mission;
	}

	var inventoryData = array_create(global.inventory.maxSlots, -1);
	for (var i = 0; i < global.inventory.maxSlots; i++) {
		var slotItem = global.inventory.slots[i];
		inventoryData[i] = (slotItem == -1) ? -1 : slotItem.idItem;
	}

	var save_data = {
		version: 1,
		room: room_get_name(room),
		player: {
			x: objPlayer.x,
			y: objPlayer.y,
			hair: objPlayer.hair,
			blouse: objPlayer.blouse,
			pants: objPlayer.pants,
			shoes: objPlayer.shoes,
			accessory: objPlayer.accessory,
			hairColor: objPlayer.hairColor
		},
		inventory: inventoryData,
		story: {
			missions: missionsData,
			current_mission: currentMission,
			encontrouPapel: global.encontrouPapel,
			paperPassword: global.paperPassword,
			inventoryUnlocked: global.inventoryUnlocked,
			hasBackpack: variable_global_exists("hasBackpack") ? global.hasBackpack : false,
			cutscenesPlayed: global.cutscenesPlayed
		}
	};

	try {
		var jsonStr = json_stringify(save_data);
		var buffer = buffer_create(string_byte_length(jsonStr) + 1, buffer_fixed, 1);
		buffer_write(buffer, buffer_text, jsonStr);
		buffer_save(buffer, "save.json");
		buffer_delete(buffer);
		show_message("Jogo salvo!");
	} catch (_err) {
		show_message("Erro ao salvar o jogo.");
	}
}

function scrLoadGame() {
	if (!file_exists("save.json")) {
		show_message("Nenhum save encontrado.");
		return;
	}

	var save_data;
	try {
		var buffer = buffer_load("save.json");
		var jsonStr = buffer_read(buffer, buffer_text);
		buffer_delete(buffer);
		save_data = json_parse(jsonStr);
	} catch (_err) {
		show_message("Erro ao ler o arquivo de save.");
		return;
	}

	if (!is_struct(save_data) || !variable_struct_exists(save_data, "version") || save_data.version != 1) {
		show_message("Save incompatível ou corrompido.");
		return;
	}

	// Garante que os objetos persistentes de gameplay existem. Normalmente só
	// são criados ao visitar rmEscola1 (objInventory/objPause estão colocados
	// naquela room, objMissionManager é criado pelo RoomCreationCode dela),
	// o que não acontece ao carregar direto do menu principal para uma room
	// qualquer. Precisam ser criados ANTES de restaurar os dados abaixo,
	// porque a Create de objMissionManager reinicializa global.missions/
	// current_mission, que seriam sobrescritos de volta ao estado padrão se
	// a criação acontecesse depois da restauração.
	var playerInstance;
	if (instance_number(objPlayer) == 0) {
		playerInstance = instance_create_layer(0, 0, "Instances", objPlayer);
	} else {
		playerInstance = instance_find(objPlayer, 0);
	}
	if (!instance_exists(objInventory)) {
		instance_create_depth(0, 0, 0, objInventory);
	}
	if (!instance_exists(objPause)) {
		instance_create_depth(0, 0, 0, objPause);
	}
	if (!instance_exists(objMissionManager)) {
		instance_create_depth(0, 0, 0, objMissionManager);
	}

	// Um save carregado nunca deve reexecutar introdução/tutorial
	global.state = gameState.GAME_RUNNING;

	// Flags de história
	if (variable_global_exists("missions")) {
		for (var i = 0; i < array_length(global.missions); i++) {
			for (var j = 0; j < array_length(save_data.story.missions); j++) {
				if (global.missions[i].flag == save_data.story.missions[j].flag) {
					global.missions[i].done = save_data.story.missions[j].done;
				}
			}
		}
		global.current_mission = save_data.story.current_mission;
	}
	global.encontrouPapel = save_data.story.encontrouPapel;
	global.paperPassword = save_data.story.paperPassword;
	global.inventoryUnlocked = save_data.story.inventoryUnlocked;
	global.hasBackpack = save_data.story.hasBackpack;
	global.cutscenesPlayed = save_data.story.cutscenesPlayed;

	// Inventário
	global.inventory = new Inventory();
	for (var i = 0; i < array_length(save_data.inventory); i++) {
		var itemId = save_data.inventory[i];
		if (itemId != -1) {
			global.inventory.slots[i] = scrGetItemById(itemId);
		}
	}

	// Customização do player (playerInstance já foi criada/reaproveitada acima)
	playerInstance.hair = save_data.player.hair;
	playerInstance.blouse = save_data.player.blouse;
	playerInstance.pants = save_data.player.pants;
	playerInstance.shoes = save_data.player.shoes;
	playerInstance.accessory = save_data.player.accessory;
	playerInstance.hairColor = save_data.player.hairColor;

	// Reaproveita o mecanismo existente de reposicionamento ao entrar na room
	global.newRoomStartPosition = { x: save_data.player.x, y: save_data.player.y };
	global.hasEnteredRoom = true;

	room_goto(asset_get_index(save_data.room));
}
