/// approach(value, goal, step)
gml_pragma("forceinline");
if (argument0 < argument1) {
    argument0 += argument2;
    if (argument0 > argument1) {
        return argument1;
    } else return argument0;
} else {
    argument0 -= argument2;
    if (argument0 < argument1) {
        return argument1;
    } else return argument0;
}
