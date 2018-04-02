///scr_buildPieceTable()
pieces = ds_grid_create(6, 16);
var i;

//---Populate piece table---
//  ID, image_index, row, col, charge

//  Populate IDs
for(i = 0; i < 8; i++) ds_grid_set(pieces, 0, i, " A" + i);
for(i = 0; i < 8; i++) ds_grid_set(pieces, 0, i + 8, " B" + i);

//  Populate image_index
for(i = 0; i < 8; i++) ds_grid_set(pieces, 1, i, 0);
for(i = 0; i < 8; i++) ds_grid_set(pieces, 1, i + 8, 1);

//  Populate rows
ds_grid_set_region(pieces, 2, 0, 2, 3, 1);
ds_grid_set_region(pieces, 2, 4, 2, 7, 2);
ds_grid_set_region(pieces, 2, 8, 2, 11, 7);
ds_grid_set_region(pieces, 2, 12, 2, 15, 8);

//  Populate columns
ds_grid_set(pieces, 3, 0, 1);
ds_grid_set(pieces, 3, 1, 3);
ds_grid_set(pieces, 3, 2, 5);
ds_grid_set(pieces, 3, 3, 7);

ds_grid_set(pieces, 3, 4, 2);
ds_grid_set(pieces, 3, 5, 4);
ds_grid_set(pieces, 3, 6, 6);
ds_grid_set(pieces, 3, 7, 8);

ds_grid_set(pieces, 3, 8, 1);
ds_grid_set(pieces, 3, 9, 3);
ds_grid_set(pieces, 3, 10, 5);
ds_grid_set(pieces, 3, 11, 7);

ds_grid_set(pieces, 3, 12, 2);
ds_grid_set(pieces, 3, 13, 4);
ds_grid_set(pieces, 3, 14, 6);
ds_grid_set(pieces, 3, 15, 8);

/*
for(i = 0; i < 15; i++) ds_grid_set(pieces, 2, i, ds_grid_get(configs, 1, i));
for(i = 0; i < 15; i++) ds_grid_set(pieces, 3, i, ds_grid_get(configs, 2, i));
*/
//  Populate Contiguous position
for(i = 0; i < 15; i++){
    var col = ds_grid_get(pieces, 3, i);
    var row = ds_grid_get(pieces, 2, i);
    var cPos = col + (row * 10);
    
    ds_grid_set(pieces, 4, i, cPos);
};

//  Populate charge
ds_grid_set_region(pieces, 5, 0, 5, ds_grid_height(pieces) - 1, setting[0,1]);

obj_debug.str = ds_grid_write(pieces);
ds_grid_sort(pieces, 4, true);
