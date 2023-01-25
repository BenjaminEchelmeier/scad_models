radius = 2;
depth = 4;
hang = 3;
$fn=100;
//MODEL: 
//translate([0, 0, 5])rotate([90, 0, 0])
{
        difference(){
            cylinder(r=radius + .5, h=depth);
            translate([0,0,-.5]){cylinder(r=radius, h=depth + 1);}
        }
        cylinder(1, radius + 2);
}
//MODEL: 
//translate([0,-1.75,5])rotate([-90, 0, 0])
//PRINT:
translate([0, 7, 0])
{
difference(){
    translate([-radius-1, -radius-1, 0])cube([2*radius+2, 2*radius+4, 1]);
    union(){
        translate([-radius -.5, -radius-3, -.5])cube([2*radius + 1, 2*radius+1, 2]);
        translate([0,0,-1])cylinder(r=radius + .5, h=depth);
    }
}
translate([-radius - 1,4,0])cube([2*radius + 2 + hang, 1, 4]);
difference(){translate([radius + hang,-3,0])
{cube([1, 8, 4]);}
translate([4, 0, 2])rotate([0, 90, 0])
{
translate([0, 2.5, 0])cylinder(3, 1, 1);
translate([0, -1, 0])cylinder(3, 1, 1);}
}
}