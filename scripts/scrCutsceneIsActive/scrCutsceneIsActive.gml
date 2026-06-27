function scrCutsceneIsActive() {
    if (!instance_exists(objCutsceneController)) {
        return false;
    }
    return objCutsceneController.active;
}