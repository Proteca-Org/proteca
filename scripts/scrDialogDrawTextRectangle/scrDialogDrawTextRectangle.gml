function scrDialogDrawTextRectangle(){
	var xRectangle = 0;
	var yRectangle = guiHeight - 200
	var colorRectangle = c_black
	
	draw_set_font(fntDialog)
	draw_set_color(colorRectangle)
	draw_set_alpha(0.8);
	draw_rectangle(xRectangle, yRectangle, guiWidth, guiHeight, false)
	draw_set_alpha(1);
	draw_set_color(c_white)
	
	var textToDraw = ""
	if (!isBranching) {
		if (is_array(dialogData)) {
			textToDraw = dialogData[page]
		}
	} else {
	    if (variable_struct_exists(currentNodeData, "text")) {
	        textToDraw = currentNodeData.text
	    }
	}
	draw_text_ext(xRectangle + 32, yRectangle + 32, textToDraw, 32, guiWidth - 64)
}