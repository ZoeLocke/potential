///scr_populateSettings()

for(i = 0; i < array_height_2d(global.settings); i++) {
    var inst = instance_create(200, 200 * (i + 1), obj_settingsControl);
    inst.settingType = global.settings[i,0];
}
