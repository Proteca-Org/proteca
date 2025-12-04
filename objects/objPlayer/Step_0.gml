// Inicialização do alvo na primeira execução
if (!initialized) {
	targetX = x;
	targetY = y;
	initialized = true;
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
    && (!variable_global_exists("inventory") || !global.inventory);	

if (canMove) {	
	if (keyboard_check(vk_left) || keyboard_check(ord("A"))) moveX = -1;
	if (keyboard_check(vk_right) || keyboard_check(ord("D"))) moveX = 1;
	if (keyboard_check(vk_up) || keyboard_check(ord("W"))) moveY = -1;
	if (keyboard_check(vk_down) || keyboard_check(ord("S"))) moveY = 1;
}

if (moveX != 0 || moveY != 0) {
	var dir = point_direction(0, 0, moveX, moveY);
	x += lengthdir_x(velocity, dir);
	y += lengthdir_y(velocity, dir);

	targetX = x;
	targetY = y;
} else {
	if (distance > tolerance && distance > velocity) {
		var dir = point_direction(x, y, targetX, targetY);
		x += lengthdir_x(velocity, dir);
		y += lengthdir_y(velocity, dir);
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
if (mouse_check_button_pressed(mb_left) && (canMove)) {
	show_debug_message("STEP - User: Executando Step.");
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
