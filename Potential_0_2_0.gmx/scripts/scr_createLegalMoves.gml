///scr_createLegalMoves(piece)
var piece = argument0;
var pieceID = piece.pieceID;

if(ds_exists(global.legalMoves, ds_type_grid)) ds_grid_destroy(global.legalMoves);
if(ds_exists(global.jumpablePieces, ds_type_grid)) ds_grid_destroy(global.jumpablePieces);

//---Create table to store legal moves---
//  Tables are a full representation of the board
global.legalMoves = ds_grid_create(10, 10);
global.jumpablePieces = ds_grid_create(10, 10);

//---These need one less to convert to a zero based array---
var gridHeight = ds_grid_height(board) - 1;
var gridWidth = ds_grid_width(board) - 2;

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
        
        //  Populate legal moves grid
        if(pieceAtTarget == 0) ds_grid_set(global.legalMoves, j, i, 1);

        //  Are jump spaces legal?
        if(pieceAtTarget > ""){
            var vectorX = 2 * (j - piecePosX);
            var vectorY = 2 * (i - piecePosY);
            var targetX = piecePosX + vectorX;
            var targetY = piecePosY + vectorY;
        
            var jumpTarget = ds_grid_get(board, targetX, targetY);
            if(jumpTarget == 0){
                //  If a legal jump is available, mark the jump space, and store the ID of the jumpable piece
                ds_grid_set(global.legalMoves, targetX, targetY, 1);
                ds_grid_set(global.jumpablePieces, targetX, targetY, pieceAtTarget);
            }
        }
    }
};
