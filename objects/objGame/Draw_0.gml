//Escurecer a tela
draw_set_alpha(0.6);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);
// Estado PLAY
if (estado == "play") {
    draw_sprite_ext(sprGame, 0, x + offsetX, y + offsetY, escalaGame, escalaGame, 0, c_white, 1);    
}

// Estado SENHA
else if (estado == "senha") {
    draw_sprite_ext(sprGame2, 0, x + offsetX - 50, y + offsetY, escalaGame, escalaGame, 0, c_white, 1);
    
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle); 
    var senhaX = x;    
    var senhaY = y - 70;     
    draw_text(senhaX, senhaY, senhaDigitada);    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
else if (estado == "sucesso") {
    draw_sprite_ext(sprGameSucess, 0, x + offsetX - 50, y + offsetY, escalaGame, escalaGame, 0, c_white, 1);
}