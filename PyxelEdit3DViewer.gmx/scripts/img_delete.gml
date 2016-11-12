///Load File

surface_free(global.Surface);
for(var i = 0; i < global.animationCount; i++){
    for(var j = 0; j < global.animationLength[i]; j++){
        surface_free(global.animationSurface[i, j]);  
    }
}
