///scr_input()

//---Interactions in start room--
if(room == rm_start){
    
    //---Interactions with start button---
    if(place_meeting(mouse_x, mouse_y, obj_transitionButton)){
        //  Set on-hover sprite for button
        obj_transitionButton.image_index = 1;
        
        //  depress button
        if(mouse_check_button_pressed(mb_left)){
            obj_transitionButton.y += 5;
        };
        
        //raise button, then wait clickDelay frames before proceeding
        if(mouse_check_button_released(mb_left)){
            activeButton = obj_transitionButton;
            alarm_set(0, floor(clickDelay / 2));
            alarm_set(1, clickDelay);
        };
    }else{
        obj_transitionButton.image_index = 0;
    }; 
    
    
    //---Interactions with settings buttons---
    
    //  When mouse is over any left arrow, change that arrow's image index, 
    //      if mouse it not over any left arrow, reset the image index of all left arrows
    var arrow = instance_place(mouse_x, mouse_y, obj_arrow);
    
    //  If an arrow is found
    if(arrow != noone){
        //  Set on-hover sprite for button
        arrow.image_index = 1;
        
        //  depress button
        if(mouse_check_button_pressed(mb_left)){
            arrow.y += 5;
        };
        
        //  raise button  and adjust value
        if(mouse_check_button_released(mb_left)){
            activeButton = arrow;
            alarm_set(0, floor(clickDelay / 2));
            
            var parentSetting = instance_nearest(arrow.x + (160 * sign(arrow.image_xscale)), arrow.y, txt_settingText);
            
            //  Set init charge
            if(parentSetting.setting == "Initial Charge"){
                switch(sign(arrow.image_xscale)){
                    case -1:
                    if(setting[0,1] > minInitCharge) setting[0,1]-- else setting[0,1] = maxInitCharge;
                    break;
                    case 1:
                    if(setting[0,1] < maxInitCharge) setting[0,1]++ else setting[0,1] = minInitCharge;
                    break;
                };
            };
            
            //  Set max charge
            if(parentSetting.setting == "Max Charge"){
                switch(sign(arrow.image_xscale)){
                    case -1:
                    if(setting[1,1] > minMaxCharge) setting[1,1]-- else setting[1,1] = maxMaxCharge;
                    break;
                    case 1:
                    if(setting[1,1] < maxMaxCharge) setting[1,1]++ else setting[1,1] = minMaxCharge;
                    break;
                };
            };

            //  Set board type
            if(parentSetting.setting == "Board Type"){
                var currentBoard = ds_list_find_index(boardType, setting[2,1])
                
                switch(sign(arrow.image_xscale)){
                    case -1:
                    if(currentBoard != 0){
                        setting[2,1] = ds_list_find_value(boardType, currentBoard - 1)
                    }else{
                        setting[2,1] = ds_list_find_value(boardType, ds_list_size(boardType) - 1);
                    };
                    break;
                    case 1:
                    if(currentBoard != ds_list_size(boardType) - 1){
                        setting[2,1] = ds_list_find_value(boardType, currentBoard + 1);
                    }else{
                        setting[2,1] = ds_list_find_value(boardType, 0);
                    };
                    break;
                };
            };
            
            //  Set onfiguration
            if(parentSetting.setting == "Configuration"){
                var currentConfig = ds_list_find_index(pieceConfig, setting[3,1])
                
                switch(sign(arrow.image_xscale)){
                    case -1:
                    if(currentConfig != 0){
                        setting[3,1] = ds_list_find_value(pieceConfig, currentConfig - 1);
                    }else{
                        setting[3,1] = ds_list_find_value(pieceConfig, ds_list_size(pieceConfig) - 1);
                    };
                    break;
                    case 1:
                    if(currentConfig != ds_list_size(pieceConfig) - 1){
                        setting[3,1] = ds_list_find_value(pieceConfig, currentConfig + 1);
                    }else{
                        setting[3,1] = ds_list_find_value(pieceConfig, 0);
                    };
                    break;
                };
            };
        };
    }else{
        with(obj_arrow) image_index = 0;
    };
  
};

//---Interactions in game room---
if(room == rm_game){
    
    //---Interactions with start button---
    if(place_meeting(mouse_x, mouse_y, obj_transitionButton)){
        //  Set on-hover sprite for button
        obj_transitionButton.image_index = 1;
        
        //  depress button
        if(mouse_check_button_pressed(mb_left)){
            obj_transitionButton.y += 5;
        };
        
        //raise button, then wait clickDelay frames before proceeding
        if(mouse_check_button_released(mb_left)){
            activeButton = obj_transitionButton;
            alarm_set(0, floor(clickDelay / 2));
            alarm_set(1, clickDelay);
        };
    }else{
        obj_transitionButton.image_index = 0;
    };
};
