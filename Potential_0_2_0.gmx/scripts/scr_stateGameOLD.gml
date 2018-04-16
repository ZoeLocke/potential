///scr_stateGame()

    
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
    }
}else{
    obj_transitionButton.image_index = 0;
};

//---Interactions with game pieces---
if(place_meeting(mouse_x, mouse_y, obj_piece)){
    var piece = instance_place(mouse_x, mouse_y, obj_piece);
    //  Clear existing legal moves and active pieces, and display new ones and activate clicked piece
    if(mouse_check_button_released(mb_left)){
        with(obj_piece) active = false;
        with(obj_boardMarker) visible = false;
        piece.active = true;
        piece.moves = piece.charge;
        scr_createLegalMoves(piece);
        with(obj_boardMarker){
            var legal = ds_grid_get(global.legalMoves, col, row);
            if(legal == 1) visible = true;
        }
    }    
};

