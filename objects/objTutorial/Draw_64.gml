if (state != TutorialState.SHOW) {
	exit	
}

var step = steps[currentStep]
draw_sprite_ext(step.sprite, 0, x, y, 1, 1, 0, c_white, 0.9)
drawDialogTextRectangle()
drawSkipTutorialBtn()