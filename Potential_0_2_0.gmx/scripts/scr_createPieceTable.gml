///scr_createPieceTable()
if(ds_exists(pieces, ds_type_grid)) ds_grid_destroy(pieces);
pieces = ds_grid_create(3, 16);
var i;

//---Populate piece table---
//  ID, image_index, charge

//  Populate IDs
for(i = 0; i < 8; i++) ds_grid_set(pieces, 0, i, "A" + string(i));
for(i = 0; i < 8; i++) ds_grid_set(pieces, 0, i + 8, "B" + string(i));

//  Populate image_index
for(i = 0; i < 8; i++) ds_grid_set(pieces, 1, i, 0);
for(i = 0; i < 8; i++) ds_grid_set(pieces, 1, i + 8, 1);

//  Populate charge
ds_grid_set_region(pieces, 2, 0, 2, ds_grid_height(pieces) - 1, setting[0,1]);
