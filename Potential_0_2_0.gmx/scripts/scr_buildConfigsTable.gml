///scr_buildConfigsTable()
configs = ds_grid_create(3, 16);
var i;

//---Populate configs table: WAVE---

//  Populate ID's
for(i = 0; i < 8; i++) ds_grid_set(configs, 0, i, "A" + i);

for(i = 0; i < 8; i++) ds_grid_set(configs, 0, i + 8, "B" + i);

//  Populate rows
ds_grid_set_region(configs, 1, 0, 1, 3, 1);
ds_grid_set_region(configs, 1, 4, 1, 7, 2);

ds_grid_set_region(configs, 1, 8, 1, 11, 7);
ds_grid_set_region(configs, 1, 12, 1, 15, 8);

//  Populate columns
for(i = 1; i < 4; i += 2) ds_grid_set(configs, 2, i, i);
for(i = 2; i < 5; i += 2) ds_grid_set(configs, 2, i, i);

for(i = 1; i < 4; i += 2) ds_grid_set(configs, 2, i, i);
for(i = 1; i < 4; i += 2) ds_grid_set(configs, 2, i, i);
