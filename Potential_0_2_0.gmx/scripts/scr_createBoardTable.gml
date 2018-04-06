///scr_createBoardTable();
board = ds_grid_create(10, 10);

//---Create and populate board table---
//  Table is a 10 by 10 matrix

//  Loop through the table 
var i;
for(i = 0; i < 16; i++){
    var pieceID;
    var pieceRow = ds_grid_get(configs, 0, i);
    var pieceCol = ds_grid_get(configs, 1, i);
    if(i < 8) pieceID = "A" + string(i) else pieceID = "B" + string(i - 8);
    
    ds_grid_set(board, pieceCol, pieceRow, pieceID);
};

if(ds_exists(configs, ds_type_grid)) ds_grid_destroy(configs);

obj_debug.debugText = ds_grid_write(board);

