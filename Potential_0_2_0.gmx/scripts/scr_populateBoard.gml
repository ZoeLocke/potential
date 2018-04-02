///scr_populateBoard()
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
        var cPos = j + (i * 10);
        var maxY = ds_grid_height(pieces) - 1
        var pieceEntry;
        
        //  Set the pieceEntry variable with the relvent position of the piece in the ds_grid if there is one at the current cPos
        if(ds_grid_value_exists(pieces, 4, 0, 4, maxY, cPos)){
            pieceEntry = ds_grid_value_y(pieces, 4, 0, 4, maxY, cPos);
        }else{
            pieceEntry = noone;
        };
        
        var marker = instance_create(xPos, yPos, obj_boardMarker);
        marker.row = i;
        marker.col = j;    
        
        if(pieceEntry != noone){
            xPos = marker.x + (markerSize / 2);
            yPos = marker.y + (markerSize / 2);
            
            var piece = instance_create(xPos, yPos, obj_piece);
            charge = ds_grid_get(pieces, 5, pieceEntry);
            image_index = ds_grid_get(pieces, 1, pieceEntry);
        };    
    };
};














/*
var i;
var j;
for(i = 0; i < 10; i++){
    for(j = 0; j < 10; j++){
        var xPos = startX + (markerSize * j + 1);
        var yPos = startY + (markerSize * i + 1);
        var marker = (instance_create(xPos, yPos, obj_boardMarker)){
        marker.row = i;
        marker.col = j;        
        };
    };
};

//  Loop through all squares on the board, adding a piece where needed
//  Loop rows
for(i = 0; i < 10; i++){
    //  Loop columns
    for(j = 0; j < 10; j++){
        //  Set x and y positions as top corner of board, plus the with of the marker, plus half again
        var xPos = startX + (markerSize * j + 1) + (markerSize / 2);
        var yPos = startY + (markerSize * i + 1) + (markerSize / 2);
        
        //  Generate the cpos as row + (col * 10)
        var cPos = j + (i * 10);
        var maxY = ds_grid_height(pieces) - 1
        var pieceEntry
        
        //  Set the pieceEntry variable with the relvent position of the piece in the ds_grid if there is one at the current cPos
        if(ds_grid_value_exists(pieces, 4, 0, 4, maxY, cPos)){
            pieceEntry = ds_grid_value_y(pieces, 4, 0, 4, maxY, cPos);
        }else{
            pieceEntry = 100;
        };
        
        //  Create a piece at the current position
        if(pieceEntry != 100){
            with(instance_create(xPos, yPos, obj_piece)){
                charge = ds_grid_get(pieces, 5, pieceEntry);
                image_index = ds_grid_get(pieces, 1, pieceEntry);
            };
        };
    };
};
*/
