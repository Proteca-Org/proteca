// Se o minigame ainda não foi resolvido
if(!global.quartoArrumado) {
	
	if(state == MinigameState.IDLE) {
		
		// Minigame ainda não começou	
		if(mouse_check_button_pressed(mb_left) && verifyitensClick(device_mouse_x(0), device_mouse_y(0))) {
			state = MinigameState.STARTSCREEN
		}
	} else if(state == MinigameState.STARTSCREEN) {
		
		// Começo do minigame, ou seja, a tela de start	
		global.state = gameState.PUZZLE		
		if(mouse_check_button_pressed(mb_left)) {
			var mx = device_mouse_x(0)
			var my = device_mouse_y(0)
			var playSizeX = sprite_get_width(sprButtonPlay)
			var playSizeY = sprite_get_height(sprButtonPlay)
			if(guiPlayButtonX - 1 - (playSizeX*frameScaleY)/2.5 <= mx && mx <= guiPlayButtonX + 2 + (playSizeX*frameScaleY)/2.5 &&
			   guiPlayButtonY + 1 - (playSizeY*frameScaleY)/3 <= my && my <= guiPlayButtonY - 4 + (playSizeY*frameScaleY)/3) {
				// Se o player deu start, então ativa os objetos
				for(var i=0; i<array_length(minigameObjects); i++) {
					instance_activate_object(minigameObjects[i])
				}
				instance_activate_object(trashBin)
				instance_activate_object(clothesBin)
				state = MinigameState.PLAYING			
			}
			
		}				
	} else if(state == MinigameState.PLAYING) {
		
		// Durante o minigame
		if(objCount <= 0) {
			state = MinigameState.END
		}
	} else if(state == MinigameState.END) {
		
		if(minigameCorrectiness == true) {
			if(mouse_check_button_pressed(mb_left)) {
				state = MinigameState.DONE
			}
		}
		else {
			if(mouse_check_button_pressed(mb_left)) {
				// Recriar os objetos clickáveis
				objCount = array_length(minigameSprites)
				generateClickableItens()
				instance_deactivate_object(objClickableItensForMinigame)
				instance_deactivate_object(objBin)
				minigameCorrectiness = true
				state = MinigameState.STARTSCREEN
			}
		}
		
	} else if(state == MinigameState.DONE) {
		
		// Finalização do minigame, incluí a destruição dos objetos
		// e a alteração da visibilidade das sprites relacionadas ao
		// minigame, que foram colocadas no cenário
		for(var i=0; i<array_length(minigameObjects); i++) {
			instance_destroy(minigameObjects[i])			
		}
		instance_destroy(trashBin)
		instance_destroy(clothesBin)
		for(var i=0; i<array_length(minigameObjSpritesIds); i++) {
			instance_deactivate_object(minigameObjSpritesIds[i])
		}
		
		global.quartoArrumado = true
		global.state = gameState.GAME_RUNNING
	}
}

verifyitensClick = function(_mx, _my) {
	var result = false
	for(var i=0; i<array_length(minigameObjSpritesIds); i++) {
		if(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, minigameObjSpritesIds[i])) {
			result = true
			break
		}
	}
	return result
}