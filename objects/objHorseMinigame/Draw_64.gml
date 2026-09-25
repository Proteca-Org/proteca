drawMinigameScreenDim(
    0.65,
    display_get_gui_width(),
    display_get_gui_height()
);
// Intro
if (state == HorseMiniState.INTRO) {
    drawMinigameFrame(frame_x, frame_y);
	
    drawMinigameText(
        "Você está pronto para iniciar o jogo?",
        fntMinigameBig,
        frame_x,
        frame_y - 150,
        30,
        375
    );
	
    drawMinigameText(
        "Tente pressionar no botão verde",
        fntMinigameMedium,
        frame_x,
        frame_y,
        30,
        300
    );

    draw_sprite(
        sprButtonPlay,
        0,
        frame_x,
        frame_y + 100
    );
}
//Puzzle
else if (state == HorseMiniState.PUZZLE) {

    draw_sprite_ext(
        sprHorse,
        0,
        horse_x,
        horse_y,
        horse_scale,
        horse_scale,
        0,
        c_white,
        1
    );

    draw_sprite(
        sprMinigameBar,
        0,
        bar_x,
        bar_y
    );

    draw_set_color(c_black);
    draw_triangle(
        arrow_x,
        bar_y,
        arrow_x - 10,
        bar_y - 35,
        arrow_x + 10,
        bar_y - 35,
        false
    );

    draw_set_color(c_white);
    
    draw_sprite(
        sprHand,
        0,
        hand_x,
        hand_y
    );
}

//Cavalo empinando
else if (state == HorseMiniState.HORSE_ESCAPE) {

    draw_sprite_ext(
        sprRearingHorse,
        0,
        horse_x,
        horse_y - 150,
        horse_scale,
        horse_scale,
        0,
        c_white,
        1
    );
}


// Cavalo fugindo
else if (state == HorseMiniState.HORSE_WALKING) {

    draw_sprite_ext(
        walking_sprites[horse_walk_sprite],
        0,
        horse_x,
        horse_y,
        horse_scale,
        horse_scale,
        0,
        c_white,
        1
    );
}
// Vitória
else if (state == HorseMiniState.VICTORY) {

    drawMinigameFrame(
        frame_x,
        frame_y
    );

    drawMinigameText(
        "Parabéns!",
        fntMinigameBig,
        frame_x,
        frame_y - 45,
        10,
        400
    );

    drawMinigameText(
        "Você acalmou o cavalo!",
        fntMinigameSmall,
        frame_x,
        frame_y + 35,
        10,
        400
    );
}
// Derrota
else if (state == HorseMiniState.FAIL) {
	drawMinigameFrame(
	frame_x,
	frame_y
	);
	
	drawMinigameText(
	"O Cavalo fugiu!",
	fntMinigameBig,
	frame_x,
	frame_y - 45,
	10,
	400
	);
	drawMinigameText(
	"Tente novamente!",
	fntMinigameSmall,
	frame_x,
	frame_y +40,
	10,
	400
	);
}