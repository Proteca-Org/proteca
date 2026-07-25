if (!active) {
    exit;
}

if (array_length(queue) == 0) {
    active = false;
    global.cutscene = false;
    stepIndex = 0;
    exit;
}

var step = queue[stepIndex];

if (step.action == "lock_input") {
    global.cutscene = true;
    stepIndex++;

} else if (step.action == "unlock_input") {
    global.cutscene = false;
    stepIndex++;

} else if (step.action == "wait") {
    if (waitTimer == 0) {
        waitTimer = step.duration;
    }
    waitTimer--;
    if (waitTimer <= 0) {
        waitTimer = 0;
        stepIndex++;
    }

} else if (step.action == "teleport") {
    if (!fadeCreated) {
        var targetRoom = asset_get_index(step.target);
        var pos = variable_struct_get(step, "target_position");

        var fade = instance_create_depth(0, 0, -9999, objFade);
        fade.target_room = targetRoom;

        if (is_struct(pos)) {
            fade.target_x = pos.x;
            fade.target_y = pos.y;
        } else {
            fade.target_x = 0;
            fade.target_y = 0;
        }

        fadeCreated = true;
    }

    if (!instance_exists(objFade)) {
        fadeCreated = false;
        stepIndex++;
    }

} else if (step.action == "move") {
    if (!moveInitialized) {
        moveTimer = step.duration;
        moveInitialized = true;
        step.target.targetX += step.direction * step.speed * step.duration;

        if (variable_struct_exists(step, "direction")) {
            step.target.image_xscale = sign(step.direction);
        }
    }

    moveTimer--;
    if (moveTimer <= 0) {
        moveInitialized = false;
        stepIndex++;
    }
}

if (stepIndex >= array_length(queue)) {
    active         = false;
    global.cutscene = false;
    queue          = [];
    stepIndex      = 0;
}