if (variable_global_exists("plateClean") && global.plateClean == true
    && !variable_struct_exists(global.cutscenesPlayed, "cutscene_banheiro")) {
    global.cutscenesPlayed[$ "cutscene_banheiro"] = true;
    scrCutsceneRun(scrCutsceneDefinitions("cutscene_banheiro"));
}
