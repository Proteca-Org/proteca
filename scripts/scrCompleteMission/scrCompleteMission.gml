function scrCompleteMission(flag) {
    if (!variable_global_exists("missions") || !variable_global_exists("current_mission")) {
        exit;
    }

    var _curr = global.current_mission;
    var _len = array_length(global.missions);

    if (_curr < _len) {
        if (global.missions[_curr].flag == flag) {
            global.missions[_curr].done = true;
            global.current_mission++;
        }
    }
}