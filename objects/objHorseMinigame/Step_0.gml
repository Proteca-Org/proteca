var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (state == HorseMiniState.INTRO) {
	
    if (mouse_check_button_pressed(mb_left)) {
        var frame_w = sprite_get_width(sprFrameMiniGame);
        var frame_h = sprite_get_height(sprFrameMiniGame);
        var dentro_frame =
            mx >= frame_x - frame_w / 2 &&
            mx <= frame_x + frame_w / 2 &&
            my >= frame_y - frame_h / 2 &&
            my <= frame_y + frame_h / 2;
			
        if (dentro_frame) {
            state = HorseMiniState.PUZZLE;
            objPlayer.visible = false;
            if (instance_exists(horse_original)) {
                horse_original.visible = false;
            }
        }
    }
}
else if (state == HorseMiniState.PUZZLE) {

    // Movimento da seta
    arrow_x += arrow_speed * arrow_dir;

    if (arrow_x <= arrow_left) {
        arrow_x = arrow_left;
        arrow_dir = 1;
    }

    if (arrow_x >= arrow_right) {
        arrow_x = arrow_right;
        arrow_dir = -1;
    }

    // Clique durante a primeira tentativa
    if (mouse_check_button_pressed(mb_left)) {
       
       if (!global.horseEscaped) {
    // Sempre erra e  cavalo ecapa
    state = HorseMiniState.HORSE_ESCAPE;
    escape_next_state = HorseMiniState.HORSE_WALKING;
    escapeTimer = 100;
}
else {
    // Segunda tentativa, acerta se tiver no verde.
    if (arrow_x >= green_left && arrow_x <= green_right) {
        state = HorseMiniState.VICTORY;
    }
	// Se erra, cavalo empina e perde o jogo
    else {
        state = HorseMiniState.HORSE_ESCAPE;
        escape_next_state = HorseMiniState.FAIL;
        escapeTimer = 100;
    }
}
    }
}
else if (state == HorseMiniState.HORSE_ESCAPE) {
    escapeTimer--;
    if (escapeTimer <= 0) {
        state = escape_next_state;
        // Só reinicia a animação de caminhada se for realmente andar
        if (escape_next_state == HorseMiniState.HORSE_WALKING) {
            horse_walk_sprite = 0;
            horse_walk_timer = 0;
        }
    }
}
else if (state == HorseMiniState.HORSE_WALKING) {
    horse_x += horse_move_speed;
    // Controla a animação das pernas
    horse_walk_timer++;
    if (horse_walk_timer >= 5) {
        horse_walk_timer = 0;
        horse_walk_sprite++;

        if (horse_walk_sprite >= array_length(walking_sprites)) {
            horse_walk_sprite = 0;
        }
    }
    // Quando sair da tela
    if (horse_x > gui_w + 300) {
        // Destrói o cavalo original
        if (instance_exists(objHorse)) {
            instance_destroy(objHorse);
        }
        // Restaura o player
        objPlayer.visible = true;
        // Marca que o cavalo fugiu
        global.horseEscaped = true;
        // Destrói o minigame
        instance_destroy();
    }
}
else if (state == HorseMiniState.FAIL) {

    if (mouse_check_button_pressed(mb_left)) {
        var frame_w = sprite_get_width(sprFrameMiniGame);
        var frame_h = sprite_get_height(sprFrameMiniGame);
        var dentro_frame =
            mx >= frame_x - frame_w / 2 &&
            mx <= frame_x + frame_w / 2 &&
            my >= frame_y - frame_h / 2 &&
            my <= frame_y + frame_h / 2;
        if (dentro_frame) {
            // Reseta a seta para a posição inicial
            arrow_x = arrow_left;
            arrow_dir = 1;
            // Volta pro puzzle
            state = HorseMiniState.PUZZLE;
        }
    }
}