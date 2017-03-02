///scr_dash_state();
scr_get_face(face);
show_debug_message(face);
movement = MOVE;
len = spd*4;

if (len == 0) 
{
dir = face;
}
len = spd*4;

//Get the hspeed and vspeed

hspd = lengthdir_x (len,dir);
vspd = lengthdir_y (len,dir);

//move
phy_position_x += hspd;
phy_position_y += vspd;

//create a dash effect
var dash = instance_create(x,y,obj_dash_effect);
dash.sprite_index = sprite_index;
dash.image_index = image_index;

