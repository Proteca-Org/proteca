if (currentAlpha > 0.0) {
	drawScreenDim()
}

if (state == PuzzleState.MENU) {
	
	draw_sprite(sprFrameMiniGame, 0, spriteX, spriteY)
	drawText(text1, fntMinigameBig, spriteX, spriteY - 100, 50, 300, true)
	drawText(text2, fntMinigameSmall, spriteX, spriteY + 50, 30, 280, true)
	draw_sprite(sprButtonPlay, 0, playButtonX, playButtonY)
	//draw_rectangle(playBtnRect.x1, playBtnRect.y1, playBtnRect.x2, playBtnRect.y2, true)
	
} else if (state == PuzzleState.PLAYING) {
	
	draw_sprite_ext(sprChest, 0, spriteX, spriteY, 2.5, 2.5, 0, c_white, 1)
    draw_sprite_ext(sprPadlockClosed, 0, spriteX + shakeX, spriteY + 50 + shakeY, 4, 4, shakeAngle, c_white, 1)
    //draw_rectangle(padlockRect.x1, padlockRect.y1, padlockRect.x2, padlockRect.y2, true)
	
} else if (state == PuzzleState.DONE) {
	
	draw_sprite_ext(sprChest, 0, spriteX, spriteY, 2.5, 2.5, 0, c_white, 1)
	if (padlockStartAnimation) {
        var finalY = spriteY + 50 + padlockFallY
        draw_sprite_ext(sprPadlockOpen, 0, spriteX, finalY, 4, 4, padlockAngle, c_white, 1)
    } else if(padlockDoneDelay == 0) {
		draw_sprite(sprFrameMiniGame, 0, spriteX, spriteY)
		drawText(text3, fntMinigameBig, spriteX, spriteY, 50, 300, true)
	}
}