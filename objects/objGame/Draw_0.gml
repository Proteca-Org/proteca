//Escurecer a tela
drawMinigameScreenDim(0.6, room_width, room_height)
// Estado PLAY
if (estado == "play") {
    draw_sprite_ext(sprGame, 0, x + offsetX, y + offsetY, escalaGame, escalaGame, 0, c_white, 1);    
}

// Estado SENHA
else if (estado == "senha") {
    draw_sprite_ext(sprGame2, 0, x + offsetX - 50, y + offsetY, escalaGame, escalaGame, 0, c_white, 1);
    
    drawMinigameText(senhaDigitada, fntMinigameBig, x, y - 70, 30, 400)
}
else if (estado == "sucesso") {
    draw_sprite_ext(sprGameSucess, 0, x + offsetX - 50, y + offsetY, escalaGame, escalaGame, 0, c_white, 1);
}