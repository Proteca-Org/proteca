/*
	Minigame: colocar cada um dos 9 itens em seu respectivo cesto
	-> Cesto lixo: applePie, chips, donnut, soda
	-> Cesto de roupa: shirt, bluePants, shorts, sock, panties
	
	Obs: o minigame deve ser iniciado por uma cutscene, quando esta estiver pronta,
	então por enquanto ele se inicia ao clicar em algum dos objetos envovlidos
*/

// O minigame vai criar os objetos necessários e alterar a visibilidade
// das sprites do cenário ao final do minigame
minigameItensPositionsAndScale = [[112, 248, 0.4], [182, 135, 0.4], [517, 185, 0.35], [463, 140, 0.35], [244, 209, 0.4], [256, 294, 0.4], [412, 249, 0.4], [555, 218, 0.3], [520, 299, 0.45]];
minigameSprites = [sprApplePie, sprChips, sprDonnut, sprSoda, sprShirt, sprBluePants, sprShorts, sprSock, sprPanties]
minigameObjects = [objApplePie, objChips, objDonnut, objSoda, objShirt, objBluePants, objShorts, objSock, objPanties];
spritesIds = [];

// No create event, gera as sprites no cenário
var correctLayer = layer_get_id("Assets");
for( var i=0; i<array_length(minigameSprites); i++) {
	spritesIds[i] = layer_sprite_create(correctLayer, minigameItensPositionsAndScale[i][0], minigameItensPositionsAndScale[i][1], minigameSprites[i]);
	layer_sprite_xscale(spritesIds[i], minigameItensPositionsAndScale[i][2]);
	layer_sprite_yscale(spritesIds[i], minigameItensPositionsAndScale[i][2]);
}

// Verifica se os sprites estão presentes
//for( var i=0; i<array_length(minigameSprites); i++) {
//	if(!sprite_exists(minigameSprites[i])) {
for( var i=0; i<array_length(spritesIds); i++) {
	if(!sprite_exists(spritesIds[i])) {
		show_debug_message("Sprite " + string(minigameSprites[i]) + " não encontrado");
	}
	else {
		//draw_sprite(spritesIds[i], 0, minigameItensPositionsAndScale[i][0], minigameItensPositionsAndScale[i][1]);
	}
}
