radius = 4.75;
hang = 6;
nail_size = 5;
screw_size = 4.5;
scew_head_size =7.75;
clip_size = nail_size + 8;
depth = clip_size;

nail_gap = 0;
lift = 10;
nail_head = nail_size*1.25;
$fn=50;

module mirror_copy(vec=[1,0,0])
{
    children();
    mirror(vec) children();
}



// mirror_copy()mirror_copy([0,1,0])
translate([-(radius+hang+4), -2*(2*radius+hang), 0])
{

translate([0,0,1]){
    //cap
    difference(){
        cylinder(r=radius + 1, h=depth);
        translate([0,0,-.5]){cylinder(r=radius, h=depth + 1);}
    }
    cylinder(1, radius + 2, radius/2);
    translate([0,0,-1])cylinder(1, radius + 2,radius + 2);
}
//MODEL: 
//translate([0,-2.75,radius + 7])rotate([-90, 0, 0])
//PRINT:
difference(){translate([0, 2*radius+lift, 0])
{
    //hanger hook
    difference(){
        translate([-radius-6, -radius+3-lift, 0])
            cube([2*radius+9, 2*radius+4+lift, clip_size]);
        union()translate([0,-lift+4,0]){
            translate([-radius -1, -2*radius-1, -.5])difference(){
                difference(){
                    cube([2*radius + 2, 1.5*radius+1, clip_size+1]);
                    translate([radius+1, radius*1.4])mirror_copy()translate([radius*2.15,0, -.5])
                    cylinder(r=radius*1.1, h = clip_size + 2);
                };
                        cylinder(r=1, h = clip_size);};
            translate([0,0,-1])cylinder(r=radius + 1, h=clip_size+2);
        }
    }
    //hanger base
    translate([-radius - 3,radius+5,0]){
        cube([2*radius + 5 + hang, 2, clip_size]);
        // Nail holder
        translate([2*radius + 3 + hang, 2- 2*clip_size]){
            cube([2,  2*clip_size, clip_size]);
            }
    }
    //Fill Gap
    translate([2*radius  + hang-radius-3, 3*radius- 2*clip_size]){
            cube([3,  3, clip_size]);
            }
    
};

union(){
    //BIG SQUARE MINUS CIRCLE
    translate([(radius+hang-3), (2.9*radius), -.5])difference(){
        cube(2*(lift + 2*radius), center=true);
        union(){
            translate([radius/4, 0])cylinder(r=lift + 1.6*radius, h=depth + 1);
            cube(2*(lift + 2*radius));
        }
    };
    
            // #translate([(radius+hang-3), (2*radius), -5.5])difference(){
            //     cylinder(r=lift + 2*radius, h=depth + 1);
            //     translate([2+lift/2, 0, depth]){
            //         cube([2*radius,2*(2*radius + 5 + hang), 2*depth], center=true);
            //     }
            // }
//BIG CIRCLE
// translate([(radius+hang-3), (2*radius), -.5])difference(){
//     cube(2*(lift + 2*radius), center=true);
//     cylinder(r=lift + 2*radius, h=depth + 1);
//     };

    translate([radius + hang-40, 7 - 1.5*clip_size + 3*radius + lift, clip_size/2])
    {
        rotate([0, 90, 0])
            union(){
                translate([0, clip_size -1.5, 0])cylinder(44, screw_size/2, screw_size/2);
                translate([0, 0, 0])cylinder(44, screw_size/2, screw_size/2);
                translate([0, clip_size -1.5, 0])cylinder(40, scew_head_size/2, scew_head_size/2);
                translate([0, 0, 0])cylinder(40, scew_head_size/2, scew_head_size/2);
            }
        }
    }
}}
            
