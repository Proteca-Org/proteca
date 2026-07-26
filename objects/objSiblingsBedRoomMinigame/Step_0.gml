// Se o minigame ainda não foi resolvido
if(!global.quartoArrumado) {
	// Se o minigame vai começar, então ativa os objetos e altera para o modo de puzzle
	if(state == MinigameState.INITIALIZATION) {
		for(var i=0; i<array_length(minigameObjects); i++) {
			instance_activate_object(minigameObjects[i]);
		}
		global.state = gameState.PUZZLE;
		state = MinigameState.START;
	}

	// Começo do minigame, ou seja, a tela de start
	else if(state == MinigameState.START) {
	}

	// Durante o minigame
	else if(state == MinigameState.PLAYING) {
	}

	// 
	else if(state == MinigameState.END) {
	}

	// Finalização do minigame, incluí a destruição dos objetos
	// e a alteração da visibilidade das sprites relacionadas ao
	// minigame, que foram colocadas no cenário
	else if(state == MinigameState.DONE) {
		for(var i=0; i<array_length(minigameObjects); i++) {
			instance_destroy(minigameObjects[i]);
			
		}
	}
}