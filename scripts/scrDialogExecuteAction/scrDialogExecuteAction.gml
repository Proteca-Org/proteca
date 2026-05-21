function scrDialogExecuteAction(){
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