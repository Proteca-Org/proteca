/// @description Verifica movimentação do jogador
if (!initialized) {
	target_x = x;
	target_y = y;
	initialized = true;
}

var dx = target_x - x;
var dy = target_y - y;
var distance  = point_distance(x, y, target_x, target_y);
var tolerance = 2;

if (distance > tolerance && distance > speed_move) {
    var dir = point_direction(x, y, target_x, target_y);
    x += lengthdir_x(speed_move, dir);
    y += lengthdir_y(speed_move, dir);
} else {
    x = target_x;
    y = target_y;
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
        target_x = mouse_x;
        target_y = mouse_y;
        
        if (target_x > (room_width - (sprite_get_width(sprBlouses) / 2))){
            target_x = room_width - sprite_get_width(sprBlouses) / 2;
        }
        
        if (target_x < (sprite_get_width(sprBlouses) / 2)){
            target_x = sprite_get_width(sprBlouses) / 2;
        }
        
        if (target_y > (room_height - sprite_get_height(sprBlouses))){
            target_y = (room_height - sprite_get_height(sprBlouses));
        }
        
        if (target_y < sprite_get_height(sprBlouses)){
            target_y = sprite_get_height(sprBlouses);
        }
    }
}

