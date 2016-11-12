///surface_to_grid(array surface)


var arrayGrid = noone;
var arraySurface = argument0;

for(var i = 0; i < array_length_2d(arraySurface, global.index); i++){
    var surf = arraySurface[global.index, i];
    var width = surface_get_width(surf);
    var height = surface_get_height(surf);
    arrayGrid[i] = ds_grid_create(width, height);
    
    var buffer = buffer_create(width*height*4, buffer_fixed, 4);
    buffer_get_surface(buffer, surf, 0, 0, 0);
    var color, alpha;
    
    for(var sy = 0; sy < height; sy++){
        for(var sx = 0; sx < width; sx++){
            color = buffer_read(buffer, buffer_u32);
            ds_grid_set(arrayGrid[i], sx, sy, color);
        }
    }
    
}

return arrayGrid;
