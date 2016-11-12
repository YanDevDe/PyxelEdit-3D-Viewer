///Load File

file_binary = md5_file(filepath);

global.animation = false;
global.layerSurface = noone;
global.Surface = noone;
global.frame = 0;

global.animationBegin = noone;
global.animationLength = noone;
global.animationName = noone;
global.animationCount = 0;
global.animationSurface = noone;

global.tileWidth = noone;
global.tileHeight = noone;
global.width = noone;
global.height = noone;

var sprite = sprite_add(filepath, 0,  0, 0, 0, 0);

global.tileWidth = sprite_get_width(sprite);
global.tileHeight = sprite_get_height(sprite);
global.width = global.tileWidth;
global.height = global.tileHeight;
global.index = 0;



for(var i = 0; i < sprite_get_number(sprite); i++){
    global.animationSurface[0, i] = surface_create(global.tileWidth, global.tileHeight);
    surface_set_target(global.animationSurface[0, i]);
    draw_clear_alpha(c_black, 0);
    draw_sprite(sprite, i, 0, 0);
    surface_reset_target();
}

global.animationBegin[0] = 0;
global.animationLength[0] = sprite_get_number(sprite);
show_debug_message(sprite_get_number(sprite));
global.animationName[0] = global.imageName;
global.animation = true;
global.animationCount++;


sprite_delete(sprite);


//vertices = noone;
//g = surface_to_grid(global.animationSurface);
//grid_to_voxel(g);


