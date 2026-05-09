function scrPauseSelection(option){
	switch (option) {
		case 0:
			global.pause = false
			break
			
		case 1:
			show_message("Essa funcionalidade será desenvolvida em breve (salvar jogo)")
			break
			
		case 2:
			show_message("Essa funcionalidade será desenvolvida em breve (configurações)")
			break
		case 3:
			game_end()
			break
	}
}