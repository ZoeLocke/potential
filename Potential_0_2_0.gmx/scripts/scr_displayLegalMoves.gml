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
        var legalSpace = i >= 0 && j >= 0 && i <= 99 && j <= 99;
        var freeSpace = ds_grid_get(board, j, i) == 0;
        
        if(legalSpace && freeSpace){
            scr_helperFindMarker(i, j);
        }
    }
};


