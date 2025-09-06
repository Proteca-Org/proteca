if (!initialized) {
	targetX = x;
	targetY = y;
	initialized = true;
}

var dx = targetX - x;
var dy = targetY - y;
var distance  = point_distance(x, y, targetX, targetY);
var tolerance = 2;

if (distance > tolerance && distance > velocity) {
    var dir = point_direction(x, y, targetX, targetY);
    x += lengthdir_x(velocity, dir);
    y += lengthdir_y(velocity, dir);
} else {
    x = targetX;
    y = targetY;
}

// no clique ele define o target_x e target_y e verifica a posição para o player nao sair da tela
if (mouse_check_button_pressed(mb_left)) {
    var pauseButtonHalfWidth = sprite_get_width(sprPauseButton) / 2;
    var pauseButtonHalfHeight = sprite_get_height(sprPauseButton) / 2;

    // verifica se bão clicou no botão pause
    if (!point_in_rectangle(mouse_x, mouse_y,
        global.xPauseButton - pauseButtonHalfWidth,
        global.yPauseButton - pauseButtonHalfHeight,
        global.xPauseButton + pauseButtonHalfWidth,
        global.yPauseButton + pauseButtonHalfHeight))
    {
        targetX = mouse_x;
        targetY = mouse_y;
        
        if (targetX > (room_width - (sprite_get_width(sprBlouses) / 2))){
            targetX = room_width - sprite_get_width(sprBlouses) / 2;
        }
        
        if (targetX < (sprite_get_width(sprBlouses) / 2)){
            targetX = sprite_get_width(sprBlouses) / 2;
        }
        
        if (targetY > (room_height - sprite_get_height(sprBlouses))){
            targetY = (room_height - sprite_get_height(sprBlouses));
        }
        
        if (targetY < sprite_get_height(sprBlouses)){
            targetY = sprite_get_height(sprBlouses);
        }
    }
}

#region Dialog System
	if (keyboard_check_pressed(ord("F"))) {
		var dialog = instance_create_layer(x, y, "Instances", objDialog)
		dialog.npcName = "Teste Geral";
	}
#endregion
