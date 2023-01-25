radius = 4.75;
depth = 10;
hang = 6;
nail_size = 7;
base_size = nail_size + 4;
lift = 7;
$fn=100;

module copy_mirror(vec=[1,0,0])
{
    children();
    mirror(vec) children();
}

copy_mirror()translate([-(radius+hang+4), -(2*radius+hang), 0]){
//MODEL: 
//translate([0, 0, radius+ 8])rotate([90, 0, 0])
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


translate([0, 2*radius+lift, 0])
{
    //hanger hook
    difference(){
        translate([-radius-3, -radius+3-lift, 0])cube([2*radius+6, 2*radius+2+lift, 2]);
        union()translate([0,-lift+4,0]){
            translate([-radius -1, -2*radius-1, -.5])cube([2*radius + 2, 2*radius+1, 3]);
            translate([0,0,-1])cylinder(r=radius + 1, h=depth);
        }
    }
    //hanger base
    translate([-radius - 3,radius+5,0]){
        cube([2*radius + 5 + hang, 2, base_size]);
        // Nail holder
        translate([2*radius + 3 + hang, 2- 2*base_size,1])difference(){
            cube([2,  2*base_size, base_size-1]);
            translate([-1, base_size/2, base_size/2])rotate([0, 90, 0])
            {
                translate([0, base_size -1.5, 0])cylinder(4, nail_size/2, nail_size/2);
                translate([0, 0,  0])cylinder(4, nail_size/2, nail_size/2);}
            }
}}

//MODEL: 
//translate([0, 0, radius+ 8])rotate([90, 0, 0])
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
translate([0, 2*radius+lift, 0])
{
    //hanger hook
    difference(){
        translate([-radius-3, -radius+3-lift, 0])cube([2*radius+6, 2*radius+2+lift, 2]);
        union()translate([0,-lift+4,0]){
            translate([-radius -1, -2*radius-1, -.5])cube([2*radius + 2, 2*radius+1, 3]);
            translate([0,0,-1])cylinder(r=radius + 1, h=depth);
        }
    }
    //hanger base
    translate([-radius - 3,radius+5,0]){
        cube([2*radius + 5 + hang, 2, base_size]);
        // Nail holder
        translate([2*radius + 3 + hang, 2- 2*base_size,1])difference(){
            cube([2,  2*base_size, base_size-1]);
            translate([-1, base_size/2, base_size/2])rotate([0, 90, 0])
            {
                translate([0, base_size -1.5, 0])cylinder(4, nail_size/2, nail_size/2);
                translate([0, 0,  0])cylinder(4, nail_size/2, nail_size/2);}
            }
}}
}
