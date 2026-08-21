enum HorseMiniState {
    INTRO,
    PUZZLE
}

state = HorseMiniState.INTRO;

gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

frame_x = gui_w / 2;
frame_y = gui_h / 2;

horse_scale = 4.0;

horse_x = gui_w / 2 - (sprite_get_width(sprHorse) * horse_scale) / 2;
horse_y = gui_h / 2 - (sprite_get_height(sprHorse)* horse_scale) / 2;

bar_x = gui_w / 2 -250;
bar_y = gui_h / 2 +200;

bar_w = sprite_get_width(sprMinigameBar);
bar_h = sprite_get_height(sprMinigameBar);

hand_x = gui_w / 2 - 40
hand_y = gui_h / 2 + 50;

arrow_left = bar_x;
arrow_right = bar_x + bar_w;
green_left = bar_x + 236;
green_right = bar_x + 314;
arrow_x = arrow_left;
arrow_dir = 1;
arrow_speed = 5;
global.minigameActive = true;
horse_visible = true;