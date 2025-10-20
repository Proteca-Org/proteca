function scrMenuSelection(option){
	switch (option) {
		case 0:
			room_goto(1)
			break
			
		case 1:
			show_message("Carregar Jogo!")
			break
			
		case 2:
			game_end()
			break
	}
}