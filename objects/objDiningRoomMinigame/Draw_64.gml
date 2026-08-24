if (state == MinigameState.STARTSCREEN) {
	drawMinigameScreenDim(0.6, guiW, guiH)
	drawMinigameFrame(guiSprX, guiSprY)
	drawMinigameText(text1_1, fntMinigameBig, guiSprX, guiSprY - 150, 40, 300, true)
	drawMinigameText(text1_2, fntMinigameMedium, guiSprX, guiSprY + 10, 40, 300, true)
	if (drawMinigameSpriteButton(sprButtonPlay, guiPlayButtonX, guiPlayButtonY)) {
		state = MinigameState.PLAYING
	}	

} else if (state == MinigameState.PLAYING) {
	// Ordem desenho prato -> ovo -> folhas salada -> repolho -> tomate -> carne -> colher
	currentFood = undefined
	drawMinigameScreenDim(0.6, guiW, guiH)
	draw_sprite_ext(sprDish, 0, guiSprX, guiSprY + 50, itensScale, itensScale, 0, c_white, 1)
	if (!eatenFoods[foodIndexes.friedEgg]) {
		if (drawMinigameSpriteButtonExt(sprFriedEgg, 0, guiSprX + 110, guiSprY + 45, itensScale, itensScale, 0, c_white, 1)) {
			show_debug_message("Cliquei no ovo")
			
			currentFood = foodIndexes.friedEgg
			//eatenFoods[foodIndexes.friedEgg] = true
			//leftFoods--
		}
	}
	if (!eatenFoods[foodIndexes.lettuceLeaf]) {
		if (drawMinigameSpriteButtonExt(sprLettuceLeaf, 0, guiSprX + 25, guiSprY + 70, itensScale, itensScale, 0, c_white, 1)) {
			show_debug_message("Cliquei no repolho")
			
			currentFood = foodIndexes.lettuceLeaf
			//eatenFoods[foodIndexes.lettuceLeaf] = true
			//leftFoods--
		}
	}
	if (!eatenFoods[foodIndexes.saladLeaves]) {
		if (drawMinigameSpriteButtonExt(sprSaladLeaves, 0, guiSprX - 35, guiSprY + 65, itensScale, itensScale, 0, c_white, 1)) {
			show_debug_message("Cliquei nas folhas da salada")
			
			currentFood = foodIndexes.saladLeaves
			//eatenFoods[foodIndexes.saladLeaves] = true
			//leftFoods--
		}
	}
	if (!eatenFoods[foodIndexes.slicedTomato]) {
		if (drawMinigameSpriteButtonExt(sprSlicedTomato, 0, guiSprX + 45, guiSprY + 95, itensScale, itensScale, 0, c_white, 1)) {
			show_debug_message("Cliquei no tomate")
			
			currentFood = foodIndexes.slicedTomato
			//eatenFoods[foodIndexes.slicedTomato] = true
			//leftFoods--
		}
	}
	if (!eatenFoods[foodIndexes.steak]) {
		if (drawMinigameSpriteButtonExt(sprSteak, 0, guiSprX - 115, guiSprY + 45, itensScale, itensScale, 0, c_white, 1)) {
			show_debug_message("Cliquei no bife")
			
			currentFood = foodIndexes.steak
			//eatenFoods[foodIndexes.steak] = true
			//leftFoods--
		}
	}
	if (currentFood != undefined) {
		eatenFoods[currentFood] = true
		leftFoods--
	}
	draw_sprite_ext(sprWoodenSpoon, 0, guiSprX + (sprite_get_width(sprDish)/2)*itensScale + 45, guiSprY + 30, itensScale, itensScale, 0, c_white, 1)

} else if (state == MinigameState.END) {
	
	drawMinigameScreenDim(0.6, guiW, guiH)
	drawMinigameFrame(guiSprX, guiSprY)
	drawMinigameText(text2_1, fntMinigameBig, guiSprX, guiSprY - 130, 40, 300, true)
	drawMinigameText(text2_2, fntMinigameMedium, guiSprX, guiSprY + 10, 40, 300, true)
	
}