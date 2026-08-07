////////////// PROVISORIO
/// Desenha texto informativo padronizado, restaurando o estado de draw ao final
drawText = function drawMinigameText(_text, _font, _x, _y, _sep, _w, _alignCenter = true) {
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

strRotulo = ""
isClothesBin = undefined