///scr_move_state
scr_get_input();

// Get the axis
var xaxis = (right_key - left_key);
var yaxis = (down_key - up_key);

// Get direction

var dir = point_direction(0, 0, xaxis, yaxis);

//Get the length
if (xaxis == 0 and yaxis == 0) {
    len = 0;
} else {
    len = spd;
}
//get the hspd and the vspd
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

//move
phy_position_x += hspd;
phy_position_y += vspd;

//h
image_speed = sign(len)*0.2

//Vertical sprites
if (len == 0) image_index = 0;

if (vspd > 0) {
    sprite_index = Spr_Player_Down;
} else if (vspd < 0) {
    sprite_index = Spr_Player_Up;
}

//Horizontal sprites
if (hspd > 0) {
    sprite_index = Spr_Player_Right;
} else if (hspd < 0) { 
sprite_index = Spr_Player_Left;
}
