// Tamanho da interface
margin = 32;

// Categorias
cat_x = 40;			// Posição horizontal das categorias
cat_y = 100;		// Posição vertical da primeira categoria
cat_w = 160;		// Largura dos botões das categorias
cat_h = 40;         // Altura dos botões das categorias
cat_spacing = 8;    // Espaço entre os botões das categorias

// Painel principal
panel_x = 240;
panel_y = 100;
panel_w = 560;
panel_h = 300;

//Botao voltar
voltar_x = 720;
voltar_y = 70;

// Categoria atualmente selecionada
categoria_selecionada = 0;
categoria_mouse = -1;

// Define de onde o menu de configurações foi aberto
origem = "pausa";

// Inicializa as configurações globais, caso ainda não existam
if (!variable_global_exists("configuracoes"))
{
    global.configuracoes = {
        audio: {
            volume_geral: 1
        },

        texto: {},

        idioma: "pt-BR",

        video: {}
    };
}

//Slider do volume
slider_x = panel_x + 50;       // Início da barra
slider_y = panel_y + 115;      // Posição vertical
slider_w = 200;                // Largura da barra
slider_raio = 8;               // Raio do círculo

// Interação do slider
slider_arrastando = false;


// Dropdown do idioma

// Posição e tamanho
dropdown_x = panel_x + 140;
dropdown_y = panel_y + 110;
// Tamanho do dropdown
dropdown_w = 200;
dropdown_h = 50;

// Estado do dropdown
dropdown_aberto = false;

// Idiomas disponiveis
idiomas = [
    "Português Brasileiro",
    "Inglês",
    "Espanhol"
];

// Idioma atualmente selecionado
idioma_selecionado = 0;

idioma_mouse = -1;

// Carrega o idioma salvo nas configurações globais
switch (global.configuracoes.idioma)
{
    case "pt-BR":
        idioma_selecionado = 0;
        break;

    case "en":
        idioma_selecionado = 1;
        break;

    case "es":
        idioma_selecionado = 2;
        break;
}
