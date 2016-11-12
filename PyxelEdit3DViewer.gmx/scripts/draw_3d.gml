///draw_3d(x,y,rotation, scale)

var _x = argument0;
var _y = argument1;
var _dir = argument2;
var _scale = argument3;

if (is_array(global.animationName)){
    if (!pixelated){

            for(var j = 0; j < global.animationLength[global.index]; j++){
                if (!surface_exists(global.animationSurface[global.index, j])){
                    img_delete();
                    pyxeledit_load();
                }
                if (fixEdge){
                    for(var m = _scale*global.heightPixel; m >= 0; m--){
                        draw_surface_rotate_center(global.animationSurface[global.index, j], _x, _y+m-(j*_scale)*global.heightPixel, _dir, _scale);
                    }
                }else{
                    draw_surface_rotate_center(global.animationSurface[global.index, j], _x, _y-(j*_scale)*global.heightPixel, _dir, _scale);
                }
            
            }
        
    }else{
        if (!surface_exists(surf)){
            surf = surface_create(view_wview[0], view_hview[0]);
        }
        surface_set_target(surf);
        draw_clear_alpha(c_white, 0);

            for(var j = 0; j < global.animationLength[global.index]; j++){
                if (!surface_exists(global.animationSurface[global.index, j])){
                    img_delete();
                    pyxeledit_load();
                }
                draw_surface_rotate_center(global.animationSurface[global.index, j], (surface_get_width(surf)/2)+ ((global.index * (view_wview[0]))) + (global.posX/_scale), (surface_get_height(surf)/2)-(j*global.heightPixel),_dir, 1);
            }
        
        surface_reset_target();

        draw_surface_ext(surf, _x-(surface_get_width(surf)/2)*_scale, _y-(surface_get_height(surf)/2)*_scale, _scale, _scale, 0, c_white, 1);
    }
}

       // draw_surface_ext(surf, (-(surface_get_width(surf)/2)*scale)+view_wview[0]/2,(-(surface_get_height(surf)/2)*scale)+view_hview[0]/2, scale, scale, 0, c_white, 1);

