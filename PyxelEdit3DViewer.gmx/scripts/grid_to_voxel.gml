///grid_to_voxel(grid);

var grid = argument0;

var numb = 0;
numI = 0;
for(var _z = 0; _z < array_length_1d(grid); _z++){
    var g = grid[_z];
    numb = 0;
    keepY = false;
    vertices[_z] = ds_list_create();
    
    for(var _y = 0; _y < ds_grid_height(g); _y++){
        keepX = false;
        
        for(var _x = 0; _x < ds_grid_width(g); _x++){
            
            
            if (g[# _x, _y] > 0){
                if (!keepX){
                    ds_list_add(vertices[_z], string(_x) + "|" + string(_y));
                    keepX = true;
                }
            }else{
                if (keepX){
                    ds_list_add(vertices[_z], string(_x) + "|" + string(_y));
                    keepX = false;
                }
            }
        }
        
        if (keepX){
            ds_list_add(vertices[_z], string(_x) + "|" + string(_y));
        }
    }
    
    for(var _x = 0; _x < ds_grid_width(g)+1; _x++){
        keepY = false;
        for(var _y = 0; _y < ds_grid_height(g)+1; _y++){
            
            var index = ds_list_find_index(vertices[_z], string(_x) + "|" + string(_y))
            if (index != -1){
                if (!keepY){
                    keepY = true;
                }else{
                    ds_list_delete(vertices[_z], index);
                }
            }else{
                if (keepY){
                    ds_list_add(vertices[_z], string(_x) + "|" + string(_y));
                    keepY = false;   
                }
            }
        }
                
    }
    
}



