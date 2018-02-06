///scr_populateSettings()

for(i = 0; i < 2; i++) {
    var xpos;
    if(i == 0){xpos = room_width * 0.25}else{xpos = room_width * 0.75};
    var inst = instance_create(xpos, room_height * 0.82, obj_settingsControl);
    inst.settingType = i;
}
