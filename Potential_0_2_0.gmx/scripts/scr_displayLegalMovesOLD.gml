///scr_displayLegalMoves(piece)
var gridHeight = ds_grid_height(pieces);
var piece = argument0;
var piecePos = ds_grid_value_y(pieces, 0, 0, 0, gridHeight, piece.pieceID); 
var col = ds_grid_get(pieces, 3, piecePos);
var row = ds_grid_get(pieces, 2, piecePos);

//  Create a grid containing every notional move, and whether there is a piece at that space
//  Grid is Row, Col, cPos, Piece at Space
var moves = ds_grid_create(4, 8);
var targetCPos;

//  Above Left
ds_grid_set(moves, 0, 0, row - 1);
ds_grid_set(moves, 1, 0, col - 1);
targetCPos = scr_calculateCPos(col - 1, row - 1);
ds_grid_set(moves, 2, 0, targetCPos);
ds_grid_set(moves, 3, 0, ds_grid_value_exists(moves, 4, 0, 4, gridHeight, targetCPos));
//  Above
ds_grid_set(moves, 0, 1, row - 1);
ds_grid_set(moves, 1, 1, col);
targetCPos = scr_calculateCPos(col, row - 1);
ds_grid_set(moves, 2, 1, targetCPos);
ds_grid_set(moves, 3, 1, ds_grid_value_exists(moves, 4, 0, 4, gridHeight, targetCPos));
//  Above Right
ds_grid_set(moves, 0, 2, row - 1);
ds_grid_set(moves, 1, 2, col + 1);
targetCPos = scr_calculateCPos(col + 1, row - 1);
ds_grid_set(moves, 2, 2, targetCPos);
ds_grid_set(moves, 3, 2, ds_grid_value_exists(moves, 4, 0, 4, gridHeight, targetCPos));
//  Left
ds_grid_set(moves, 0, 3, row);
ds_grid_set(moves, 1, 3, col - 1);
targetCPos = scr_calculateCPos(col - 1, row);
ds_grid_set(moves, 2, 3, targetCPos);
ds_grid_set(moves, 3, 3, ds_grid_value_exists(moves, 4, 0, 4, gridHeight, targetCPos));
//  Right
ds_grid_set(moves, 0, 4, row);
ds_grid_set(moves, 1, 4, col + 1);
targetCPos = scr_calculateCPos(col + 1, row);
ds_grid_set(moves, 2, 4, targetCPos);
ds_grid_set(moves, 3, 4, ds_grid_value_exists(moves, 4, 0, 4, gridHeight, targetCPos));
//  Below Left
ds_grid_set(moves, 0, 5, row + 1);
ds_grid_set(moves, 1, 5, col - 1);
targetCPos = scr_calculateCPos(col - 1, row + 1);
ds_grid_set(moves, 2, 5, targetCPos);
ds_grid_set(moves, 3, 5, ds_grid_value_exists(moves, 4, 0, 4, gridHeight, targetCPos));
//  Below
ds_grid_set(moves, 0, 6, row + 1);
ds_grid_set(moves, 1, 6, col);
targetCPos = scr_calculateCPos(col, row + 1);
ds_grid_set(moves, 2, 6, targetCPos);
ds_grid_set(moves, 3, 6, ds_grid_value_exists(moves, 4, 0, 4, gridHeight, targetCPos));
//  Below Right
ds_grid_set(moves, 0, 7, row + 1);
ds_grid_set(moves, 1, 7, col + 1);
targetCPos = scr_calculateCPos(col + 1, row + 1);
ds_grid_set(moves, 2, 7, targetCPos);
ds_grid_set(moves, 3, 7, ds_grid_value_exists(moves, 4, 0, 4, gridHeight, targetCPos));

//  Check for legal moves in above grid
var i;
gridHeight = ds_grid_height(moves);
for(i = 0; i < gridHeight; i++){
    var cPos = ds_grid_get(moves, 2, i);
    var pieceAtCPos = ds_grid_get(moves, 3, i)
    obj_debug.debugText = cPos >= 0;
    if(cPos >= 0 && cPos <= 99 && !pieceAtCPos){
        
        //  Loop through each marker on the board to find the right one!
        scr_helperFindMarker(cPos);
    }
};

ds_grid_destroy(moves);


