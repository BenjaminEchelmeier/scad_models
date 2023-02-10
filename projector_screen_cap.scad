$fn=100;
radius = 17.9;
diameter = 2*radius;
height = 7.7;
depth = 16;
pipe_thickness = 1.35;
insert_rad = radius- pipe_thickness;
translate([0,0,depth]){
cylinder(r=radius, h=height);
translate([0,0,2-depth])cylinder(r=insert_rad,  h=depth-2);
translate([0,0,-depth])cylinder(r1=insert_rad-1, r2=insert_rad, h=2);
cube_rad = insert_rad*1.45;
translate([0,0,(-depth+3)/2]){
    cube([cube_rad, cube_rad, depth-2], center=true);
    rotate(30)cube([cube_rad, cube_rad, depth-2], center=true);
    rotate(60)cube([cube_rad, cube_rad, depth-2], center=true);
}
difference(){
    translate([0,0,height])sphere(r=radius);
    translate([0,0,height+radius*.9])cylinder(r=radius, h=.2*radius);
}
};
