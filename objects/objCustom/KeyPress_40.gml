/// @description Muda selecao dentro de um menu

if (currentMenu == 0) { 
	
	selectedPart++;
	if (selectedPart >= numFeatures)	
		selectedPart = 0;
		
} else { // lida com a opção selecionada no atributo atual
	
	selectedFeature[selectedPart]++;
	if (selectedFeature[selectedPart] >= array_length(feature[selectedPart]))
		selectedFeature[selectedPart] = 0;

}