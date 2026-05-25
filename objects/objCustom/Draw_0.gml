#region characterDrawing

// desenha o personagem
draw_sprite_ext(sprHair, selectedFeature[0], x, y, xScale, yScale, 0, -1, 1)
draw_sprite_ext(sprBlouses, selectedFeature[1], x, y, xScale, yScale, 0, -1, 1)
draw_sprite_ext(sprPants, selectedFeature[2], x, y, xScale, yScale, 0, -1, 1)
draw_sprite_ext(sprShoes, selectedFeature[3], x, y, xScale, yScale, 0, -1, 1)
draw_sprite_ext(sprAccessories, selectedFeature[4], x, y, xScale, yScale, 0, -1, 1)

#endregion

#region buttonVariables

// variaveis usadas para posicionamento de botoes e de escrita
var buttonWidth = sprite_get_width(sprButton)
var buttonHeight = sprite_get_height(sprButton)
var buttonHalfWidth = buttonWidth / 2
var buttonHalfHeight = buttonHeight / 2
var displayWidth = display_get_gui_width()
var displayHeight = display_get_gui_height()

var xMargin = 10
var yMargin = 5
var endButtonMargin = 10
var yDisplacement = (yMargin * 2) + buttonHeight
var yArrow = yMargin + (sprite_get_height(sprArrow) / 2)

var endText = "Pronto!"
var endTextWidth = string_width(endText)
var endTextHeight = string_height(endText)

var keyboardEndText = "Enter para finalizar"
var keyboardEndTextWidth = string_width(keyboardEndText)
var keyboardEndTextHeight = string_height(keyboardEndText)
var keyboardTextOffset = 20

var endButtonX = displayWidth - buttonHalfWidth - endButtonMargin
var endButtonY = displayHeight - endButtonMargin - buttonHalfHeight

#endregion

#region buttonDrawing

// define cor e fonte das opcoes
draw_set_font(fntCustomization)
draw_set_color(c_black)

var xButtonOptions = room_width - buttonHalfWidth
var xLeftColumn = xMargin + buttonHalfWidth
var xRightColumn = room_width - buttonHalfWidth - xMargin

// se o menu selecionado for o de partes do corpo, desenha a flecha
if (currentMenu == 0) {
	draw_sprite(sprArrow, 0, xLeftColumn, yMargin + yArrow)
} else { // se o menu selecionado for o de opções dentro de uma parte do corpo, desenha a flecha
	draw_sprite(sprArrow, 0,  xRightColumn, yMargin + yArrow)
}

// loop que desenha botoes e opcoes
for (var i = 0; i < array_length(feature); i++) {	
	// desenha o botao
	draw_sprite_ext(sprButton, 0, xLeftColumn, (yArrow * 4) + yMargin + (yDisplacement * i), 1, 1, 0, -1, 1)

	// (x, y) para string ficar centralizada no botao
	var xStr = xLeftColumn - (string_width(part[i]) / 2)
	var yStr = (yArrow * 4) + yMargin + (yDisplacement * i) - (string_height(part[i]) / 2)

	// escreve a opcao
	draw_text(xStr, yStr, part[i])
	
	// verifica se o botao atual esta selecionado
	if (point_in_rectangle(mouse_x, mouse_y, xLeftColumn - buttonHalfWidth,  (yArrow * 4) + yMargin + (yDisplacement * i) - buttonHalfHeight, xLeftColumn + buttonHalfWidth, (yArrow * 4) + yMargin + (yDisplacement * i) + buttonHalfHeight)) {		
		// se selecionado, verifica se foi pressionado
		if (mouse_check_button_pressed(mb_left)) {
			selectedPart = i
			currentMenu = 0
		}
	}
	
	if (selectedPart == i) {
		draw_set_color(c_white)
		draw_set_alpha(.5)
		draw_rectangle(xLeftColumn - buttonHalfWidth, (yArrow * 4) + yMargin + (yDisplacement * i) - buttonHalfHeight, xLeftColumn + buttonHalfWidth, (yArrow * 4) + yMargin + (yDisplacement * i) + buttonHalfHeight, false)
		draw_set_color(c_black)
		draw_set_alpha(1)
	}
}

for (var i = 0; i < array_length(feature[selectedPart]); i++) {
	
	// desenha o botao
	draw_sprite_ext(sprButton, 0, xRightColumn, (yArrow * 4) + yMargin + (yDisplacement * i), 1, 1, 0, -1, 1)
	
	// (x, y) para string ficar centralizada no botao
	var xStr = xRightColumn - (string_width(feature[selectedPart][i]) / 2);
    var yStr = (yArrow * 4) + yMargin + (yDisplacement * i) - (string_height(feature[selectedPart][i]) / 2);

    // FIX: Trocar a vírgula por colchetes [][]
    draw_text(xStr, yStr, feature[selectedPart][i]);
	
	// verifica se o botao atual esta selecionado
	if (point_in_rectangle(mouse_x, mouse_y, xRightColumn - buttonHalfWidth, (yArrow * 4) + yMargin + (yDisplacement * i) - buttonHalfHeight, xRightColumn + buttonHalfWidth, (yArrow * 4) + yMargin + (yDisplacement * i) + buttonHalfHeight)) {
		
		// se selecionado, verifica se foi pressionado
		if (mouse_check_button_pressed(mb_left)) {
			selectedFeature[selectedPart] = i
			currentMenu = 1
		}
	}
	
	if (selectedFeature[selectedPart] == i) {
		draw_set_color(c_white)
		draw_set_alpha(.5)
		draw_rectangle(xRightColumn - buttonHalfWidth, (yArrow * 4) + yMargin + (yDisplacement * i) - buttonHalfHeight, xRightColumn + buttonHalfWidth, (yArrow * 4) + yMargin + (yDisplacement * i) + buttonHalfHeight, false)
		draw_set_color(c_black)
		draw_set_alpha(1)
	}
	
}

draw_sprite_ext(sprButton, 0, endButtonX, endButtonY, 1, 1, 0, -1, 1)
draw_text(endButtonX - (endTextWidth / 2), endButtonY - (endTextHeight/2), endText)

draw_set_color(c_white)
draw_text(endButtonX - (keyboardEndTextWidth / 2), displayHeight - endButtonMargin - buttonHeight - (endTextHeight/2) - keyboardTextOffset, keyboardEndText)
draw_set_color(c_black)

if (point_in_rectangle(mouse_x, mouse_y, displayWidth - buttonWidth - endButtonMargin, displayHeight - buttonHeight - endButtonMargin, displayWidth - endButtonMargin, displayHeight - endButtonMargin)) {
		
	draw_set_color(c_white)
	draw_set_alpha(.5)
	draw_rectangle(displayWidth - buttonWidth - endButtonMargin, displayHeight - buttonHeight - endButtonMargin, displayWidth - endButtonMargin, displayHeight - endButtonMargin, false)
	draw_set_color(c_black)
	draw_set_alpha(1)
	
	// se selecionado, verifica se foi pressionado
	if (mouse_check_button_pressed(mb_left)) {
		scrCustomDone(selectedFeature)
	}
}
// reseta cor e fonte
draw_set_font(-1)
draw_set_color(-1)

#endregion