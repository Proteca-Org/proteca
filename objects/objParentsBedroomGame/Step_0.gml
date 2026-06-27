if (padlockDoneDelay > 0) {
	padlockDoneDelay--
}

if (shakeTime > 0) {
	shakeTime--
	shakeX = random_range(-shakeIntensity, shakeIntensity)
	shakeY = random_range(-shakeIntensity, shakeIntensity)
	shakeAngle = random_range(-shakeRotation, shakeRotation)
} else {
	shakeX = 0
	shakeY = 0
	shakeAngle = 0
}

if (padlockStartAnimation) {
	var rotSpeed = 100 / padlockAnimationTime
	padlockAngle += rotSpeed
	if (padlockAngle < -180) {
		padlockAngle = -180
	}
	padlockFallSpeed += 0.8
	padlockFallY += padlockFallSpeed
	if (padlockFallY > guiHeight) {
		padlockStartAnimation = false
		padlockDoneDelay = 60
	}
}

// Para depuração
if (state != PuzzleState.IDLE && keyboard_check_pressed(vk_space)) {
	state = PuzzleState.END
}

if (state == PuzzleState.IDLE) {
	
	if (hasChestBeenPressed()) {
		state = PuzzleState.START
	}
	
} else if (state == PuzzleState.START) {
	
	currentAlpha = mathFadeIn(currentAlpha, targetAlpha, fadeSpeed)
	if (currentAlpha >= targetAlpha) {
		state = PuzzleState.MENU
		global.state = gameState.PUZZLE
	}	
	
} else if (state == PuzzleState.MENU) {
	
	if (hasPlayBtnPressed()) {
		state = puzzleCompleted ? PuzzleState.DONE : PuzzleState.PLAYING
	}
	
} else if (state == PuzzleState.PLAYING) {
	
	if (hasPadlockPressed()) {
		if (padlockTries > 0) {
			shakeTime = 15
			padlockTries--
		}
			
		if (padlockTries == 0) {
			padlockStartAnimation = true
			state = PuzzleState.DONE
		}
	}
	
} else if (state == PuzzleState.DONE) {
	
	puzzleCompleted = true
	var btnPressed =  mouse_check_button_pressed(mb_left)
	if (!padlockStartAnimation && btnPressed) {
		state = PuzzleState.END
	}
	
} else if (state == PuzzleState.END) {
	
	currentAlpha = mathFadeOut(currentAlpha, fadeSpeed)
	if (currentAlpha <= 0.0) {		
		state = PuzzleState.IDLE
		global.state = gameState.GAME_RUNNING
	}
	
}