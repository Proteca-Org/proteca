draw_texture_flush();
window_set_size(1280, 720);
gpu_set_texfilter(false);

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
global.dialogs = {};
global.dialogConsumedClick = false;
global.cutscene = false;
global.cutscenesPlayed = {};

// flags de história
global.encontrouPapel    = false;
global.paperPassword     = "";

instance_create_depth(0, 0, 0, objCutsceneController);
