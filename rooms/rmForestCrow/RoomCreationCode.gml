if (!variable_struct_exists(global.cutscenesPlayed, "floresta_corvo")) {
    global.cutscenesPlayed[$ "floresta_corvo"] = true;
    scrCutsceneRun(scrCutsceneDefinitions("floresta_corvo"));
}
