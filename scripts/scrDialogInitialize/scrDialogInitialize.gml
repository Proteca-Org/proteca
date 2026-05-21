function scrDialogInitialize(){
	dialogData = scrGetDialogs(objectName)
	isBranching = is_struct(dialogData)
	
	if (isBranching) {
		currentNodeData = dialogData[$ currentNodeKey]
	}
	
	initialized = true
	global.dialog = true
}