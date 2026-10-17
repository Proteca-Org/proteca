
// navegacao com o teclado
if (keyboard_check_pressed(vk_down))
{
    categoria_selecionada++;

    if (categoria_selecionada > 3)
    {
        categoria_selecionada = 0;
    }
}

if (keyboard_check_pressed(vk_up))
{
    categoria_selecionada--;

    if (categoria_selecionada < 0)
    {
        categoria_selecionada = 3;
    }
}

//Navegacao com o mouse
var mouse_gui_x = device_mouse_x_to_gui(0);
var mouse_gui_y = device_mouse_y_to_gui(0);

for (var i = 0; i < 4; i++)
{
    var yy = cat_y + i * (cat_h + cat_spacing);

    if (point_in_rectangle(
	    mouse_gui_x,
	    mouse_gui_y,
	    cat_x,
	    yy,
	    cat_x + cat_w,
	    yy + cat_h
	))
	{
	    if (mouse_check_button_pressed(mb_left))
	    {
	        categoria_selecionada = i;
	    }
	}
}

if (keyboard_check_pressed(vk_escape))
{
    var pauseMenu = instance_find(objPause, 0);

    if (instance_exists(pauseMenu))
    {
        pauseMenu.settings_open = false;
    }

    instance_destroy();
}