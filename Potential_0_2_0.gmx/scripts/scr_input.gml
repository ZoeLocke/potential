///scr_input()
//---Inputs---

//  Interactions in start room
if(room == rm_start){
    
    //---Interactions with start button---
    if(place_meeting(mouse_x, mouse_y, obj_startButton)){
        //  Set on-hover sprite for button
        obj_startButton.image_index = 1;
        
        //  depress button
        if(mouse_check_button_pressed(mb_left)){
            obj_startButton.y += 5;
        };
        
        //raise button, then wait clickDelay frames before proceeding
        if(mouse_check_button_released(mb_left)){
            activeButton = obj_startButton;
            alarm_set(0, floor(clickDelay / 2));
            alarm_set(1, clickDelay);
        };
    }else{
        obj_startButton.image_index = 0;
    }; 
    
    //---Interactions with settings buttons---
    
    //  When mouse is over any left arrow, change that arrow's image index, 
    //      if mouse it not over any left arrow, reset the image index of all left arrows
    var arrowLeft = instance_place(mouse_x, mouse_y, obj_arrowLeft);
    
    //  If an arrow is found
    if(arrowLeft != noone){
        //  Set on-hover sprite for button
        arrowLeft.image_index = 1;
        
        //  depress button
        if(mouse_check_button_pressed(mb_left)){
            arrowLeft.y += 5;
        };
        
        //  raise button  and adjust value
        if(mouse_check_button_released(mb_left)){
            activeButton = arrowLeft;
            alarm_set(0, floor(clickDelay / 2));
            
            var parentSetting = instance_nearest(arrowLeft.x + 160, arrowLeft.y, txt_settingText);
            
            //  Set max charge
            if(parentSetting.setting == "Initial Charge"){
                if(setting[0,1] > minInitCharge) setting[0,1]-- ;
            };
            
            //  Set init charge
            if(parentSetting.setting == "Max Charge"){
                if(setting[1,1] > minMaxCharge) setting[1,1]-- ;
            };

            //  Set board type
            if(parentSetting.setting == "Board Type"){
                var currentBoard = ds_list_find_index(boardType, setting[2,1]);
                
                if(currentBoard != 0){
                    setting[2,1] = ds_list_find_value(boardType, currentBoard - 1);
                };
            };
        };
    }else{
        with(obj_arrowLeft) image_index = 0;
    };
    
    //  When mouse is over any right arrow, change that arrow's image index, 
    //      if mouse it not over any right arrow, reset the image index of all right arrows
    var arrowRight = instance_place(mouse_x, mouse_y, obj_arrowRight);
    
    //  If an arrow is found
    if(arrowRight != noone){
        //  Set on-hover sprite for button
        arrowRight.image_index = 1;
        
        //  depress button
        if(mouse_check_button_pressed(mb_left)){
            arrowRight.y += 5;
        };
        
        //  raise button  and adjust value
        if(mouse_check_button_released(mb_left)){
            activeButton = arrowRight;
            alarm_set(0, floor(clickDelay / 2));
            
            var parentSetting = instance_nearest(arrowRight.x - 100, arrowRight.y, txt_settingText);
            
            //  Set max charge
            if(parentSetting.setting == "Initial Charge"){
                if(setting[0,1] < maxInitCharge) setting[0,1]++ ;
            };
            
            //  Set init charge
            if(parentSetting.setting == "Max Charge"){
                if(setting[1,1] < maxMaxCharge) setting[1,1]++ ;
            };

            //  Set board type
            if(parentSetting.setting == "Board Type"){
                var currentBoard = ds_list_find_index(boardType, setting[2,1]);
                
                if(currentBoard != ds_list_size(boardType) - 1){
                    setting[2,1] = ds_list_find_value(boardType, currentBoard + 1);
                };
            };

        };
    }else{
        with(obj_arrowRight) image_index = 0;
    };
    
    
};
