/// @description menu
draw_set_font(fntMenu)

var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)

var yMargin = 10;
var guiHalfWidth = display_get_gui_width()/2
var guiHalfHeight = display_get_gui_height()/2

var buttonWidth = sprite_get_width(sprButton)
var buttonHalfWidth = buttonWidth / 2
var buttonHeight = sprite_get_height(sprButton)
var buttonHalfHeight = buttonHeight / 2

var yButtonStartPosition = guiHalfHeight - yMargin - buttonHeight

for (var i = 0; i < numOptions; i++) {
    var yButtonPosition = yButtonStartPosition + (i * (yMargin + buttonHeight))
    draw_sprite_ext(sprButton, 0, guiHalfWidth, yButtonPosition, 1, 1, 0, -1, 1)

    var xStr = guiHalfWidth- (string_width(options[i]) / 2)
    var yStr = yButtonPosition - (string_height(options[i]) / 2)

    // escreve a opcao
    draw_text(xStr, yStr, options[i])

    if (point_in_rectangle(mouse_x, mouse_y, guiHalfWidth - buttonHalfWidth,  yButtonPosition - buttonHalfHeight, guiHalfWidth + buttonHalfWidth, yButtonPosition + buttonHalfHeight)) {
        // se selecionado, verifica se foi pressionado
        selectedOption = i
        if (mouse_check_button_pressed(mb_left)) {
            scrMenuSelection(selectedOption)
        }
    }

    if (keyboard_check_pressed(vk_enter))
        scrMenuSelection(selectedOption)

    if (selectedOption == i) {
        draw_set_color(c_white)
        draw_set_alpha(.5)
        draw_rectangle(guiHalfWidth - buttonHalfWidth,  yButtonPosition - buttonHalfHeight, guiHalfWidth + buttonHalfWidth, yButtonPosition + buttonHalfHeight, false)
        draw_set_color(c_black)
        draw_set_alpha(1)
    }
}

draw_set_font(-1)