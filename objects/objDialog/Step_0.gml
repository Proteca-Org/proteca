if (initialized == false) {
    dialogData = scrGetDialogs(objectName);
    

    if (is_array(dialogData)) {
        isBranching = false;
    } else if (is_struct(dialogData)) {
        isBranching = true;
        currentNodeKey = "inicio"; 
        currentNodeData = dialogData[$ currentNodeKey];
    }
    
    initialized = true;
    global.dialog = true;
}

if (mouse_check_button_pressed(mb_left)) {
    

    if (!isBranching) {
        if (page < array_length(dialogData) - 1) {
            page++;
        } else {
            instance_destroy();
            global.dialog = false;
        }
    } 

    else {

        if (!variable_struct_exists(currentNodeData, "options")) {
            
            if (variable_struct_exists(currentNodeData, "action")) {
                if (currentNodeData.action == "teleport") {
                    var targetRoom = asset_get_index(currentNodeData.target);
                    if (targetRoom != -1) room_goto(targetRoom);
                }
            }
            
            instance_destroy();
            global.dialog = false;
        }
    }
}

