// Se o minigame ainda não foi resolvido
if(!global.quartoArrumado) {
	if(state == MinigameState.IDLE) {
		// Minigame ainda não começou	
		if(keyboard_check_pressed(vk_space)) {
			show_debug_message("Vou fazer a inicializacao do minigame")
			state = MinigameState.STARTSCREEN
		}
	} else if(state == MinigameState.STARTSCREEN) {
		// Começo do minigame, ou seja, a tela de start	
		// se pressionou botao start
		if(keyboard_check_pressed(vk_space)) {
			// Se o player deu start, então ativa os objetos
			for(var i=0; i<array_length(minigameObjects); i++) {
				instance_activate_object(minigameObjects[i])
			}
			instance_activate_object(trashBin)
			instance_activate_object(clothesBin)
			state = MinigameState.PLAYING			
			global.state = gameState.PUZZLE
		}				
	} else if(state == MinigameState.PLAYING) {
		// Durante o minigame
		if(objCount <= 0) {
			state = MinigameState.END
		}
	} else if(state == MinigameState.END) {
		if(minigameCorrectiness == true) {
			show_debug_message("Voce passou no minigame!!!")
			state = MinigameState.DONE
		}
		else {
			show_debug_message("Nao foi dessa vez! Tente novamente")
			// Recomeçar o minigame
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
		for(var i=0; i<array_length(minigameSpritesIds); i++) {
			instance_deactivate_object(minigameSpritesIds[i])
		}
	}
}

verificaClickNosItens = function() {
	if(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, minigameSpritesIds[2])) {
		show_debug_message("Cliquei no sprite do donnut!")
	}
}