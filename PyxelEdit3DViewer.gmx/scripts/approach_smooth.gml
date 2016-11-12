/// approach_smooth(current, target, speed){

var current, target, spd;
current = argument0;
target  = argument1;
spd     = argument2;

var diff = target-current;

if (abs(diff) < 0.0005){
    return target;
}else{
    return current+sign(diff)*abs(diff)*spd;
}

