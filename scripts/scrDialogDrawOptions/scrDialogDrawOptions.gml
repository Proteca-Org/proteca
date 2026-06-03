function scrDialogDrawOptions(){
	if (isBranching && variable_struct_exists(currentNodeData, "options")) {
		var options = currentNodeData.options
		for (var i = 0; i < array_length(options); i++) {
			var optionRectangle = scrDialogGetOptionRectangle(i)
			
			draw_set_color(i == hoveredOption ? c_gray : c_dkgray)
			draw_rectangle(	
				optionRectangle._x,
				optionRectangle._y, 
				optionRectangle._x + optionRectangle._width,
				optionRectangle._y + optionRectangle._height,
				false
			)
			draw_set_color(c_white)
			draw_text(optionRectangle._x + 10, optionRectangle._y + 10, options[i].label)
		}
	}
}