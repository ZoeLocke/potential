///scr_displayLegalMoves(piece)
var gridHeight = ds_grid_height(pieces);
var piece = argument0;
var piecePos = ds_grid_value_y(pieces, 0, 0, 0, gridHeight, piece.pieceID); 
var col = ds_grid_get(pieces, 3, piecePos);
var row = ds_grid_get(pieces, 2, piecePos);
var cPos = ds_grid_get(pieces, 4, piecePos);

//---Check each notional adjacent space for legal moves---
var targetCol;
var targetRow;
var targetCPos;
var validSpace;
var emptySpace;

//  Above Left
targetCol = col - 1;
targetRow = row - 1;
targetCPos = scr_calculateCPos(targetCol, targetRow);

//  IF the space is valid
if(targetCPos >= 0 && targetCPos <= 99){
    //  If there is no piece in the space
    if(!ds_grid_value_exists(pieces, 4, 0, 4, gridHeight, targetCPos)){
        
        //  Loop through each marker on the board to find the right one!
        var maxMarkers = instance_number(obj_boardMarker)
        var i;
        for(i = 0; i < maxMarkers; i++){
            var marker = instance_find(obj_boardMarker, i);
            if(marker.cPos == targetCPos){
                //  Make the space visible and escape the for loop
                marker.visible = true;
                i = maxMarkers;
            }
        }
    
    }else{
        //  If there is a piece in the space
        var jumpCol = targetCol - 1;
        var jumpRow = targetRow - 1;
        var jumpCPos = scr_calculateCPos(jumpCol, jumpRow);
        //  The jump position is a valid space
        if(jumpCPos >= 0 && jumpCPos <= 99){
            //  If there is no piece in the jump position space
            if(!ds_grid_value_exists(pieces, 4, 0, 4, gridHeight, jumpCPos)){
                    
                //  Loop through each marker on the board to find the right one!
                var maxMarkers = instance_number(obj_boardMarker)
                var i;
                for(i = 0; i < maxMarkers; i++){
                    var marker = instance_find(obj_boardMarker, i);
                    if(marker.cPos == jumpCPos){
                        //  Make the marker visible and escape the for loop
                        marker.visible = true;
                        i = maxMarkers;
                    }
                }
            }
        }
    }
};


    
