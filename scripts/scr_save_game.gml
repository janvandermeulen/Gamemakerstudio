///scr_save_game();

//make sure the player exists
if(!instance_exists(obj_player_stats)) exit;

//create save datastructure
var save_data = ds_map_create();
with(obj_player_stats){
    save_data[? "room"] = previous_room;
    save_data[? "x"] = player_xcurrent;
    save_data[? "y"] = player_ycurrent;
    save_data[? "hp"] = hp;
    save_data[? "maxhp"] = maxhp;
    save_data[? "stamina"] = stamina;
    save_data[? "maxstamina"] = maxstamina;
    save_data[? "expr"] = expr;
    save_data[? "maxexpr"] = maxexpr;
    save_data[? "level"] = level;
    save_data[? "attack"] = attack;
    
}

var file;
var inst_num = instance_number (obj_save_parent);
var n0 = 0;
var n1 = 0;
var inst;
    
while inst_num > 0{
    inst = instance_find(obj_save_parent, inst_num-1);
            
    save_data [? string(n0+n1)] = inst.object_index;
    n1+=1;
    
    save_data [? string(n0+n1)] = inst.phy_position_x;
    n1+=1;
    
    save_data [? string(n0+n1)] = inst.phy_position_y;
    n1+=1;
    
    inst_num-=1
    n0 += 1;
    n1 = 0;
}
//}

var save_string = json_encode(save_data);
ds_map_destroy(save_data);

save_string = base64_encode(save_string);

var file = file_text_open_write(working_directory + "mysavegame.txt");
file_text_write_string(file, save_string)
file_text_close(file)


show_message("Game saved, Yay")

