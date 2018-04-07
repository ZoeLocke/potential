///scr_displayLegalMoves(piece)
var gridHeight = ds_grid_height(board) - 1;
var gridWidth = ds_grid_width(board) - 1;

var piece = argument0;
var pieceID = piece.pieceID;
var piecePosY = ds_grid_value_y(board, 0, 0, gridWidth, gridHeight, pieceID);
var piecePosX = ds_grid_value_x(board, 0, 0, gridWidth, gridHeight, pieceID);

var startY = piecePosY - 1;
var endY = piecePosY + 1;
var startX = piecePosX - 1;
var endX = piecePosX + 1;

var i;
var j;
for(i = startY; i < endY + 1; i++){
    for(j = startX; j < endX + 1; j++){
        var freeSpace = ds_grid_get(board, j, i) == 0;
        
        if(freeSpace){
            //  scr_helperFindMarker(i, j);
            var markerPos = j + (i * 10);
            var marker = instance_find(obj_boardMarker, markerPos);
            if(marker.row == row && marker.col == col){
            //  Make the space visible and escape the for loop
            marker.visible = true;
            }
        }
    }
};


