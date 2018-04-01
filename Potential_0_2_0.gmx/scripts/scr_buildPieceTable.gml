///scr_buildPieceTable()
pieces = ds_grid_create(5, 16);
var i;

//---Populate piece table---
//  ID, image_index, row, col, charge

//  Populate IDs
for(i = 0; i < 8; i++) ds_grid_set(pieces, 0, i, "A" + i);
for(i = 0; i < 8; i++) ds_grid_set(pieces, 0, i + 8, "B" + i);

//  Populate image_index
for(i = 0; i < 8; i++) ds_grid_set(pieces, 1, i, 0);
for(i = 0; i < 8; i++) ds_grid_set(pieces, 1, i + 8, 1);

//  Populate rows
for(i = 0; i < 8; i++) ds_grid_set(pieces, 2, i, i);
for(i = 0; i < 8; i++) ds_grid_set(pieces, 2, i + 8, i);

//  Populate columns
for(i = 0; i < 8; i++) ds_grid_set(pieces, 3, i, i);
for(i = 0; i < 8; i++) ds_grid_set(pieces, 3, i + 8, i);

//  Populate charge
ds_grid_set_region(pieces, 4, 0, 4, ds_grid_height(pieces) - 1, setting[0,1]);

