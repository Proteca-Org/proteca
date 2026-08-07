if(isClothesBin == true) {
	if(other.isCloth == true) {
		show_debug_message("CERTO = {0} Colidi com a roupa {1}", strRotulo, string(other.id))
	}
	else {
		show_debug_message("ERRADO = {0} Colidi com o lixo {1}", strRotulo, string(other.id))
		objSiblingsBedRoomMinigame.minigameCorrectiness = false
	}
}
else {
	if(other.isCloth == true) {
		show_debug_message("ERRADO = {0} Colidi com a roupa {1}", strRotulo, string(other.id))
		objSiblingsBedRoomMinigame.minigameCorrectiness = false
	}
	else {
		show_debug_message("CERTO = {0} Colidi com o lixo {1}", strRotulo, string(other.id))
	}
	
}
objSiblingsBedRoomMinigame.objCount -= 1
instance_destroy(other.id)