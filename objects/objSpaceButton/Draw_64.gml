draw_set_color(c_white);

if (bar_started) {

    draw_set_color(c_dkgray);
    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);

    var fill_w = bar_w * (anxiety_value / anxiety_max);
    draw_set_color(c_red);
    draw_rectangle(bar_x, bar_y, bar_x + fill_w, bar_y + bar_h, false);

    draw_set_color(c_white);
    draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, true);
}

draw_set_color(c_white);
draw_text_transformed(
    bar_x, bar_y - 40,
    "Tente agitar a ansiedade apertando a tecla de espaço!",
    1.5, 1.5,
    0
);