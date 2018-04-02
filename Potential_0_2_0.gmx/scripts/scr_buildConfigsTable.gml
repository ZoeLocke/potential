///scr_buildConfigsTable()
configs = ds_grid_create(3, 16);
var i;

//---Populate configs table: WAVE---

//  Populate ID's
for(i = 0; i < 8; i++) ds_grid_set(configs, 0, i, "A" + i);

for(i = 0; i < 8; i++) ds_grid_set(configs, 0, i + 8, "B" + i);

//  Populate rows and columns
for(i = 1; i < 8; i++){
    var row;
    if(sign(i) == -1) row = 1 else row = 2;
    
    ds_grid_set(configs, row, i, i);
    ds_grid_set(configs, row, i, row);
};

for(i = 1; i < 8; i++){
    var row;
    if(sign(i) == -1) row = 8 else row = 7;
    
    ds_grid_set(configs, row, i + 8, i);
    ds_grid_set(configs, row, i + 8, row);
};
