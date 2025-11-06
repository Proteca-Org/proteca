draw_self();

draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fntMenu);
var scale = 3;
draw_text_transformed(x, y, password_code, scale, scale, 0);

// retorna alinhamento de texto para não acabar com o dialog
draw_set_halign(fa_left);
draw_set_valign(fa_top);
