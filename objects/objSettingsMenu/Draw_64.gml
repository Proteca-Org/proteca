// Titulo
draw_set_color(c_white);

draw_text(360, 30, "CONFIGURAÇÕES");


//botao voltar
var voltar_x = 720;
var voltar_y = 70;

// Posição do mouse
var mouse_gui_x = device_mouse_x_to_gui(0);
var mouse_gui_y = device_mouse_y_to_gui(0);

// Tamanho do botão
var voltar_w = 120;
var voltar_h = 40;

// Verifica se o mouse está sobre o botão
var mouse_sobre_voltar = point_in_rectangle(
    mouse_gui_x,
    mouse_gui_y,
    voltar_x,
    voltar_y,
    voltar_x + voltar_w,
    voltar_y + voltar_h
);

if (mouse_sobre_voltar && mouse_check_button_pressed(mb_left))
{
    var pauseMenu = instance_find(objPause, 0);

    if (instance_exists(pauseMenu))
    {
        pauseMenu.settings_open = false;
    }

    instance_destroy();
}



// Desenha o botão
if (mouse_sobre_voltar)
{
    draw_sprite_ext(
        sprUiButtonSelected,
        0,
        voltar_x,
        voltar_y,
        0.75,
        1,
        0,
        c_white,
        1
    );
}
else
{
    draw_sprite_ext(
        sprUiButtonNormal,
        0,
        voltar_x,
        voltar_y,
        0.75,
        1,
        0,
        c_white,
        1
    );
}

// Texto
var texto_voltar = "VOLTAR";

var texto_x = voltar_x + 15;
var texto_y = voltar_y + 7;

draw_set_color(c_black);

draw_text_transformed(
    texto_x,
    texto_y,
    texto_voltar,
    0.65,
    0.65,
    0
);

// 2x para deixar a escrita mais forte
draw_text_transformed(
    texto_x + 1,
    texto_y,
    texto_voltar,
    0.65,
    0.65,
    0
);
///categorias
var nomes = ["Áudio", "Texto", "Idioma", "Vídeo"];

categoria_mouse = -1;

for (var i = 0; i < 4; i++)
{
    var yy = cat_y + i * (cat_h + cat_spacing);

    // Verifica se o mouse está sobre esta categoria
    if (point_in_rectangle(
        mouse_gui_x,
        mouse_gui_y,
        cat_x,
        yy,
        cat_x + cat_w,
        yy + cat_h
    ))
    {
        categoria_mouse = i;

        // Só muda a categoria quando clicar
        if (mouse_check_button_pressed(mb_left))
        {
            categoria_selecionada = i;
        }
    }

    // Desenha o botão selecionado
    // se estiver selecionado ou com o mouse em cima
    if (i == categoria_selecionada || i == categoria_mouse)
    {
        draw_sprite(
            sprUiButtonSelected,
            0,
            cat_x,
            yy
        );
    }
    else
    {
        draw_sprite(
            sprUiButtonNormal,
            0,
            cat_x,
            yy
        );
    }

    // Texto da categoria
    draw_set_color(c_black);

    draw_text_transformed(
        cat_x + 10,
        yy + 8,
        nomes[i],
        0.65,
        0.65,
        0
    );

    // 2x para deixar a escrita mais forte
    draw_text_transformed(
        cat_x + 11,
        yy + 8,
        nomes[i],
        0.65,
        0.65,
        0
    );
}


//Painel principal
draw_sprite_ext(
    sprUiPanel,
    0,
    panel_x,
    panel_y,
    560 / sprite_get_width(sprUiPanel),
    315 / sprite_get_height(sprUiPanel),
    0,
    c_white,
    1
);

//conteudo da categoria
draw_set_color(c_black);

switch (categoria_selecionada)
{
    case 0:
	    // 2x para deixar a escrita mais forte
        draw_text_transformed(
            panel_x + 30,
            panel_y + 50,
            "Volume Geral",
            0.65,
            0.65,
            0
        );
        
        draw_text_transformed(
            panel_x + 31,
            panel_y + 50,
            "Volume Geral",
            0.65,
            0.65,
            0
        );


        draw_line(
            panel_x + 20,
            panel_y + 95,
            panel_x + 220,
            panel_y + 95
        );

        draw_circle(
            panel_x + 120,
            panel_y + 95,
            8,
            false
        );

        break;
    case 1:
        draw_text_transformed(
            panel_x + 30,
            panel_y + 50,
            "Configurações de Texto",
            0.65,
            0.65,
            0
        );
		
		draw_text_transformed(
            panel_x + 31,
            panel_y + 50,
            "Configurações de Texto",
            0.65,
            0.65,
            0
        );

        break;
    case 2:
	    draw_text_transformed(
	        panel_x + 30,
	        panel_y + 50,
	        "Idioma do jogo",
	        0.65,
	        0.65,
	        0
	    );
		
		draw_text_transformed(
	        panel_x + 31,
	        panel_y + 50,
	        "Idioma do jogo",
	        0.65,
	        0.65,
	        0
	    );

		break;

    case 3:
        draw_text_transformed(
            panel_x + 30,
            panel_y + 50,
            "Configurações de Vídeo",
            0.65,
            0.65,
            0
        );
		
		draw_text_transformed(
            panel_x + 31,
            panel_y + 50,
            "Configurações de Vídeo",
            0.65,
            0.65,
            0
        );

        break;
}