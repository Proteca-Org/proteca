/*
	Minigame: colocar cada um dos 9 itens em seu respectivo cesto
	-> Cesto lixo: applePie, chips, donnut, soda
	-> Cesto de roupa: shirt, bluePants, shorts, sock, panties
	
	Obs: o minigame deve ser iniciado por uma cutscene, quando esta estiver pronta,
	então por enquanto ele se inicia ao clicar em algum dos objetos envovlidos
*/

enum MinigameState {
	IDLE,
	STARTSCREEN,	
	PLAYING,
	DONE,
	END
}

state = MinigameState.IDLE
global.quartoArrumado = false

guiSprX = room_width/2
guiSprY = room_height/2 - 3
guiPlayButtonX =  guiSprX - 5
guiPlayButtonY =  guiSprY + 100
frameScaleX = 0.65
frameScaleY = 0.65
frameSizeX = sprite_get_width(sprFrameMiniGame)*frameScaleX
frameSizeY = sprite_get_height(sprFrameMiniGame)*frameScaleY
binScale = 0.4

// O minigame vai criar os objetos necessários e alterar a visibilidade
// das sprites do cenário ao final do minigame
minigameItensPositionsAndScale = [[300, 180, 0.4], [360, 210, 0.4], [530, 270, 0.35], [555, 190, 0.35], [427, 280, 0.4], [435, 180, 0.4], [510, 170, 0.4], [500, 230, 0.3], [300, 260, 0.45]]
minigameObjects = [objClickableItensForMinigame, objClickableItensForMinigame, objClickableItensForMinigame, objClickableItensForMinigame, objClickableItensForMinigame, objClickableItensForMinigame, objClickableItensForMinigame, objClickableItensForMinigame, objClickableItensForMinigame]
minigameSprites = [sprApplePie, sprChips, sprDonnut, sprSoda, sprShirt, sprBluePants, sprShorts, sprSock, sprPanties]
minigameSpritesIds = []
minigameBinsPositionAndScale = [[330, 335, binScale], [524 - 10, 335, binScale]]
objCount = array_length(minigameObjects)
minigameCorrectiness = true

show_debug_message("guiSprX = {0} guiSprY = {1} frame size X = {2}", guiSprX, guiSprY, frameSizeX)
show_debug_message("clothesBin esta em: ({0},{1}) com escala {2}", minigameBinsPositionAndScale[0][0], minigameBinsPositionAndScale[0][1], minigameBinsPositionAndScale[0][2])
show_debug_message("trashBin esta em: ({0},{1}) com escala {2}", minigameBinsPositionAndScale[1][0], minigameBinsPositionAndScale[1][1], minigameBinsPositionAndScale[1][2])

trashBin = instance_create_layer(minigameBinsPositionAndScale[0][0], minigameBinsPositionAndScale[0][1], "Instances", objBin)
trashBin.image_xscale = minigameBinsPositionAndScale[0][2]
trashBin.image_yscale = minigameBinsPositionAndScale[0][2]
trashBin.strRotulo = "Lixo"
trashBin.isClothesBin = false
clothesBin = instance_create_layer(minigameBinsPositionAndScale[1][0], minigameBinsPositionAndScale[1][1], "Instances", objBin)
clothesBin.image_xscale = minigameBinsPositionAndScale[1][2]
clothesBin.image_yscale = minigameBinsPositionAndScale[1][2]
clothesBin.strRotulo = "Cesto de roupa"
clothesBin.isClothesBin = true

// Salva o ID dos sprites do cenário, para uso posterior
for( var i=0; i<array_length(minigameObjects); i++) {
	minigameSpritesIds[i] =	layer_sprite_get_id("Assets", string(minigameSprites[i]))
}

// No create event, gera os objetos do minigame
for( var i=0; i<array_length(minigameObjects); i++) {
	var objId = instance_create_layer(minigameItensPositionsAndScale[i][0], minigameItensPositionsAndScale[i][1], "Instances", minigameObjects[i])
	objId.sprite_index = minigameSprites[i]
	objId.image_xscale = minigameItensPositionsAndScale[i][2]
	objId.image_yscale = minigameItensPositionsAndScale[i][2]
	if(i <= 3)
		objId.isCloth = false
	else
		objId.isCloth = true
}

// Desativa os objetos até que o minigame comece
for( var i=0; i< array_length(minigameObjects); i++) {
	instance_deactivate_object(minigameObjects[i])
}
instance_deactivate_object(objBin)

text1 = "Você está pronto para iniciar o jogo?"
text2 = "Coloque os itens nos lugares certos."


/////// PROVISORIO

/// Desenha o quadro padrão dos minigames centralizado em (_x, _y)
drawFrame = function drawMinigameFrame(_x, _y) {
	draw_sprite(sprFrameMiniGame, 0, _x, _y)
}

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

/// Escurece a área (0,0)-(_width,_height) atrás do minigame
drawScreenDim = function drawMinigameScreenDim(_alpha, _width, _height) {
	draw_set_alpha(_alpha)
	draw_set_color(c_black)
	draw_rectangle(0, 0, _width, _height, false)
	draw_set_alpha(1.0)
	draw_set_color(c_white)
}

drawFrameScale = function drawMinigameFrameScale(_x, _y, _scaleX, _scaleY) {
	draw_sprite_ext(sprFrameMiniGame, 0, _x, _y, _scaleX, _scaleY, 0, c_white, 1)
}