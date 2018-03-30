///scr_display()
//  Scale room
if (browser_width != width || browser_height != height){
    width = min(base_width, browser_width);
    height = min(base_height, browser_height);
};

var aspect = (base_width / base_height);
if ((width / aspect) > height)window_set_size((height * aspect), height) else window_set_size(width, (width / aspect));
if (resizeWindow) window_center();
surface_resize(application_surface, min(window_get_width(), base_width), min(window_get_height(), base_height));

//  Display meta and subtitle
var i;
for(i = 0; i < instance_number(txt_smallPrint); i++){
    with(instance_find(txt_smallPrint, i)){
        if(x < room_width / 2){
            smallPrintValue = other.copyright;
        }else{
            smallPrintValue = other.build;
        };
    };
};

if(instance_exists(txt_subtitle)) txt_subtitle.subtitle = subtitle;

//  Settings
if(room == rm_start){
    var i;
    var j;

    //  Loop through all settings text objects and update their settings
    for(i = 0; i < instance_number(txt_settingText); i++){
        var settingTextInst = instance_find(txt_settingText, i);
        settingTextInst.setting = setting[i,0];
        settingTextInst.settingValue = setting[i,1];
    };

    //  Loop through all labels and update their values to the settings type of the nearest settings text object
    for(j = 0; j < instance_number(txt_label); j++){
        var label = instance_find(txt_label, j);
        var parentSetting = instance_nearest(label.x, label.y + 128, txt_settingText);
        label.labelText = parentSetting.setting;
    };
};

//  Display other controls
if(room == rm_start) obj_transitionButton.transition = "PLAY";
if(room == rm_game) obj_transitionButton.transition = "QUIT";

//  Display game objects
if(room == rm_game){
    obj_board.sprite_index = ds_map_find_value(boardTypeSprites, setting[2,1]);
};
