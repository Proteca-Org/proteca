if (global.state != gameState.GAME_RUNNING) {
	exit
}

// Para testar minigame na nova room (tirar depois)
if (keyboard_check_pressed(vk_shift)) {
	y = 300
	room_goto(rmEscola3)
}

// Para debug (tirar depois)
if (keyboard_check_pressed(vk_alt)) {
	global.inventoryUnlocked = true;
}

// DEBUG: Primeiro Enter leva até a room; Segundo Enter (já na room) dispara a cutscene (remover depois)
if (keyboard_check_pressed(vk_enter)) {
	if (room == rmHouseSiblingsBedRoom) {
		if (!scrCutsceneIsActive()) {
			scrCutsceneRun(scrCutsceneDefinitions("quarto_arrumado"));
		}
	} else {
		// objPlayer é persistente: sem isso, ele mantém x/y da sala anterior ao trocar de sala
		x = 500;
		y = 300;
		targetX = x;
		targetY = y;
		room_goto(rmHouseSiblingsBedRoom);
	}
}

// Inicialização do alvo na primeira execução
if (!initialized) {
	targetX = x;
	targetY = y;
	initialized = true;
}
if (emInspecao) {
    return; // Sai do Step sem processar movimento
}
var dx = targetX - x;
var dy = targetY - y;
var distance  = point_distance(x, y, targetX, targetY);
var tolerance = 2;

// MOVIMENTAÇÃO PELO TECLADO
var moveX = 0;
var moveY = 0;

var canMove = !global.pause
    && (!variable_global_exists("dialog") || !global.dialog)
    && (!variable_global_exists("isInventoryOpen") || !global.isInventoryOpen)
    && !global.cutscene;

if (canMove) {	
	if (keyboard_check(vk_left) || keyboard_check(ord("A"))) moveX = -1;
	if (keyboard_check(vk_right) || keyboard_check(ord("D"))) moveX = 1;
	if (keyboard_check(vk_up) || keyboard_check(ord("W"))) moveY = -1;
	if (keyboard_check(vk_down) || keyboard_check(ord("S"))) moveY = 1;
}

if (moveX != 0 || moveY != 0) {
	var dir = point_direction(0, 0, moveX, moveY);
	var moveX = lengthdir_x(velocity, dir);
	var moveY = lengthdir_y(velocity, dir);
	
	if (!place_meeting(x + moveX, y, objCollider)) {
		x += moveX;}

	if (!place_meeting(x, y + moveY, objCollider)) {
		y += moveY;}

	targetX = x;
	targetY = y;
	
} else {
	if (distance > tolerance && distance > velocity) {
		var dir = point_direction(x, y, targetX, targetY);
		var moveX = lengthdir_x(velocity, dir);
		var moveY = lengthdir_y(velocity, dir);
	
		if (!place_meeting(x + moveX, y, objCollider)) {
			x += moveX;}

		if (!place_meeting(x, y + moveY, objCollider)) {
			y += moveY;}

		
	} else {
		x = targetX;
		y = targetY;
		
	}
}

if (x > room_width - sprite_get_width(sprBlouses) / 2) x = room_width - sprite_get_width(sprBlouses) / 2;
if (x < sprite_get_width(sprBlouses) / 2) x = sprite_get_width(sprBlouses) / 2;
if (y > room_height - sprite_get_height(sprBlouses)) y = room_height - sprite_get_height(sprBlouses);
if (y < sprite_get_height(sprBlouses)) y = sprite_get_height(sprBlouses);


// MOVIMENTAÇÃO PELO CLIQUE
if (mouse_check_button_pressed(mb_left) && canMove && !global.inventoryConsumedClick) {
	var pauseButtonHalfWidth = sprite_get_width(sprPauseButton) / 2;
	var pauseButtonHalfHeight = sprite_get_height(sprPauseButton) / 2;

	if (!point_in_rectangle(mouse_x, mouse_y,
		global.xPauseButton - pauseButtonHalfWidth,
		global.yPauseButton - pauseButtonHalfHeight,
		global.xPauseButton + pauseButtonHalfWidth,
		global.yPauseButton + pauseButtonHalfHeight)
		&& !global.pause)
	{
		targetX = mouse_x;
		targetY = mouse_y;

		if (targetX > (room_width - (sprite_get_width(sprBlouses) / 2)))
			targetX = room_width - sprite_get_width(sprBlouses) / 2;
		if (targetX < (sprite_get_width(sprBlouses) / 2))
			targetX = sprite_get_width(sprBlouses) / 2;
		if (targetY > (room_height - sprite_get_height(sprBlouses)))
			targetY = (room_height - sprite_get_height(sprBlouses));
		if (targetY < sprite_get_height(sprBlouses))
			targetY = sprite_get_height(sprBlouses);
	}
}

#region Dialog System
	if (keyboard_check_pressed(ord("F"))) {
		var dialog = instance_create_layer(x, y, "Instances", objDialog)
		dialog.objectName = "Teste Geral";
	}
#endregion

// Define o nível de profundidade entre dois objetos, quem está mais abaixo na tela é desenhado na frente
depth = -bbox_bottom;