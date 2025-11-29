var guiWidth = display_get_gui_width();

var guiHeight = display_get_gui_height();

var xRectangle = 0;
var yRectangle = guiHeight - 200;
var colorRectangle = c_black;

draw_set_font(fntDialog)
draw_set_color(c_white)
draw_rectangle_color(xRectangle, yRectangle, guiWidth, guiHeight, colorRectangle, colorRectangle, colorRectangle, colorRectangle, false);
draw_text_ext(xRectangle + 32, yRectangle + 32, text[page], 32, guiWidth - 64);
draw_set_font(-1)
draw_set_color(-1)