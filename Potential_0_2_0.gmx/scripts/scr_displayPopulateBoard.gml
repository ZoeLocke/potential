///scr_displayPopulateBoard()
var startX = obj_board.x;
var startY = obj_board.y;
var markerSize = sprite_get_width(spr_boardMarker);

var i;
var j;
for(i = 0; i < 10; i++){
    for(j = 0; j < 10; j++){
        var xPos = startX + (markerSize * j + 1);
        var yPos = startY + (markerSize * i + 1);
        
        //  Generate the cpos as row + (col * 10)
        var cPos = scr_calculateCPos(j, i);
        var gridHeight = ds_grid_height(pieces) - 1
        var pieceEntry;
        
        //  Set the pieceEntry variable with the relvent row position of the piece in the ds_grid if there is one at the current cPos
        if(ds_grid_value_exists(pieces, 4, 0, 4, gridHeight, cPos)){
            pieceEntry = ds_grid_value_y(pieces, 4, 0, 4, gridHeight, cPos);
        }else{
            pieceEntry = noone;
        };
        
        //  Create a marker at the current position, and set it's variables
        var marker = instance_create(xPos, yPos, obj_boardMarker);
        marker.row = i;
        marker.col = j;
        marker.cPos = cPos;    
        
        //  If there is supposed to be a piece at the current position, create a piece and set it's variables
        if(pieceEntry != noone){
            xPos = marker.x + (markerSize / 2);
            yPos = marker.y + (markerSize / 2);
            
            var piece = instance_create(xPos, yPos, obj_piece);
            piece.pieceID = ds_grid_get(pieces, 0, pieceEntry);
            piece.charge = ds_grid_get(pieces, 5, pieceEntry);
            piece.image_index = ds_grid_get(pieces, 1, pieceEntry);
        };    
    };
};
