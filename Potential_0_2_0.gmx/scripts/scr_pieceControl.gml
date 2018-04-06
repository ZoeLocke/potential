///scr_pieceControl(piece);
var piece = argument0;
var marker = instance_place(piece.x, piece.y, obj_boardMarker);
var halfMarker = marker.sprite_width / 2;

//  Check for adjacent cells
//Above left
var checkedMarker = instance_position(marker.bbox_left - 1, marker.bbox_top - 1, obj_boardMarker);
if(checkedMarker != noone) checkedMarker.visible = true;
//Above mid
var checkedMarker = instance_position(marker.x, marker.bbox_top - 1, obj_boardMarker);
if(checkedMarker != noone) checkedMarker.visible = true;
//Above right
var checkedMarker = instance_position(marker.bbox_right + 1, marker.bbox_top - 1, obj_boardMarker);
if(checkedMarker != noone) checkedMarker.visible = true;
//Left
var checkedMarker = instance_position(marker.bbox_left - 1, marker.y, obj_boardMarker);
if(checkedMarker != noone) checkedMarker.visible = true;
//Right
var checkedMarker = instance_position(marker.bbox_right + 1, marker.y, obj_boardMarker);
if(checkedMarker != noone) checkedMarker.visible = true;
//Below left
var checkedMarker = instance_position(marker.bbox_left - 1, marker.bbox_bottom + 1, obj_boardMarker);
if(checkedMarker != noone) checkedMarker.visible = true;
//Below mid
var checkedMarker = instance_position(marker.x, marker.bbox_bottom + 1, obj_boardMarker);
if(checkedMarker != noone) checkedMarker.visible = true;
//Below right
var checkedMarker = instance_position(marker.bbox_right + 1, marker.bbox_bottom + 1, obj_boardMarker);
if(checkedMarker != noone) checkedMarker.visible = true;
