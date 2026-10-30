
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


// Interação do slider de volume
// Area clicavel da barra
var mouse_sobre_slider = point_in_rectangle(
    mouse_gui_x,
    mouse_gui_y,
    slider_x - 5,
    slider_y - 12,
    slider_x + slider_w + 5,
    slider_y + 12
);

// Começa a arrastar ao clicar na barra
if (categoria_selecionada == 0
    && mouse_sobre_slider
    && mouse_check_button_pressed(mb_left))
{
    slider_arrastando = true;
}

// Atualiza o volume enquanto arrasta
if (slider_arrastando)
{
    if (mouse_check_button(mb_left))
    {
        global.configuracoes.audio.volume_geral = clamp(
            (mouse_gui_x - slider_x) / slider_w,
            0,
            1
        );
    }
    else
    {
        // O jogador soltou o botão do mouse
        slider_arrastando = false;

        // Salva as configurações no arquivo JSON
        scrSaveSettings();
    }
}

// Dropdown do idioma
if (categoria_selecionada == 2)
{
    var mouse_sobre_dropdown = point_in_rectangle(
        mouse_gui_x,
        mouse_gui_y,
        dropdown_x,
        dropdown_y,
        dropdown_x + dropdown_w,
        dropdown_y + dropdown_h
    );

    // Abre ou fecha o dropdown ao clicar nele
    if (mouse_sobre_dropdown && mouse_check_button_pressed(mb_left))
    {
        dropdown_aberto = !dropdown_aberto;
    }
}
else
{
    // Fecha o dropdown ao trocar de categoria
    dropdown_aberto = false;
}

// Selecao de idioma no dropdown
if (categoria_selecionada == 2
    && dropdown_aberto
    && mouse_check_button_pressed(mb_left))
{
    var opcao_altura = 36;
    var opcao_y = dropdown_y + 40;

    for (var i = 0; i < array_length(idiomas); i++)
    {
        var opcao_topo = opcao_y + (i * opcao_altura);
        var opcao_fundo = opcao_topo + opcao_altura;

        if (point_in_rectangle(
            mouse_gui_x,
            mouse_gui_y,
            dropdown_x,
            opcao_topo,
            dropdown_x + dropdown_w,
            opcao_fundo
        ))
        {
            idioma_selecionado = i;

            switch (i)
            {
                case 0:
                    global.configuracoes.idioma = "pt-BR";
                    break;

                case 1:
                    global.configuracoes.idioma = "en";
                    break;

                case 2:
                    global.configuracoes.idioma = "es";
                    break;
            }

            scrSaveSettings();

            dropdown_aberto = false;
            break;
        }
    }
}