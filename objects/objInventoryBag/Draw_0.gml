
if (aberto) {
	 draw_set_alpha(0.5);  
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1); 
    var openX = x -175;    
    var openY = y - 250;    
    var openScale = 0.4;     
    
    draw_sprite_ext(sprInventoryOpen, 0, openX, openY, openScale, openScale, 0, c_white, 1);
} else {
    draw_self();  
}