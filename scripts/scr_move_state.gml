///scr_move_state();
movement = MOVE;
if(obj_input.dash_key)
{
    var xdir = lengthdir_x(8,face*90);
    var ydir = lengthdir_y(8,face*90);
    var speaker = instance_place(x+xdir,y+ydir,obj_speaker);
    if(speaker != noone)
    {
        //talk to sign
        with(speaker)
        {
            if(!instance_exists(obj_dialog))
            {
                dialog = instance_create(x+xoffset,y+yoffset,obj_dialog);
                dialog.text = text;
            } else
            {
                dialog.text_page ++;
                dialog.text_count = 0;
                if(dialog.text_page > array_length_1d(dialog.text)-1)
                {
                    with(dialog)
                    {
                        instance_destroy();    
                    }
                }
            }
        }
    }else if (obj_player_stats.stamina >= DASH_COST)
    {    
        state = scr_dash_state;
        alarm[0] = room_speed / 7;
        obj_player_stats.stamina -= DASH_COST;
        obj_player_stats.alarm[0] = room_speed * obj_player_stats.staminaregen
    }
}
if (obj_input.spell_key)
{
    
    var p = instance_create(x,y,obj_projectile);
    var xforce = lengthdir_x(20,dir);
    var yforce = lengthdir_y(20,dir);
    p.creator = id;

    with(p)
    {
        physics_apply_impulse(x,y,xforce,yforce)
    }
}

if (obj_input.attack_key && obj_player_stats.stamina >= ATTACK_COST)
{
    image_index = 0;
    state = scr_attack_state;
    obj_player_stats.stamina -= ATTACK_COST;
    obj_player_stats.alarm[0] = room_speed * obj_player_stats.staminaregen
    
}

//get direction

dir = point_direction(0,0,obj_input.xaxis,obj_input.yaxis);

//get length

if (obj_input.xaxis == 0 && obj_input.yaxis == 0)
    {
        len = 0;
        
    } 
else 
    {
        len = spd;
        scr_get_face(dir);
    }

//Get the hspeed and vspeed

hspd = lengthdir_x (len,dir);
vspd = lengthdir_y (len,dir);

//move
phy_position_x += hspd;
phy_position_y += vspd;

//make sure dir stays the same with no input
if(obj_input.xaxis != 0  or obj_input.yaxis != 0){
    dir_previous = dir;
} else {

    dir = dir_previous;
}


//control the sprite
image_speed = .2;
if (len == 0)
{
image_index = 0;
}

if (len != 0)
{
    //control the sprite
    
}
