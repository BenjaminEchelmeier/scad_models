$fn=100;
frame_width = 127;
frame_height = 177.8;
ring_depth = 2;
ring_width=2;
clip_len = 20;
clip_heigth = 1;
clip_width=3;
clip_v_angle = 20;
clip_h_angle = 10;


module mirror_copy(vec=[1,0,0])
{
    children();
    mirror(vec) children();
}


difference(){
    union(){
        cube([frame_width, frame_height, ring_depth], center=true);

        mirror_copy()mirror_copy([0,1,0])translate([frame_width/2-ring_width, frame_height/4, clip_heigth/2-ring_depth/2])rotate([clip_v_angle,0,-clip_h_angle])
        {cylinder(r=4);
        }
        // // length clips
        // {
        //     union(){
        //         cube([ring_width, clip_len, clip_heigth],center=false);
        //         translate([clip_width/2,5/8*clip_len,0])minkowski()
        //                     {
        //                     cube([clip_width/2,clip_len*3/8,clip_heigth/2], center=false);
        //                     cylinder(r=clip_width/2,h=clip_heigth/2, center=false);
        //                     }
        //         translate([0,7/8*clip_len-clip_heigth,2])rotate([0,90,0])minkowski()
        //                     {
        //                     cube([clip_heigth,clip_len/8,.5], center=false);
        //                     cylinder(r=clip_heigth/2,h=.5, center=false);
        //                     }
        //     }
        // }
        // mirror_copy()mirror_copy([0,1,0])translate([frame_width/4, frame_height/2-ring_width, clip_heigth/2-ring_depth/2])rotate([clip_v_angle,0,90-clip_h_angle])
        // // length clips
        // {
        //     union(){
        //         cube([ring_width, clip_len, clip_heigth],center=false);
        //         translate([clip_width/2,5/8*clip_len,0])minkowski()
        //                     {
        //                     cube([clip_width/2,clip_len*3/8,clip_heigth/2], center=false);
        //                     cylinder(r=clip_width/2,h=clip_heigth/2, center=false);
        //                     }
        //         translate([0,7/8*clip_len-clip_heigth,2])rotate([0,90,0])minkowski()
        //                     {
        //                     cube([clip_heigth,clip_len/8,.5], center=false);
        //                     cylinder(r=clip_heigth/2,h=.5, center=false);
        //                     }
        //     }
        // }
    }
    cube([frame_width-2*ring_width, frame_height-2*ring_width, ring_depth+1], center=true);
};
