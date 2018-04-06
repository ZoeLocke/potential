///scr_displayLive()

//  Update Settings display
if(room == rm_start){
    var i;
    var j;

    //  Loop through all settings text objects and update their settings
    for(i = 0; i < instance_number(txt_settingText); i++){
        var settingTextInst = instance_find(txt_settingText, i);
        settingTextInst.setting = setting[i,0];
        settingTextInst.settingValue = setting[i,1];
    };
};
