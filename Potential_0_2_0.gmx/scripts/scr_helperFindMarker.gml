///scr_helperFindMarker(row, col)
var row = argument0;
var col = argument1;

//  Loop through each marker on the board to find the right one!
var i;
var j;
for(i = 0; i < 10; i++){
    for(j = 0; j < 10; j++){
        var markerPos = j + (i * 10);
        var marker = instance_find(obj_boardMarker, markerPos);
        if(marker.row == row && marker.col == col){
            //  Make the space visible and escape the for loop
            marker.visible = true;
            j = 10;
            i = 10;
        }
    }
};
