// Garante que o vilao comeca invisivel (a cutscene o revela na transformacao),
// independente da visibilidade definida no editor.
if (instance_exists(objVillain)) objVillain.visible = false;

if (!variable_struct_exists(global.cutscenesPlayed, "floresta_cavalo2")) {
    global.cutscenesPlayed[$ "floresta_cavalo2"] = true;
    scrCutsceneRun(scrCutsceneDefinitions("floresta_cavalo2"));
}
