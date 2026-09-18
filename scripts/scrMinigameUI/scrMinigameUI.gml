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

/// Desenha um botão retangular com texto. Retorna true se foi clicado nesse frame.
function drawMinigameButton(_text, _font, _x, _y, _w, _h, _enabled = true) {
	var _x1 = _x - _w/2, _y1 = _y - _h/2;
	var _x2 = _x + _w/2, _y2 = _y + _h/2;
	
	var _mx = device_mouse_x_to_gui(0);
	var _my = device_mouse_y_to_gui(0);
	var _hover = _enabled && point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2);
	
	if (!_enabled) {
		draw_set_color($302C2C);
	} else if (_hover && mouse_check_button(mb_left)) {
		draw_set_color($3A3535);
	} else {
		draw_set_color($413C3C);
	}
	draw_rectangle(_x1, _y1, _x2, _y2, false);
	draw_set_color(c_white);
	draw_rectangle(_x1, _y1, _x2, _y2, true);
	drawMinigameText(_text, _font, _x, _y, 0, _w);
	
	return _hover && mouse_check_button_pressed(mb_left);
}

/// Desenha um botão de sprite. Retorna true se clicado.
function drawMinigameSpriteButton(_sprite, _x, _y) {
	var _w = sprite_get_width(_sprite);
	var _h = sprite_get_height(_sprite);
	var _mx = device_mouse_x_to_gui(0);
	var _my = device_mouse_y_to_gui(0);
	var _hover = point_in_rectangle(_mx, _my, _x - _w/2, _y - _h/2, _x + _w/2, _y + _h/2);
	var _held = _hover && mouse_check_button(mb_left);
	
	draw_sprite(_sprite, _held ? 1 : 0, _x, _y);
	
	return _hover && mouse_check_button_pressed(mb_left);
}