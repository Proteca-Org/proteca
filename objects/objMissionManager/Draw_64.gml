// DEBUG — remover após UI ser implementada
draw_set_font(fntDialog);
var len = array_length(global.missions);
if (global.current_mission < len) {
    draw_set_color(c_yellow);
    draw_text(10, 10, "Missão atual: " + string(global.current_mission));
    draw_text(10, 30, global.missions[global.current_mission].text);
} else {
    draw_set_color(c_lime);
    draw_text(10, 10, "Todas as missões concluídas.");
}
draw_set_color(c_white);
draw_set_font(-1);