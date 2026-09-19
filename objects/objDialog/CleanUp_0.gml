if (objectName == "Introducao") {
	global.state = gameState.TUTORIAL
}

if (objectName == "GenderSelect" && instance_exists(objPlayer)) {
	objPlayer.visible = true
}