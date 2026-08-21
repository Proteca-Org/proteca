function scrDialogExecuteAction(){
    if (!variable_struct_exists(currentNodeData, "action")) {
        return;
    }

    if (currentNodeData.action == "teleport") {
        var targetRoom = asset_get_index(currentNodeData.target);
        var newRoomStartPosition = variable_struct_get(currentNodeData, "target_position");

        if (targetRoom != -1 && !instance_exists(objFade)) {
            var fade = instance_create_depth(0, 0, -9999, objFade);
            fade.target_room = targetRoom;

	        if (is_struct(newRoomStartPosition)) {
		        fade.target_x = newRoomStartPosition.x;
		        fade.target_y = newRoomStartPosition.y;
		    } else {
		        fade.target_x = 0;
		        fade.target_y = 0;
		    }
		}
        
    }

    if (currentNodeData.action == "advance_room") {
        room_goto_next();
    }

    if (currentNodeData.action == "run_cutscene") {
        var queue = scrCutsceneDefinitions(currentNodeData.cutscene_id);
        scrCutsceneRun(queue);
    }

    if (currentNodeData.action == "delete_inventory_item") {
        global.inventory.deleteItem(global.pendingDeleteSlot);
        global.pendingDeleteSlot = -1;
    }
}