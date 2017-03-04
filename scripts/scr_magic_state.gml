///scr_magic_state
var p = instance_create(x,y,obj_projectile);
var xforce = lengthdir_x(20,dir);
var yforce = lengthdir_y(20,dir);
p.creator = id;

with(p)
{
    physics_apply_impulse(x,y,xforce,yforce)
}
    
