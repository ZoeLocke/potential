///scr_populateSettings()

for(i = 0; i < 3; i++) {
    var xpos;
    
    switch(i){
        case(0):
        xpos = room_width * 0.2;
        break;
        
        case(1):
        xpos = room_width * 0.8;
        break;
        
        case(2):
        xpos = room_width * 0.5;
        break;
    }
    
    var inst = instance_create(xpos, room_height * 0.8, obj_settingsControl);
    inst.settingType = i;
}
