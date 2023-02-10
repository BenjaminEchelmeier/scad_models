radius = 4.75;
hang = 6;
nail_size = 5;
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
        translate([-radius-3, -radius+3-lift, 0])
            cube([2*radius+6, 2*radius+2+lift, clip_size]);
        union()translate([0,-lift+4,0]){
            translate([-radius -1, -2*radius-1, -.5])difference(){
                difference()
{
    cube([2*radius + 2, 1.5*radius+1, clip_size+1]);
translate([radius+1, radius*1.4])mirror_copy()translate([radius*2.15,0, -.5])
    cylinder(r=radius*1.1, h = clip_size + 2);
    
}
;
                cylinder(r=1, h = clip_size);};
            translate([0,0,-1])cylinder(r=radius + 1, h=clip_size+2);
        }
    }
    //hanger base
    translate([-radius - 3,radius+5,0]){
        cube([2*radius + 5 + hang, 2, clip_size]);
        // Nail holder
        translate([2*radius + 3 + hang, 2- 2*clip_size])difference(){
            cube([2,  2*clip_size, clip_size]);
            translate([-1, clip_size/2, clip_size/2])rotate([0, 90, 0])
            {
                translate([0, clip_size -1.5, 0])cylinder(4, nail_size/2, nail_size/2);
                translate([0, 0,  0])cylinder(4, nail_size/2, nail_size/2);}
            }
}};
union(){
    //BIG SQUARE MINUS CIRCLE
    translate([(radius+hang-3), (2*radius), -.5])difference(){
    cube(2*(lift + 2*radius), center=true);
    cylinder(r=lift + 2*radius, h=depth + 1);
    };
rotate([0, 90, 0])
            {
                translate([0, clip_size -1.5, 0])cylinder(radius*2+hang+6, nail_head/2, nail_head/2);
                cylinder(radius*2+hang+6, nail_head/2, nail_head/2);
            };translate([(radius+hang-3), (2*radius), -5.5])cylinder(r=lift + 2*radius, h=depth + 1);}}
//BIG CIRCLE
// translate([(radius+hang-3), (2*radius), -.5])difference(){
//     cube(2*(lift + 2*radius), center=true);
//     cylinder(r=lift + 2*radius, h=depth + 1);
//     };

}
            
