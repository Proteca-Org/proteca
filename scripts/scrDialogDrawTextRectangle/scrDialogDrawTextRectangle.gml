function scrDialogDrawTextRectangle(){
	var isFullScreen = (objectName == "GenderSelect")
	var xRectangle = 0;
	var yRectangle = isFullScreen ? 0 : guiHeight - 200
	var colorRectangle = c_black

	draw_set_font(fntDialog)
	draw_set_color(colorRectangle)
	draw_set_alpha(isFullScreen ? 1 : 0.8);
	draw_rectangle(xRectangle, yRectangle, guiWidth, guiHeight, false)
	draw_set_alpha(1);
	draw_set_color(c_white)

	var entry = { speaker : "", text : "" }
	if (!isBranching) {
		if (is_array(dialogData)) {
			entry = scrDialogResolveEntry(dialogData[page], dialogSpeaker)
		}
	} else {
		entry = scrDialogResolveEntry(currentNodeData, dialogSpeaker)
	}

	var speakerToDraw = entry.speaker
	var textToDraw = entry.text

	if (isFullScreen) {
		// pergunta ampliada e centralizada, logo acima do bloco de opções
		var textScale = 1.5
		var questionY = guiHeight / 2
		if (variable_struct_exists(currentNodeData, "options")) {
			questionY = scrDialogGetOptionRectangle(0)._y - 80
		}

		draw_set_halign(fa_center)
		draw_text_ext_transformed(guiWidth / 2, questionY, textToDraw, 40, (guiWidth - 120) / textScale, textScale, textScale, 0)
		draw_set_halign(fa_left)
		return
	}

	// locutor em destaque na primeira linha; a fala começa logo abaixo
	var textY = yRectangle + 32
	if (speakerToDraw != "") {
		draw_set_color(c_yellow)
		draw_text(xRectangle + 32, yRectangle + 16, speakerToDraw)
		draw_set_color(c_white)
		textY = yRectangle + 52
	}

	draw_text_ext(xRectangle + 32, textY, textToDraw, 32, guiWidth - 64)
}
