var step = steps[currentStep]

switch (state) {
    case TutorialState.SHOW:
        var actionPerformed = false
        switch (step.action) {
            case "move":
                actionPerformed = keyboard_check_pressed(step.key)
                break

            case "mouse":
                actionPerformed = mouse_check_button_pressed(step.button)
                break
        }
		
        if (actionPerformed) {
            stepPage++
            if (stepPage >= step.pages) {
                stepPage = 0
                moved = 0
                state = TutorialState.EXECUTE
            }
            dialogNextPage()
        }
    break
	
    case TutorialState.EXECUTE:
        switch (step.action) {
            case "move":
                objPlayer.x += step.dx * moveSpeed
                objPlayer.y += step.dy * moveSpeed
                moved += moveSpeed;
                if (moved >= moveDistance) {
                    currentStep++
                    state = TutorialState.SHOW
                }
            break

            case "mouse":
                objPlayer.state = PlayerState.GAME_RUNNING
                instance_destroy()
            break;
        }
    break;
}

var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)
isOnSkipBtn = point_in_rectangle(
						mx,
						my, 
						xBtn - btnWidth/2, 
						yBtn - btnHeight/2, 
						xBtn + btnWidth/2, 
						yBtn + btnHeight/2
					)
if (isOnSkipBtn) {
	if (mouse_check_button_pressed(mb_left)) {
		objPlayer.state = PlayerState.GAME_RUNNING
		instance_destroy()
	}
}