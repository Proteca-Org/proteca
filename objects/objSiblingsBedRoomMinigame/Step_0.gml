if(!global.quartoArrumado) {
	
	if(state == MinigameState.IDLE) {
		
		// Minigame ainda não começou	
		if(hasBinBeenPressed()) {
			state = MinigameState.STARTSCREEN;
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
		
		// Trata os itens que acabaram de ser soltos (o item marca justDropped no evento Drag End)
		with(objClickableItensForMinigame) {
			if(justDropped) {
				justDropped = false
				
				// Cesto embaixo do ponteiro; se não houver, o cesto que o item está tocando
				var _bin = instance_position(dropX, dropY, objBin)
				if(_bin == noone) {
					_bin = instance_place(x, y, objBin)
				}
				
				if(_bin != noone) {
					if(_bin.isClothesBin == isCloth) {
						// Acertou: conta o item e remove
						other.objCount -= 1
						instance_destroy()
					} else {
						// Errou: o item volta para onde estava, piscando em vermelho
						returning = true
						flashTimer = 20
					}
				}
				// Se soltou fora dos cestos, o item simplesmente fica onde foi solto
			}
		}
		
		// Animação dos itens voltando para a posição inicial
		with(objClickableItensForMinigame) {
			if(returning) {
				x = lerp(x, startX, 0.25)
				y = lerp(y, startY, 0.25)
				if(point_distance(x, y, startX, startY) < 1) {
					x = startX
					y = startY
					returning = false
				}
			}
			if(flashTimer > 0) {
				flashTimer--
				image_blend = make_color_rgb(255, 120, 120)
			} else {
				image_blend = c_white
			}
		}
		
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
			if(minigameObjSpritesIds[i] != noone) {
				instance_deactivate_object(minigameObjSpritesIds[i])
			}
		}
		
		// Teletransporta o player (para cutscene)
		with (objPlayer) { x = 440; y = 260; targetX = x; targetY = y }
		
		global.quartoArrumado = true
		global.state = gameState.GAME_RUNNING

		
		global.cutscene = true
		scrCutsceneRun(scrCutsceneDefinitions("quarto_arrumado"))
	}
}

