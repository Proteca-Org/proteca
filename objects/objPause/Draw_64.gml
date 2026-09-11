/// @description Desenha a pausa (o botão ou o menu)
if (room == rmMenu) {
	exit;
}

draw_set_font(fntMenu)

// x e y do mouse
var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)

// auxiliares de tela e espaçamento
var yMargin = 10;
var guiHalfWidth = display_get_gui_width()/2
var guiHalfHeight = display_get_gui_height()/2

// dimensões do botão
var buttonWidth = sprite_get_width(sprButton)
var buttonHalfWidth = buttonWidth / 2
var buttonHeight = sprite_get_height(sprButton)
var buttonHalfHeight = buttonHeight / 2

// posição inicial em y do centro do primeiro botão
// metade da tela - metade do margin (metade pra cima e metade pra baixo) - altura do botão - margin - metade do botão = y centralizado para o primeiro botão
var yButtonStartPosition = guiHalfHeight - (yMargin / 2) - buttonHeight - yMargin - buttonHalfHeight

// Variáveis usadas para desenhar o botão de pausa
var pauseButtonHalfWidth = sprite_get_width(sprPauseButton)/2
var pauseButtonHalfHeight = sprite_get_height(sprPauseButton)/2 
global.xPauseButton = guiHalfWidth
global.yPauseButton = pauseButtonHalfHeight + 5

// Se o jogo não está pausado, desenha o botão de pause
if (!global.pause) {
	
	var btnAlpha = 0.7; 
	
	if (point_in_rectangle(mx, my, global.xPauseButton-pauseButtonHalfWidth, global.yPauseButton-pauseButtonHalfHeight, global.xPauseButton+pauseButtonHalfWidth, global.yPauseButton+pauseButtonHalfHeight)) {
		btnAlpha = 1.0;
		
		if (mouse_check_button_pressed(mb_left)) {
			global.pause = true;
		}
	} 
	
	draw_sprite_ext(sprPauseButton, -1, global.xPauseButton, global.yPauseButton, 1, 1, 0, c_white, btnAlpha);
	
	exit;
}

// Se o jogo está pausado, desenha as opções do menu de pausa
draw_set_alpha(.8)
draw_set_color(c_black)
draw_rectangle(0, 0, guiHalfWidth*2, guiHalfHeight*2, false)
draw_set_alpha(1)
for (var i = 0; i < numOptions; i++) {
	
	// posição em y do centro do botão
	var yButtonPosition = yButtonStartPosition + (i * (yMargin + buttonHeight))
    draw_sprite_ext(sprButton, 0, guiHalfWidth, yButtonPosition, 1, 1, 0, -1, 1)

    // define o a posição da string centralizada no botão
	var xStr = guiHalfWidth- (string_width(options[i]) / 2)
    var yStr = yButtonPosition - (string_height(options[i]) / 2)

    // escreve a opcao
    draw_text(xStr, yStr, options[i])

    if (point_in_rectangle(mx, my, guiHalfWidth - buttonHalfWidth,  yButtonPosition - buttonHalfHeight, guiHalfWidth + buttonHalfWidth, yButtonPosition + buttonHalfHeight)) {
        // se selecionado, verifica se foi pressionado
        selectedOption = i
        if (mouse_check_button_pressed(mb_left)) {
            scrPauseSelection(selectedOption);
			if (i == 0) {
				global.pause = false;
			}
        }
    }

    if (selectedOption == i) {
        draw_set_color(c_white)
        draw_set_alpha(.5)
        draw_rectangle(guiHalfWidth - buttonHalfWidth,  yButtonPosition - buttonHalfHeight, guiHalfWidth + buttonHalfWidth, yButtonPosition + buttonHalfHeight, false)
        draw_set_color(c_black)
        draw_set_alpha(1)
    }
}

if (keyboard_check_pressed(vk_enter)){
    scrPauseSelection(selectedOption);
    
    if (selectedOption == 0) {
        global.pause = false;
    }
}

draw_set_font(-1)