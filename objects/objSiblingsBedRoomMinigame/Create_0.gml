/*
	Minigame: colocar cada um dos 9 itens em seu respectivo cesto
	-> Cesto lixo: applePie, chips, donnut, soda
	-> Cesto de roupa: shirt, bluePants, shorts, sock, panties
	
	Depois de completar, o player é teletransportado
	para a cutscene ser ligada em seguida.
*/

enum MinigameState {
	IDLE,
	STARTSCREEN,	
	PLAYING,
	DONE,
	END
}

state = MinigameState.IDLE

if (!variable_global_exists("quartoArrumado")) global.quartoArrumado = false
if (global.quartoArrumado) {
	instance_destroy(objMinigameSceneClothes)
   	instance_destroy()
    exit
}

minigameCorrectiness = true

hasBinBeenPressed = function() {
	if (!mouse_check_button_pressed(mb_left)) {
		return false;
	}
	
	if (!point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
		return false;
	}
	return true;
}

guiSprX = room_width/2
guiSprY = room_height/2 - 3
guiPlayButtonX =  guiSprX - 5
guiPlayButtonY =  guiSprY + 100
frameScaleX = 0.65
frameScaleY = 0.65
frameSizeX = sprite_get_width(sprFrameMiniGame)*frameScaleX
frameSizeY = sprite_get_height(sprFrameMiniGame)*frameScaleY
binScale = 0.4

text1 = "Você está pronto para iniciar o jogo?"
text2 = "Coloque os itens nos lugares certos."
text3 = "Não foi dessa vez. Tente novamente"
text4 = "Parabéns! Você passou no minigame"

// O minigame vai criar os objetos necessários e alterar a visibilidade das sprites do cenário ao final do minigame
minigameItensPositionsAndScale = [[300, 180, 0.4], [360, 210, 0.4], [530, 270, 0.35], [555, 190, 0.35], [427, 280, 0.4], [435, 180, 0.4], [510, 170, 0.4], [500, 230, 0.3], [300, 260, 0.45]]
minigameObjects = [objClickableItensForMinigame, objClickableItensForMinigame, objClickableItensForMinigame, objClickableItensForMinigame, objClickableItensForMinigame, objClickableItensForMinigame, objClickableItensForMinigame, objClickableItensForMinigame, objClickableItensForMinigame]
minigameSprites = [sprApplePie, sprChips, sprDonnut, sprSoda, sprShirt, sprBluePants, sprShorts, sprSock, sprPanties]
minigameObjSpritesIds = []
minigameBinsPositionAndScale = [[330, 335, binScale], [524 - 10, 335, binScale]]
objCount = array_length(minigameSprites)

// Funções (definidas antes de serem usadas)
function generateClickableItens() {
	for( var i=0; i<array_length(minigameSprites); i++) {
		var objId = instance_create_layer(minigameItensPositionsAndScale[i][0], minigameItensPositionsAndScale[i][1], "Instances", minigameObjects[i])
		objId.sprite_index = minigameSprites[i]
		objId.image_xscale = minigameItensPositionsAndScale[i][2]
		objId.image_yscale = minigameItensPositionsAndScale[i][2]
		objId.stackOrder = i	// Ordem de empilhamento (maior = por cima)
		if(i <= 3)
			objId.isCloth = false
		else
			objId.isCloth = true
	}	
	return
}

verifyitensClick = function(mx, my) {
	for(var i=0; i<array_length(minigameObjSpritesIds); i++) {
		var inst = minigameObjSpritesIds[i]
		if(inst != noone && instance_exists(inst) && position_meeting(mx, my, inst)) {
			return true
		}
	}
	return false
}

drawFrameScale = function drawMinigameFrameScale(x, y, scaleX, scaleY) {
	draw_sprite_ext(sprFrameMiniGame, 0, x, y, scaleX, scaleY, 0, c_white, 1)
}

// Criar os cestos de lixo e de roupa
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

// Salva o ID dos objetos/sprites do cenário, para uso posterior
for( var i=0; i<array_length(minigameObjects); i++) {
	minigameObjSpritesIds[i] = instance_find(objMinigameSceneClothes, i)
}

// Gerar os objetos clickáveis do minigame
generateClickableItens()

// Desativa os objetos até que o minigame comece
instance_deactivate_object(objClickableItensForMinigame)
instance_deactivate_object(objBin)

// Define o nível de profundidade entre dois objetos, quem está mais abaixo na tela é desenhado na frente
depth = -bbox_bottom;
