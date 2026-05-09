function scrCustomDone(selectedFeature){
	var playerInstance 
	
	if (instance_number(objPlayer) == 0) {
		playerInstance = instance_create_layer(0, 0, "Instances", objPlayer)
	} else {
		playerInstance = instance_find(objPlayer, 0)
	}
	
	playerInstance.x = x
	playerInstance.y = y
	playerInstance.hair = selectedFeature[0]
	playerInstance.blouse = selectedFeature[1]
	playerInstance.pants = selectedFeature[2]
	playerInstance.shoes = selectedFeature[3]
	playerInstance.accessory = selectedFeature[4]
	
	room_goto_next()
	instance_destroy()	
}