function scrDialogInitialize(){
	var unwrapped = scrDialogUnwrap(scrGetDialogs(objectName))
	dialogSpeaker = unwrapped.speaker
	dialogData = unwrapped.data

	isBranching = is_struct(dialogData)

	if (isBranching) {
		currentNodeData = dialogData[$ currentNodeKey]
	}
	
	initialized = true
	global.dialog = true
}