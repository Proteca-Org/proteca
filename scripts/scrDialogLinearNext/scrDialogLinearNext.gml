function scrDialogLinearNext(){
	if (page < array_length(dialogData) - 1) {
		page++
		
		if (is_struct(dialogData[page])) {
            currentSpeechText = dialogData[page].text;
        }
		
		return
	}
	
	scrDialogClose()
}