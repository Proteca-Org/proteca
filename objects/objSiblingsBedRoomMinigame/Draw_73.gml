if (state == MinigameState.STARTSCREEN) {		
	
	drawMinigameScreenDim(0.6, room_width, room_height)
	drawFrameScale(guiSprX, guiSprY, frameScaleX, frameScaleY)
	drawMinigameText(text1, fntMinigameSmall, guiSprX, guiSprY - 50, 50, 200, true)
	draw_sprite_ext(sprButtonPlay, 0, guiPlayButtonX, guiPlayButtonY, frameScaleY, frameScaleY, 0, c_white, 1)
	 
} else if(state == MinigameState.PLAYING) {	
	
	drawMinigameScreenDim(0.6, room_width, room_height)
	drawFrameScale(guiSprX, guiSprY, frameScaleX + 0.25, frameScaleY)
	drawMinigameText(text2, fntMinigameSmall, guiSprX, guiSprY - 120, 25, 250, true)	
	with(minigameObjects[0]) {
		draw_self()
	}
	with(clothesBin) {
		draw_self()
		drawMinigameText(strRotulo, fntMinigameVerySmall, x, y + (sprite_get_height(sprBin)*0.4)/2 + 3, 15, 200, true)
	}
	with(trashBin) {
		draw_self()
		drawMinigameText(strRotulo, fntMinigameVerySmall, x, y + (sprite_get_height(sprBin)*0.4)/2 + 3, 15, 200, true)
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