if (!variable_struct_exists(global.cutscenesPlayed, "floresta_cavalo1")) {
    global.cutscenesPlayed[$ "floresta_cavalo1"] = true;
    scrCutsceneRun(scrCutsceneDefinitions("floresta_cavalo1"));
}
