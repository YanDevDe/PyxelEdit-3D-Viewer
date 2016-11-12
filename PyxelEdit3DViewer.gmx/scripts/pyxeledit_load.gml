///Load File

zip_unzip(filepath, "data");

file_binary = md5_file(filepath);

file = file_text_open_read("data\docData.json");
file_string ="";



while(!file_text_eof(file)){
    file_string += file_text_readln(file);
}

file_text_close(file);

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

if (file_exists("data\docData.json")){
    var resultMap = json_decode(file_string);
    var animations = ds_map_find_value(resultMap, "animations");
     
    var curr = ds_map_find_first(animations);
    while(is_string(curr)){       
        var aniIndex = ds_map_find_value(animations, curr);
        global.animationBegin[real(curr)] = real(aniIndex[? "baseTile"]);
        global.animationLength[real(curr)] = real(aniIndex[? "length"]);
        global.animationName[real(curr)] = aniIndex[? "name"];
        global.animation = true;
        global.animationCount++;
        
        curr = ds_map_find_next(animations, curr);
    }
    
    var canvas = ds_map_find_value(resultMap, "canvas");
    var layers = canvas[? "layers"];
    global.tileWidth = real(canvas[? "tileWidth"]);
    global.tileHeight = real(canvas[? "tileHeight"]);
    global.width = real(canvas[? "width"]);
    global.height = real(canvas[? "height"]);
    global.Surface = surface_create(global.width, global.height);
    
    surface_set_target(global.Surface);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
    
    var currentLayer = ds_map_find_first(layers);
    while (is_string(currentLayer))
    {
        var layerInfo = ds_map_find_value(layers, currentLayer);
        var hidden = layerInfo[? "hidden"];
        if (!hidden){
            var alpha = layerInfo[? "alpha"];
            var sprite = sprite_add("data\layer"+currentLayer+".png", 1, false, false, 0, 0);
        
        
            surface_set_target(global.Surface);
            draw_sprite_ext(sprite, 0, 0, 0, 1, 1, 0, c_white, alpha/255);
            surface_reset_target();
        
            sprite_delete(sprite);
        }
        currentLayer = ds_map_find_next(layers, currentLayer);
    }
    
    
    
    for(var i = 0; i < global.animationCount; i++){
        for(var j = 0; j < global.animationLength[i]; j++){
            global.animationSurface[i, j] = surface_create(global.tileWidth, global.tileHeight);
            
            var _x, _y;
            
            _x = ((global.animationBegin[i]+j) mod (global.width/global.tileWidth))*global.tileWidth
            _y = ((global.animationBegin[i]+j) div (global.width/global.tileWidth))*global.tileHeight
                        
            surface_copy_part(global.animationSurface[i, j], 0, 0, global.Surface, _x, _y, global.tileWidth, global.tileHeight);
        }
    }
    
    ds_map_destroy(animations);
    ds_map_destroy(layers);
    ds_map_destroy(canvas);
    ds_map_destroy(resultMap);
}
//vertices = noone;
//g = surface_to_grid(global.animationSurface);
//grid_to_voxel(g);


