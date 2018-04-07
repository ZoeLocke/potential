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

//---Interactions with board markers---
//  If the mouse is clicked when not over a piece or a visible marker, hide all board markers
//var overPiece = place_meeting(mouse_x, mouse_y, obj_piece);
var overMarker = instance_place(mouse_x, mouse_y, obj_boardMarker)

if(mouse_check_button_released(mb_left)){
    if(!overMarker.visible){
        with(obj_boardMarker) visible = false;
    }
};

//---Interactions with game pieces---
if(place_meeting(mouse_x, mouse_y, obj_piece)){
    var piece = instance_place(mouse_x, mouse_y, obj_piece);
    //  Clear existsing legal moves, and display new ones, when a piece is clicked
    if(mouse_check_button_released(mb_left)){
         with(obj_boardMarker) visible = false;
        scr_displayLegalMoves(piece);
    }    
};
