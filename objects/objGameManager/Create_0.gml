enum gameState {
    INTRODUCTION,
    TUTORIAL,
	PUZZLE,
    GAME_RUNNING
}

global.state  = gameState.INTRODUCTION;
global.pause  = false;
global.dialog = false;
global.dialogsLoaded = false;
global.cutscene = false;
global.dialogs = {};

// flags de história
global.encontrouPapel    = false;
global.paperPassword     = "";

instance_create_depth(0, 0, 0, objCutsceneController);
if (!variable_global_exists("horseEscaped")) {
    global.horseEscaped = false;
}