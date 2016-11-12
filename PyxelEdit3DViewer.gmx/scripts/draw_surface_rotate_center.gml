///draw_surface_rotate_center(id, x, y, rot, scale);

var xoffset, yoffset, rad, xorg, yorg;
// Calculate the "origin" (which is the center of the surface)
xoffset = surface_get_width(argument0) / 2;
yoffset = surface_get_height(argument0) / 2;
// Rotate the top left corner (0, 0) around the origin:
// it is identical to rotating the origin around (0, 0).
// Note that the y-axis is upside-down in the math world
// (y increases when you go upward, contrary to the game world.)
// So we have to invert y value twice:
// 1st when putting yoffset into an equation,
// 2nd when getting the outcome of yorg.
rad = degtorad(argument3); // Convert it to radian for convenience
xorg = cos(rad)*xoffset + sin(rad)*yoffset;
yorg = -sin(rad)*xoffset + cos(rad)*yoffset;
// Now draw the surface
draw_surface_ext(argument0, argument1 - (xorg*argument4), argument2 - (yorg*argument4), argument4, argument4, argument3, c_white, 1);
