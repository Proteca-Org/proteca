enum TutorialState {
	SHOW,
	EXECUTE,
}

state = TutorialState.SHOW;
currentStep = 0;	
moveSpeed = 2;
moved = 0;			// Quanto já andou
moveDistance = 150; // distância máxima para andar
x = display_get_gui_width()/2
y = display_get_gui_height()/2 - sprite_get_height(sprLeftArrow)/2

stepPage = 0
page = 0
tutorialDialog = scrDialogUnwrap(scrGetDialogs("Tutorial"))
dialogSpeaker = tutorialDialog.speaker
dialogData = tutorialDialog.data
guiWidth = display_get_gui_width()
guiHeight = display_get_gui_height()

margin = 20
btnWidth = sprite_get_width(sprSkipTutorialButton)
btnHeight = sprite_get_height(sprSkipTutorialButton)
xBtn = guiWidth - btnWidth / 2 - margin
yBtn = guiHeight - btnHeight / 2 - margin
isOnSkipBtn = false

drawDialogTextRectangle = function() {
	var xRectangle = 0;
	var yRectangle = guiHeight - 200
	var colorRectangle = c_black
	
	draw_set_font(fntDialog)
	draw_set_color(colorRectangle)
	draw_set_alpha(0.8);
	draw_rectangle(xRectangle, yRectangle, guiWidth, guiHeight, false)
	draw_set_alpha(1);
	draw_set_color(c_white)
	
	var entry = scrDialogResolveEntry(dialogData[page], dialogSpeaker)

	var textY = yRectangle + 32
	if (entry.speaker != "") {
		draw_set_color(c_yellow)
		draw_text(xRectangle + 32, yRectangle + 16, entry.speaker)
		draw_set_color(c_white)
		textY = yRectangle + 52
	}

	draw_text_ext(xRectangle + 32, textY, entry.text, 32, guiWidth - 64)
}

drawSkipTutorialBtn = function() {
    var alpha = 1;
    if (isOnSkipBtn) {
        alpha = 0.7;
    }
    draw_sprite_ext(sprSkipTutorialButton, 0, xBtn, yBtn, 1, 1, 0, c_white, alpha)
}

dialogNextPage = function() {
	if (page == array_length(dialogData)) {
		return
	}
	page++
}

steps = [
    {
        action: "move",
        key: vk_left,
        sprite: sprLeftArrow,
        dx: -1,
        dy: 0,
		pages: 1
    },
    {
        action: "move",
        key: vk_right,
        sprite: sprRightArrow,
        dx: 1,
        dy: 0,
		pages: 1
    },
	{
        action: "move",
        key: vk_down,
        sprite: sprDownArrow,
        dx: 0,
        dy: 1,
		pages: 1,
    },
    {
        action: "move",
        key: vk_up,
        sprite: sprUpArrow,
        dx: 0,
        dy: -1,
		pages: 1
    },
    {
        action: "mouse",
        button: mb_left,
        sprite: sprMouse,
		pages: 2
    }
]