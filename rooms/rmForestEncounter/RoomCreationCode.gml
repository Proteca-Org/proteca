if (!variable_struct_exists(global.cutscenesPlayed, "floresta_encontro")) {
    global.cutscenesPlayed[$ "floresta_encontro"] = true;
    scrCutsceneRun(scrCutsceneDefinitions("floresta_encontro"));
}
