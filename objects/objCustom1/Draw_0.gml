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
var xMargin = 10
var yMargin = 5
var buttonWidth = sprite_get_width(sprButton)
var buttonHalfWidth = buttonWidth / 2
var buttonHeight = sprite_get_height(sprButton)
var buttonHalfHeight = buttonHeight / 2
var yArrow = yMargin + (sprite_get_height(sprArrow) / 2)
var yDisplacement = (yMargin * 2) + buttonHeight

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
}
// se o menu selecionado for o de opções dentro de uma parte do corpo, desenha a flecha
else {
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
	var xStr = xRightColumn - (string_width(feature[selectedPart, i]) / 2)
	var yStr = (yArrow * 4) + yMargin + (yDisplacement * i) - (string_height(feature[selectedPart, i]) / 2)

	// escreve a opcao
	draw_text(xStr, yStr, feature[selectedPart, i])
	
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

// reseta cor e fonte
draw_set_font(-1)
draw_set_color(-1)

#endregion