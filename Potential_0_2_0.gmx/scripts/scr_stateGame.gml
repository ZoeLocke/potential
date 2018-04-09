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
/*
//---Interactions with board markers---
var overMarker = instance_place(mouse_x, mouse_y, obj_boardMarker);
var overPiece = instance_place(mouse_x, mouse_y, obj_piece);

if(mouse_check_button_released(mb_left)){
    //  If the mouse is clicked when not over a visible marker, clear board markers and deactivate pieces
    if(!overMarker.visible && overPiece == noone){
        with(obj_boardMarker) visible = false;
        with(obj_piece) active = false;
    }else if(overMarker.visible && overPiece == noone){
    //  If the mouse is clicked over a visible marker, move the active piece (active piece should be set below)
        var xPos = overMarker.x + (overMarker.sprite_width / 2);
        var yPos = overMarker.y + (overMarker.sprite_height / 2);
        
        //  Loop through all pieces to find the active one
        with(obj_piece){
            if(active){
                //  Move the piece to the clicked marker, and update the board grid accordingly
                x = xPos;
                y = yPos;
                
                var gridWidth = ds_grid_height(board);
                var gridHeight = ds_grid_height(board);
                var oldCol = ds_grid_value_x(board, 0, 0, gridWidth, gridHeight, pieceID);
                var oldRow = ds_grid_value_y(board, 0, 0, gridWidth, gridHeight, pieceID);
                
                ds_grid_set(obj_controller.board, oldCol, oldRow, 0);
                ds_grid_set(obj_controller.board, overMarker.col, overMarker.row, pieceID)
            }
        }
    }
};
*/
//---Interactions with game pieces---
if(place_meeting(mouse_x, mouse_y, obj_piece)){
    var piece = instance_place(mouse_x, mouse_y, obj_piece);
    //  Clear existing legal moves and active pieces, and display new ones and activate clicked piece
    if(mouse_check_button_released(mb_left)){
        with(obj_piece) active = false;
        with(obj_boardMarker) visible = false;
        piece.active = true;
        piece.moves = piece.charge;
        scr_displayLegalMoves(piece);
    }    
};

