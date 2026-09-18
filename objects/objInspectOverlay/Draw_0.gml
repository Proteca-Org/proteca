draw_self();
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fntMenu);

var scale = 2;
var content = "";
if (!is_undefined(inspectData)) {
    if (inspectData.type == "password") {
        content = global.paperPassword;
    } else if (inspectData.type == "text") {
        content = inspectData.content;
    }
}

draw_text_transformed(x, y, content, scale, scale, 0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);