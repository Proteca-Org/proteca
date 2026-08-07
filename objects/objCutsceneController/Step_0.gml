if (!active) exit;

if (array_length(queue) == 0) {
    active = false;
    global.cutscene = false;
    stepIndex = 0;
    exit;
}

var step = queue[stepIndex];
if (scrCutsceneProcessStep(step)) {
    stepIndex++;
}

if (stepIndex >= array_length(queue)) {
    active          = false;
    global.cutscene = false;
    queue           = [];
    stepIndex       = 0;
}