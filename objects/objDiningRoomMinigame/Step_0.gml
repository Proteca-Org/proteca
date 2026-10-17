if (!global.plateClean) {

	currentFood = undefined	
	if(state == MinigameState.IDLE) {
	 
		// Minigame ainda não começou	
		if (global.quartoArrumado && mouse_check_button_pressed(mb_left) &&
			position_meeting(device_mouse_x(0), device_mouse_y(0), diningTable) &&
			point_distance(objPlayer.x, objPlayer.y, diningTable.x, diningTable.y) <= 80) {
				
			state = MinigameState.STARTSCREEN
		}
		
	} else if(state == MinigameState.STARTSCREEN) {
		
		// Tela de start
		global.state = gameState.PUZZLE	 
		
	} else if(state == MinigameState.PLAYING) {		
		
		if (leftFoods == 0) {
			state = MinigameState.END
		}
		
	} else if(state == MinigameState.END) {
		
		if (mouse_check_button_pressed(mb_left)) {
			state = MinigameState.DONE
		}
		
	} else if(state == MinigameState.DONE) {	 
		
		global.plateClean = true
		global.state = gameState.GAME_RUNNING
	
	} 
}
