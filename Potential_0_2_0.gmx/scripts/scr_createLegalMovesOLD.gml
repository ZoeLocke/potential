///scr_createLegalMoves(piece)
var piece = argument0;
var pieceID = piece.pieceID;

//---These need one less to convert to a zero based array---
var gridHeight = ds_grid_height(board) - 1;
var gridWidth = ds_grid_width(board) - 1;

//---Find the row and column of the piece in the (zero based) board table---
var piecePosY = ds_grid_value_y(board, 0, 0, gridWidth, gridHeight, pieceID);
var piecePosX = ds_grid_value_x(board, 0, 0, gridWidth, gridHeight, pieceID);

//---Define the bounding range of the available moves (within the zero based array)---
var adjacency = 1;

//  Set start ranges to adjacent value or zero (whichever is larger) so that the 
//  target range isn't out of scope for the array
var startY = max(0, piecePosY - adjacency);
var startX = max(0, piecePosX - adjacency);

//  Set end ranges to adjacent value or the size of the grid (whichever is smaller) so that the 
//  target range isn't out of scope for the array
var endY = min(gridHeight, piecePosY + adjacency);
var endX = min(gridWidth, piecePosX + adjacency);

//---Loop through the above values checking for, and displaying, legal moves---
var i;
var j;
for(i = startY; i <= endY; i++){
    for(j = startX; j <= endX; j++){
        var pieceAtTarget = ds_grid_get(board, j, i);
        
        //  Are adjacent spaces legal?
        var markerPos = j + (i * 10);
        var marker = instance_find(obj_boardMarker, markerPos);
        
        marker.visible = pieceAtTarget == 0;

        //  Are jump spaces legal?
        if(pieceAtTarget > ""){
            var vectorX = 2 * (j - piecePosX);
            var vectorY = 2 * (i - piecePosY);
            var targetX = piecePosX + vectorX;
            var targetY = piecePosY + vectorY;
        
            var jumpTarget = ds_grid_get(board, targetX, targetY);
            markerPos = targetX + (targetY * 10);
            marker = instance_find(obj_boardMarker, markerPos);
            
            marker.visible = jumpTarget == 0;
        }
    }
};


