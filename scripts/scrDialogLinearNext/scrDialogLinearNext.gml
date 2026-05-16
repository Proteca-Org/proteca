function scrDialogLinearNext(){
	if (page < array_length(dialogData) - 1) {
		page++
		return
	}
	scrDialogClose()
}