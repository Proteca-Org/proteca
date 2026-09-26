if (state == MinigameState.STARTSCREEN) {		
	
	drawMinigameScreenDim(0.6, room_width, room_height)
	drawFrameScale(guiSprX, guiSprY, frameScaleX, frameScaleY)
	drawMinigameText(text1, fntMinigameSmall, guiSprX, guiSprY - 50, 50, 200, true)
	draw_sprite_ext(sprButtonPlay, 0, guiPlayButtonX, guiPlayButtonY, frameScaleY, frameScaleY, 0, c_white, 1)
	 
} else if(state == MinigameState.PLAYING) {	
	
	drawMinigameScreenDim(0.6, room_width, room_height)
	drawFrameScale(guiSprX, guiSprY, frameScaleX + 0.25, frameScaleY)
	drawMinigameText(text2, fntMinigameSmall, guiSprX, guiSprY - 120, 25, 250, true)	
	
	// Cestos primeiro, para os itens ficarem por cima deles
	// descobre se há um item sendo arrastado e qual cesto está embaixo do ponteiro
	var anyDragging = false
	with(objClickableItensForMinigame) {
		if(isDragging) {
			anyDragging = true
		}
	}
	var hoverBin = noone
	if(anyDragging) {
		hoverBin = instance_position(device_mouse_x(0), device_mouse_y(0), objBin)
	}
	
	with(clothesBin) {
		image_blend = (id == hoverBin) ? c_yellow : c_white
		draw_self()
		drawMinigameText(strRotulo, fntMinigameVerySmall, x, y + (sprite_get_height(sprBin)*0.4)/2 + 3, 15, 200, true)
	}
	with(trashBin) {
		image_blend = (id == hoverBin) ? c_yellow : c_white
		draw_self()
		drawMinigameText(strRotulo, fntMinigameVerySmall, x, y + (sprite_get_height(sprBin)*0.4)/2 + 3, 15, 200, true)
	}	
	
	// Desenha os itens ordenados por stackOrder (o último a ser pego fica por cima)
	var items = []
	with(objClickableItensForMinigame) {
		array_push(items, id)
	}
	array_sort(items, function(a, b) { return a.stackOrder - b.stackOrder })
	for(var i=0; i<array_length(items); i++) {
		with(items[i]) {
			draw_self()
		}
	}
} else if(state == MinigameState.END) {
	if(minigameCorrectiness == false) {
		drawMinigameScreenDim(0.6, room_width, room_height)
		drawFrameScale(guiSprX, guiSprY, frameScaleX, frameScaleY)
		drawMinigameText(text3, fntMinigameSmall, guiSprX, guiSprY, 50, 200, true)
	}
	else {
		drawMinigameScreenDim(0.6, room_width, room_height)
		drawFrameScale(guiSprX, guiSprY, frameScaleX, frameScaleY)
		drawMinigameText(text4, fntMinigameSmall, guiSprX, guiSprY, 50, 200, true)
	}
}
