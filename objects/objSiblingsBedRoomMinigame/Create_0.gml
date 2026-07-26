/*
	Minigame: colocar cada um dos 9 itens em seu respectivo cesto
	-> Cesto lixo: applePie, chips, donnut, soda
	-> Cesto de roupa: shirt, bluePants, shorts, sock, panties
	
	Obs: o minigame deve ser iniciado por uma cutscene, quando esta estiver pronta,
	então por enquanto ele se inicia ao clicar em algum dos objetos envovlidos
*/

enum MinigameState {
	IDLE,
	INITIALIZATION,
	START,
	PLAYING,
	DONE,
	END
}

state = MinigameState.IDLE;
global.quartoArrumado = false;

// O minigame vai criar os objetos necessários e alterar a visibilidade
// das sprites do cenário ao final do minigame
minigameItensPositionsAndScale = [[112, 248, 0.4], [182, 135, 0.4], [517, 185, 0.35], [463, 140, 0.35], [244, 209, 0.4], [256, 294, 0.4], [412, 249, 0.4], [555, 218, 0.3], [520, 299, 0.45]];
minigameObjects = [objApplePie, objChips, objDonnut, objSoda, objShirt, objBluePants, objShorts, objSock, objPanties];

// No create event, gera os objetos do minigame
for( var i=0; i<array_length(minigameObjects); i++) {
	var objId = instance_create_layer(minigameItensPositionsAndScale[i][0], minigameItensPositionsAndScale[i][1], "Instances", minigameObjects[i]);
	objId.image_xscale = minigameItensPositionsAndScale[i][2];
	objId.image_yscale = minigameItensPositionsAndScale[i][2];
}

// Desativa os objetos até que o minigame comece
for( var i=0; i< array_length(minigameObjects); i++) {
	instance_deactivate_object(minigameObjects[i]);
}
