///surface_to_obj(array surface, filename)



var arraySurface = argument0;
var filename = argument1;
var filesData = "";
var count = 0;

var nw = "
";

filesData += "# Fake 3D Viewer v1.1 OBJ File: " +nw
filesData += "# www.fake3dviewer.com "+ nw
filesData  += "mtllib test.mtl " + nw
filesData  += "o Caro" + nw;

for(var i = 0; i < array_length_2d(arraySurface, global.index); i++){
    var surf = arraySurface[global.index, i];
    var width = surface_get_width(surf);
    var height = surface_get_height(surf);
    
    var buffer = buffer_create(width*height*4, buffer_fixed, 4);
    buffer_get_surface(buffer, surf, 0, 0, 0);
    var color, alpha;
    
    for(var sy = 0; sy < height; sy++){
        for(var sx = 0; sx < width; sx++){
            
            color = buffer_read(buffer, buffer_u32);
            
            alpha = (color >> 24) & 255;
            if (alpha > 0){
                
                filesData  +=  "v " + string(sx+0.5) + " " + string(sy-0.5) + " " + string(i-0.5) + nw;
                filesData  +=  "v " + string(sx+0.5) + " " + string(sy-0.5) + " " + string(i+0.5) + nw;
                filesData  +=  "v " + string(sx-0.5) + " " + string(sy-0.5) + " " + string(i+0.5) + nw;
                filesData  +=  "v " + string(sx-0.5) + " " + string(sy-0.5) + " " + string(i-0.5) + nw;
                filesData  +=  "v " + string(sx+0.5) + " " + string(sy+0.5) + " " + string(i-0.5) + nw;
                filesData  +=  "v " + string(sx+0.5) + " " + string(sy+0.5) + " " + string(i+0.5) + nw;
                filesData  +=  "v " + string(sx-0.5) + " " + string(sy+0.5) + " " + string(i+0.5) + nw;
                filesData  +=  "v " + string(sx-0.5) + " " + string(sy+0.5) + " " + string(i-0.5) + nw;
                
                filesData  += "vn " + string(0)  + " " + string(-1) + " " + string(0) + nw;
                filesData  += "vn " + string(0)  + " " + string(1)  + " " + string(0) + nw;
                filesData  += "vn " + string(1)  + " " + string(0)  + " " + string(0) + nw;
                filesData  += "vn " + string(0)  + " " + string(0)  + " " + string(1) + nw;
                filesData  += "vn " + string(-1) + " " + string(-1) + " " + string(0) + nw;
                filesData  += "vn " + string(0)  + " " + string(0)  + " " + string(-1)+ nw;
                
                
                filesData  += "usemtl Material." + string(count) + nw;
                filesData  += "s off " + nw
                filesData  += "f " + string(1+(8*count)) + "//1 " + string(2+(8*count)) + "//1 " + string(3+(8*count)) + "//1 " + string(4+(8*count)) + "//1 " + nw;
                filesData  += "f " + string(5+(8*count)) + "//2 " + string(8+(8*count)) + "//2 " + string(7+(8*count)) + "//2 " + string(6+(8*count)) + "//2 " + nw;
                filesData  += "f " + string(1+(8*count)) + "//3 " + string(5+(8*count)) + "//3 " + string(6+(8*count)) + "//3 " + string(2+(8*count)) + "//3 " + nw;
                filesData  += "f " + string(2+(8*count)) + "//4 " + string(6+(8*count)) + "//4 " + string(7+(8*count)) + "//4 " + string(3+(8*count)) + "//4 " + nw;
                filesData  += "f " + string(3+(8*count)) + "//5 " + string(7+(8*count)) + "//5 " + string(8+(8*count)) + "//5 " + string(4+(8*count)) + "//5 " + nw;
                filesData  += "f " + string(5+(8*count)) + "//6 " + string(1+(8*count)) + "//6 " + string(4+(8*count)) + "//6 " + string(8+(8*count)) + "//6 " + nw;
                count++;
            }
        }
    }
    

}

var file;
file = file_text_open_write(filename);
file_text_write_string(file, filesData);
file_text_close(file);

