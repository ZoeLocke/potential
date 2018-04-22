///scr_destroyPiece()


//  Decrease the alpha
if(image_alpha > 0){
    image_alpha -= 0.1;  
}else{
    image_alpha = 0;
};
//  Destroy the piece once the "animation" is complete
if(image_alpha == 0) instance_destroy();

