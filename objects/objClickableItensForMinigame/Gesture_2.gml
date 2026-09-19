var px = event_data[?"posX"];
var py = event_data[?"posY"];

var top = noone;
var topOrder = -1;
with(objClickableItensForMinigame) {
	if(position_meeting(px, py, id) && stackOrder > topOrder) {
		top = id;
		topOrder = stackOrder;
	}
}
if(top != noone && top != id) exit;

var maxOrder = 0;
with(objClickableItensForMinigame) {
	maxOrder = max(maxOrder, stackOrder);
}
stackOrder = maxOrder + 1;
isDragging = true;

dragOffsetX = x - px;
dragOffsetY = y - py;