if(isClothesBin == true) {
	if(other.isCloth == true) {		
	}
	else {
		objSiblingsBedRoomMinigame.minigameCorrectiness = false
	}
}
else {
	if(other.isCloth == true) {
		objSiblingsBedRoomMinigame.minigameCorrectiness = false
	}
	else {
	}
	
}
objSiblingsBedRoomMinigame.objCount -= 1
instance_destroy(other.id)