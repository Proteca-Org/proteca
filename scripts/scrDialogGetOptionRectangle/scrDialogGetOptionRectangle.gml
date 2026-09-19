function scrDialogGetOptionRectangle(_idx){
	var optionCount = array_length(currentNodeData.options)
	var optionSlot = optionHeight + optionMargin

	if (objectName == "GenderSelect") {
		// bloco de opções centralizado na tela, com espaço acima para a pergunta
		var blockWidth = min(520, guiWidth - 64)
		var blockTop = (guiHeight / 2) - ((optionCount * optionSlot) / 2) + 40

		return {
			_x : (guiWidth - blockWidth) / 2,
			_y : blockTop + (_idx * optionSlot),
			_width : blockWidth,
			_height : optionHeight
		}
	}

	var xRectangle = 0
	var yRectangle = guiHeight - 200

	var optionRectangle = {
		_x : xRectangle + 32,
		_y : yRectangle - ((optionCount - _idx) * optionSlot) - 20,
		_width : guiWidth - 64,
		_height : optionHeight
	}

	return optionRectangle
}