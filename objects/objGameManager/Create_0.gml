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

// gênero do protagonista e do irmão/irmã/irmane — "M" | "F" | "N"
// sobrescritos ao passar pela room rmGenderSelect
global.playerGender  = "M";
global.siblingGender = "M";


instance_create_depth(0, 0, 0, objCutsceneController);
