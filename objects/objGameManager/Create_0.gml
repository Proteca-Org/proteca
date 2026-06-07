enum gameState {
    INTRODUCTION,
    TUTORIAL,
    GAME_RUNNING
}

global.state  = gameState.INTRODUCTION;
global.pause  = false;
global.dialog = false;
global.dialogsLoaded = false;
global.dialogs = {};

// flags de história
global.encontrouPapel    = false;
global.paperPassword     = "";