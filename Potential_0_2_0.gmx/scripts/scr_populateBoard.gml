///scr_populateBoard()
var startX = obj_board.x;
var startY = obj_board.y;
var markerSize = sprite_get_width(spr_boardMarker);

var i;
var j;
for(i = 0; i < 10; i++){
    for(j = 0; j < 10; j++){
        var xPos = startX + (markerSize * j + 1);
        var yPos = startY + (markerSize * i + 1);
        var marker = (instance_create(xPos, yPos, obj_boardMarker)){
        marker.row = i;
        marker.col = j;        
        };
    };
};
