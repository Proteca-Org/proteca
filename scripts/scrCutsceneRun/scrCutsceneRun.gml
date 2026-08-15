function scrCutsceneRun(queue) {
    with (objCutsceneController) {
        if (instance_exists(objPlayer)) {
            objPlayer.velocity = 3;
        }
        self.queue       = queue;
        self.stepIndex   = 0;
        self.waitTimer   = 0;
        self.fadeCreated = false;
        self.active      = true;
    }
}