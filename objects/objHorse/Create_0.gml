// Define o nível de profundidade entre dois objetos, quem está mais abaixo na tela é desenhado na frente
depth = -bbox_bottom;
horse_original = noone;
if (room == rmForestHorse && global.horseEscaped) {
    instance_destroy();
    exit;
}
    