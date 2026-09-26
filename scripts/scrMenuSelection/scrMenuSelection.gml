function scrMenuSelection(option){
	switch (option) {
		case 0:
			room_goto(1)
			break
			
		case 1:
			scrLoadGame()
			break
			
		case 2:
			game_end()
			break
	}
}