///scr_helperFindMarker(cPos)
var cPos = argument0;

//  Loop through each marker on the board to find the right one!
var maxMarkers = instance_number(obj_boardMarker)
var i;
for(i = 0; i < maxMarkers; i++){
    var marker = instance_find(obj_boardMarker, i);
    if(marker.cPos == cPos){
        //  Make the space visible and escape the for loop
        marker.visible = true;
        i = maxMarkers;
    }
}
