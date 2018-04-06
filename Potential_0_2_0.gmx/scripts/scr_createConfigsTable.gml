///scr_createConfigsTable()
if(ds_exists(configs, ds_type_grid)) ds_grid_destroy(configs);
configs = ds_grid_create(2, 16);

//  Populate rows
var i;
for(i = 0; i < 16; i++){
    if(i < 4) ds_grid_set(configs, 0, i, 1) else
    if(i < 8) ds_grid_set(configs, 0, i, 2) else
    if(i < 12) ds_grid_set(configs, 0, i, 7) else ds_grid_set(configs, 0, i, 8);
};

//---Populate column configs---

//  wave
if(setting[3,1] == "Wave"){
    ds_grid_set(configs, 1, 0, 1);
    ds_grid_set(configs, 1, 1, 3);
    ds_grid_set(configs, 1, 2, 5);
    ds_grid_set(configs, 1, 3, 7);
    
    ds_grid_set(configs, 1, 4, 2);
    ds_grid_set(configs, 1, 5, 4);
    ds_grid_set(configs, 1, 6, 6);
    ds_grid_set(configs, 1, 7, 8);
    
    ds_grid_set(configs, 1, 8, 1);
    ds_grid_set(configs, 1, 9, 3);
    ds_grid_set(configs, 1, 10, 5);
    ds_grid_set(configs, 1, 11, 7);
    
    ds_grid_set(configs, 1, 12, 2);
    ds_grid_set(configs, 1, 13, 4);
    ds_grid_set(configs, 1, 14, 6);
    ds_grid_set(configs, 1, 15, 8);
};

//  Columns
if(setting[3,1] == "Columns"){
    ds_grid_set(configs, 1, 0, 1);
    ds_grid_set(configs, 1, 1, 3);
    ds_grid_set(configs, 1, 2, 5);
    ds_grid_set(configs, 1, 3, 7);
    
    ds_grid_set(configs, 1, 4, 1);
    ds_grid_set(configs, 1, 5, 3);
    ds_grid_set(configs, 1, 6, 5);
    ds_grid_set(configs, 1, 7, 7);
    
    ds_grid_set(configs, 1, 8, 2);
    ds_grid_set(configs, 1, 9, 4);
    ds_grid_set(configs, 1, 10, 6);
    ds_grid_set(configs, 1, 11, 8);
    
    ds_grid_set(configs, 1, 12, 2);
    ds_grid_set(configs, 1, 13, 4);
    ds_grid_set(configs, 1, 14, 6);
    ds_grid_set(configs, 1, 15, 8);
};
