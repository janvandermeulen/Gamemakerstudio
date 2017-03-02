///scr_use_state
scr_move_state();
    
var xdir = lengthdir_x(8, face*90);
var ydir = lengthdir_y(8, face*90);
var speaker = instance_place(x+xdir,y+ydir,obj_dialog);
//Use the sign
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
}
