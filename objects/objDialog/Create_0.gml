objectName = "";
dialogData = undefined;
text[0] = "";

page = 0;
initialized = false;
global.dialog = false;

isBranching = false;
currentNodeKey = "inicio"; 
currentNodeData = undefined;
optionHeight = 40;
optionMargin = 10;
hoveredOption = -1 // Para saber qual opção está com o mouse em cima na hora de desenhar
guiWidth = display_get_gui_width()
guiHeight = display_get_gui_height()

global.newRoomStartPosition = undefined

// Essas funções podem estar em arquivos de script em uma pasta que mexem somente com diálogos
function dialogInitialize() {
	dialogData = scrGetDialogs(objectName)
	isBranching = is_struct(dialogData)
	
	if (isBranching) {
		currentNodeData = dialogData[$ currentNodeKey]
	}
	
	initialized = true
	global.dialog = true
}

function dialogHandleInput() {
	if (!mouse_check_button_pressed(mb_left)) {
		return
	}
	
	if (isBranching) {
		dialogBranchingNext()
	} else {
		dialogLinearNext()
	}
}

function dialogBranchingNext() {
	if (variable_struct_exists(currentNodeData, "options")) {
		return
	}
	
	dialogExecuteAction()
	dialogClose()
}

function dialogLinearNext() {
	if (page < array_length(dialogData) - 1) {
		page++
		return
	}
	dialogClose()
}

function dialogExecuteAction() {
	if (!variable_struct_exists(currentNodeData, "action")) {
		return;
	}
	
	// por enquanto só temos teleporte
	if (currentNodeData.action == "teleport") {
		var targetRoom = asset_get_index(currentNodeData.target)
		var newRoomStartPosition = variable_struct_get(currentNodeData, "target_position")
		
		if (newRoomStartPosition != undefined) {
			global.newRoomStartPosition = newRoomStartPosition
		}

		if (targetRoom != -1) {
			room_goto(targetRoom)
		}
	}
}

function dialogClose() {
	instance_destroy()
	global.dialog = false
}

function dialogGetOptionRectangle(_idx) {
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

function dialogDrawTextRectangle() {
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

function dialogDrawOptions() {
	if (isBranching && variable_struct_exists(currentNodeData, "options")) {
		var options = currentNodeData.options
		for (var i = 0; i < array_length(options); i++) {
			var optionRectangle = dialogGetOptionRectangle(i)
			
			draw_set_color(i == hoveredOption ? c_gray : c_dkgray)
			draw_rectangle(	
				optionRectangle._x,
				optionRectangle._y, 
				optionRectangle._x + optionRectangle._width,
				optionRectangle._y + optionRectangle._height,
				false
			)
			draw_set_colour(c_white)
			draw_text(optionRectangle._x + 10, optionRectangle._y + 10, options[i].label)
		}
	}
}