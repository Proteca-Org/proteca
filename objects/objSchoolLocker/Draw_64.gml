if (modoInspecao) {
    var guiW = display_get_gui_width();
    var guiH = display_get_gui_height();
	
	padlockX = guiW/2 - 45;
    padlockY = guiH/2 + 45;
    
	drawMinigameScreenDim(0.6, guiW, guiH);
    draw_sprite_ext(sprite_index, image_index, guiW/2, guiH/2, escalaOriginalX * fatorAumento, escalaOriginalY * fatorAumento, 0, c_white, 1);
    
    if (padlockVisible) {
        draw_sprite_ext(sprPadlock, 0, padlockX, padlockY, 1, 1, 0, c_white, 1);
    }
}