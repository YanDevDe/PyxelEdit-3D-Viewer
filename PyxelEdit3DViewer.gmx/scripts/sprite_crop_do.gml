/// sprite_crop_do(sprite_index, image_index)

var sprite = argument0;
var index = argument1;
var width = sprite_get_width(argument0);
var height = sprite_get_height(argument0);

var sf;
sf = surface_create(width, height);
surface_set_target(sf);
draw_clear_alpha(c_white, 0);
draw_sprite(sprite, index, 0, 0);
surface_reset_target();

var lowestPointX = width;
var lowestPointY = height;
var highestPointX = 0;
var highestPointY = 0;

var color;
var buffer = buffer_create(width*height*4, buffer_fixed, 4);
buffer_get_surface(buffer, sf, 0, 0, 0);
var alpha;
for(var sy = 0; sy < height ; sy++){
    for(var sx = 0; sx < width; sx++){
        color = buffer_read(buffer, buffer_u32);
        alpha = (color >> 24) & 255;        
        if (alpha > 0){            
            if (lowestPointX > sx){
                lowestPointX = sx;
            }
            if (highestPointX < sx){
                highestPointX = sx;
            }
            if (lowestPointY > sy){
                lowestPointY = sy;
            }
            if (highestPointY < sy){
                highestPointY = sy;
            }
        }
    }    
}
buffer_delete(buffer);
surface_free(sf);

var rect;
rect[0] = lowestPointX-1;
rect[1] = lowestPointY-1;
rect[2] = highestPointX;
rect[3] = highestPointY;
return rect;



