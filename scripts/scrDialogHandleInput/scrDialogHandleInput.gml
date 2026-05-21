function scrDialogHandleInput(){
	if (!mouse_check_button_pressed(mb_left)) {
		return
	}
	
	if (isBranching) {
		scrDialogBranchingNext()
	} else {
		scrDialogLinearNext()
	}
}