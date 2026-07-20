/// Desenha o quadro padrão dos minigames centralizado em (_x, _y)
function drawMinigameFrame(_x, _y) {
	draw_sprite(sprFrameMiniGame, 0, _x, _y)
}

/// Desenha texto informativo padronizado, restaurando o estado de draw ao final
function drawMinigameText(_text, _font, _x, _y, _sep, _w, _alignCenter = true) {
	draw_set_font(_font)
	draw_set_color(c_black)
	if (_alignCenter) {
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
	}
	draw_text_ext(_x, _y, _text, _sep, _w)
	draw_set_color(c_white)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}

/// Escurece a área (0,0)-(_width,_height) atrás do minigame
function drawMinigameScreenDim(_alpha, _width, _height) {
	draw_set_alpha(_alpha)
	draw_set_color(c_black)
	draw_rectangle(0, 0, _width, _height, false)
	draw_set_alpha(1.0)
	draw_set_color(c_white)
}
