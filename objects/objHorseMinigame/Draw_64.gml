drawMinigameScreenDim(
    0.65,
    display_get_gui_width(),
    display_get_gui_height()
);

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
else if (state == HorseMiniState.PUZZLE) {
    // Cavalo grande no centro
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
    // Barra
    draw_sprite(
        sprMinigameBar,
        0,
        bar_x,
        bar_y
    );

    // Seta preta
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
 
    // Mão
    draw_sprite(
    sprHand,
    0,
    hand_x,
    hand_y
);
}