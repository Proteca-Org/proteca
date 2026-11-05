if (!variable_struct_exists(global.cutscenesPlayed, "floresta_chegada")) {
    global.cutscenesPlayed[$ "floresta_chegada"] = true;
    scrCutsceneRun(scrCutsceneDefinitions("floresta_chegada"));
}
