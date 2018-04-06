///scr_buildPieceTable()
pieces = ds_grid_create(6, 16);
var i;

//---Populate piece table---
//  ID, image_index, row, col, cPos, charge

//  Populate IDs
for(i = 0; i < 8; i++) ds_grid_set(pieces, 0, i, "A" + string(i));
for(i = 0; i < 8; i++) ds_grid_set(pieces, 0, i + 8, "B" + string(i));

//  Populate image_index
for(i = 0; i < 8; i++) ds_grid_set(pieces, 1, i, 0);
for(i = 0; i < 8; i++) ds_grid_set(pieces, 1, i + 8, 1);

//  Populate rows and columns
for(i = 0; i < 16; i++) ds_grid_set(pieces, 2, i, ds_grid_get(configs, 0, i));
for(i = 0; i < 16; i++) ds_grid_set(pieces, 3, i, ds_grid_get(configs, 1, i));
if(ds_exists(configs, ds_type_grid)) ds_grid_destroy(configs);

//  Populate Contiguous position
for(i = 0; i < 16; i++){
    var col = ds_grid_get(pieces, 3, i);
    var row = ds_grid_get(pieces, 2, i);
    var cPos = scr_calculateCPos(col, row);
    
    ds_grid_set(pieces, 4, i, cPos);
};

//  Populate charge
ds_grid_set_region(pieces, 5, 0, 5, ds_grid_height(pieces) - 1, setting[0,1]);
