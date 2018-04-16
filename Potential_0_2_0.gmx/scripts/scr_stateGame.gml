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
//  If a piece is clicked and the pieceLocked variable is false (i.e. the player has not started moving)
if(place_meeting(mouse_x, mouse_y, obj_piece) && !pieceLocked){
    var piece = instance_place(mouse_x, mouse_y, obj_piece);
    //  Clear existing legal moves and active pieces, and display new ones and activate clicked piece
    if(mouse_check_button_released(mb_left)){
        //  Hide all board markers
        with(obj_boardMarker) visible = false;
        
        //  Set all pieces to inactive
        var piecesGridHeight = ds_grid_height(pieces)-1;
        ds_grid_set_region(pieces, 4, 0, 4, piecesGridHeight, 0);
        
        //  Set active piece
        activePiece = piece.pieceID;
        var pieceEntryRow = ds_grid_value_y(pieces, 0, 0, 0, piecesGridHeight, activePiece)
        ds_grid_set(pieces, 4, pieceEntryRow, 1);
        
        scr_createLegalMoves(piece);
        with(obj_boardMarker){
            var legal = ds_grid_get(global.legalMoves, col, row);
            if(legal == 1) visible = true;
        }
        ds_grid_destroy(global.legalMoves);
    }    
};
//  If a legal move space is clicked, move the active piece to the clicked space
var spaceLegal = instance_place(mouse_x, mouse_y, obj_boardMarker).visible

if(spaceLegal){
    var space = instance_place(mouse_x, mouse_y, obj_boardMarker);
    
    //  Adjust board table, adjust moves and charge in piece table 
    if(mouse_check_button_released(mb_left)){                
        //  Find the piece in the pieces table with an Active value of 1
        var activePieceEntryRow = ds_grid_value_y(pieces, 4, 0, 4, ds_grid_height(pieces)-1, 1);
        var activePiece = ds_grid_get(pieces, 0, activePieceEntryRow);
        
        var boardGridWidth = ds_grid_width(board)-1;
        var boardGridHeight = ds_grid_height(board)-1;
        
        
        var currentX = ds_grid_value_x(board, 0, 0, boardGridWidth, boardGridHeight, activePiece);
        var currentY = ds_grid_value_y(board, 0, 0, boardGridWidth, boardGridHeight, activePiece);
        var newX = space.col;
        var newY = space.row;
        
        var prevMoves = ds_grid_get(pieces, 3, activePieceEntryRow);
        
        //  Set charge
        //ds_grid_set(pieces, 
        
        //  Set moves
        ds_grid_set(pieces, 3, activePieceEntryRow, prevMoves+1);
        
        //  Update the board table
        ds_grid_set(board, currentX, currentY, 0);
        ds_grid_set(board, newX, newY, activePiece);
        
        //  Repopulate borad
        var currentMoves = ds_grid_get(pieces, 3, activePieceEntryRow);
        var currentCharge = ds_grid_get(pieces, 2, activePieceEntryRow);
        
        //  Update the display
        if(currentMoves >= currentCharge) ds_grid_set(pieces, 4, activePieceEntryRow, 0);
        scr_displayPopulateBoard();
        
        //  Hide all board markers
        with(obj_boardMarker) visible = false;
        
        if(currentMoves < currentCharge){
            //  Find the active piece's ID and rerun the legal moves script
            var piece = noone;
            with(obj_piece) if(pieceID == activePiece) piece = id;
            
            scr_createLegalMoves(piece);
            with(obj_boardMarker){
                var legal = ds_grid_get(global.legalMoves, col, row);
                if(legal == 1) visible = true;
            }
            ds_grid_destroy(global.legalMoves);
        }else{
            //Otherwise, set moves to 0
            ds_grid_set(pieces, 3, activePieceEntryRow, 0);
        }
    }
};

