if (!initialized) {
	scrDialogInitialize()
}

scrDialogHandleInput()

if (isBranching && variable_struct_exists(currentNodeData, "options")) {
	var options = currentNodeData.options
	var mouseGuiX = device_mouse_x_to_gui(0)
	var mouseGuiY = device_mouse_y_to_gui(0)
	hoveredOption = -1
	
	for (var i = 0; i < array_length(options); i++) {
		var option = options[i]
		var optionRectangle = scrDialogGetOptionRectangle(i)
		var x1 = optionRectangle._x
		var y1 = optionRectangle._y
		var x2 = optionRectangle._x + optionRectangle._width
		var y2 = optionRectangle._y + optionRectangle._height
		
		if (point_in_rectangle(mouseGuiX, mouseGuiY, x1, y1, x2, y2)) {
			hoveredOption = i
			if (mouse_check_button_pressed(mb_left)) {
				currentNodeKey = option.next
				currentNodeData = dialogData[$ currentNodeKey]
			}
			break
		}
	}
}