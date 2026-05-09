/// @description Altera a opção de pausa selecionada a partir do teclado
// Se o jogo está pausado, a opção do menu de pausa não pode ser alterada
if (!global.pause)
	exit

// Se o jogo está pausado, altera a opção selecionada
selectedOption++;
if (selectedOption >= numOptions)
	selectedOption = 0;
