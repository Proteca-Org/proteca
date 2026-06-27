function scrCutsceneRun(queue) {
    with (objCutsceneController) {
        self.queue      = queue;
        self.stepIndex  = 0;
        self.waitTimer  = 0;
        self.fadeCreated = false;
        self.active     = true;
    }
}