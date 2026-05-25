function scrDialogGetOptionRectangle(_idx){
	var xRectangle = 0
	var yRectangle = guiHeight - 200
	
	var optionRectangle = {
		_x : xRectangle + 32,
		_y : yRectangle - ((array_length(currentNodeData.options) - _idx) * (optionHeight + optionMargin)) - 20,
		_width : guiWidth - 64,
		_height : optionHeight
	}
	
	return optionRectangle
}