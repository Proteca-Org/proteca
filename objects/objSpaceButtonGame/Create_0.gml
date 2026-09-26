anxiety_value = 0;
anxiety_max = 100;
anxiety_triggered = false;
visible = false;
fill_amount = 8;
drain_speed = 0.3;
target_x = 444;
target_y = 270;
gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

bar_w = 700;
bar_h = 60;
bar_x = gui_w / 2 - bar_w / 2;
bar_y = gui_h - 140;

bar_started = false;   // controla se já apareceu a barra (após o 1º clique)
global.anxietyMinigameActive = true;