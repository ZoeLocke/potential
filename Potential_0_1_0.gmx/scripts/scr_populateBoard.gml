///scr_populateBoard()
//Populate board with snap guides
var i;
var j;
for(i = 0; i < 10; i++) {
    for(j = 0; j < 10; j++) {
        instance_create(
            480 + (obj_snapGuide.sprite_width * i)
            ,128 + (obj_snapGuide.sprite_height * j)
            ,obj_snapGuide
        );
    }
}
