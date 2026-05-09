var guiWidth = display_get_gui_width();
var guiHeight = display_get_gui_height();

var xRectangle = 0;
var yRectangle = guiHeight - 200;
var colorRectangle = c_black;

draw_set_font(fntDialog);


draw_set_color(colorRectangle);
draw_set_alpha(0.8);
draw_rectangle(xRectangle, yRectangle, guiWidth, guiHeight, false);
draw_set_alpha(1);
draw_set_color(c_white);


var textToDraw = "";

if (!isBranching) {

    if (is_array(dialogData)) textToDraw = dialogData[page];
} else {

    if (variable_struct_exists(currentNodeData, "text")) {
        textToDraw = currentNodeData.text;
    }
}

draw_text_ext(xRectangle + 32, yRectangle + 32, textToDraw, 32, guiWidth - 64);


if (isBranching && variable_struct_exists(currentNodeData, "options")) {
    var options = currentNodeData.options;
    var mouseGuiX = device_mouse_x_to_gui(0);
    var mouseGuiY = device_mouse_y_to_gui(0);
    
    for (var i = 0; i < array_length(options); i++) {
        var opt = options[i];
        
      
        var btnX = xRectangle + 32;
        var btnY = yRectangle - ((array_length(options) - i) * (optionHeight + optionMargin)) - 20;
        var btnW = guiWidth - 64;
        var btnH = optionHeight;
        

        var hover = (mouseGuiX > btnX && mouseGuiX < btnX + btnW && mouseGuiY > btnY && mouseGuiY < btnY + btnH);
        

        draw_set_color(hover ? c_gray : c_dkgray);
        draw_rectangle(btnX, btnY, btnX + btnW, btnY + btnH, false);
        

        draw_set_color(c_white);
        draw_text(btnX + 10, btnY + 10, opt.label);
        
   
        if (hover && mouse_check_button_pressed(mb_left)) {
  
            currentNodeKey = opt.next;
            currentNodeData = dialogData[$ currentNodeKey];
        }
    }
}

draw_set_font(-1);
draw_set_color(-1);