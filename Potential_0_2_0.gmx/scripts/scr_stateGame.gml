///scr_stateGame()

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
