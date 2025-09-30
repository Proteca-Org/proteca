
// Define a posição inicial do jogador na room dependendo de onde ele entrou.

var margin_pct = 0.05; //margem percentual (5% da largura/altura)
var top_offset = 24; //offset pra não ficar preso na parede (teste)

var padding_x = room_width * margin_pct;
var padding_y = room_height * margin_pct;

// Posições de base usando margens relativas, p/ facilitar escrita no switch
var leftX   = padding_x;
var rightX  = room_width - padding_x;
var topY    = padding_y + top_offset;
var bottomY = room_height - padding_y;
var middleY = room_height / 2;

switch(global.player_entry) {
    case "left":
        x = leftX;
        y = clamp(room_height/2+top_offset, topY, bottomY);
        break;
    case "right":
        x = room_width - padding_x;
        y = clamp(room_height/2+top_offset, topY, bottomY);
        break;
    case "up":
        x = clamp(room_width/2, leftX, rightX);
        y = topY;
        break;
    case "down":
        x = clamp(room_width/2, leftX, rightX);
        y = bottomY;
        break;
    default:
        x = room_width / 2;
        y = room_height / 2;
        break;
}