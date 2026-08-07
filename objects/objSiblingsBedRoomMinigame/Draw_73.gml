if (state == MinigameState.STARTSCREEN) {		
	//draw_sprite(sprFrameMiniGame, 0, guiSprX, guiSprY)
	//drawText(text1, fntMinigameBig, guiSprX, guiSprY - 100, 50, 300, true)	
	drawScreenDim(0.6, room_width, room_height)
	drawFrameScale(guiSprX, guiSprY, frameScaleX, frameScaleY)
	drawText(text1, fntMinigameSmall, guiSprX, guiSprY - 50, 50, 200, true)
	draw_sprite_ext(sprButtonPlay, 0, guiSprX - 5, guiSprY + 100, frameScaleY, frameScaleY, 0, c_white, 1)
	 
} else if(state == MinigameState.PLAYING) {	
	//draw_sprite(sprFrameMiniGame, 0, guiSprX, guiSprY)
	//drawText(text2, fntMinigameSmall, guiSprX, guiSprY - 150, 30, 280, true)
	drawScreenDim(0.6, room_width, room_height)
	drawFrameScale(guiSprX, guiSprY, frameScaleX + 0.25, frameScaleY)
	drawText(text2, fntMinigameSmall, guiSprX, guiSprY - 120, 25, 250, true)
	
	with(minigameObjects[0]) {
		draw_self()
	}
	with(clothesBin) {
		draw_self()
		drawText(strRotulo, fntMinigameVerySmall, x, y + (sprite_get_height(sprBin)*0.4)/2 + 3, 15, 200, true)
	}
	with(trashBin) {
		draw_self()
		drawText(strRotulo, fntMinigameVerySmall, x, y + (sprite_get_height(sprBin)*0.4)/2 + 3, 15, 200, true)
	}
	
}