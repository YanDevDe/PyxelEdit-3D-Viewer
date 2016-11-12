/// sprite_crop_sprite(sprite)
if(sprite_exists(argument0)){
    for(var c = 0; c < sprite_get_number(argument0); c++){
        global.spriteMapCropped[? string(argument0)+"-"+string(c)] = sprite_crop_do(argument0, c);
    }
}
