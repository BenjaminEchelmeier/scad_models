min = 2;
max = 26;
$fn = 3*max;
layer_height=1.6;
text_height = .2*layer_height;
text_size = 1.5;

for (rad = [min:2:max]) {
    translate([0,0,(max-rad)*layer_height/2]){
        cylinder(r=rad, h=layer_height);
        translate([0,.5-rad,layer_height]){
            linear_extrude(height=text_height)text(text=str(rad), size=text_size);
        }
    }
}


translate([0,3*max-min+1, 0])for (rad = [max:2:max+max-min]) {
    translate([0,0,(2*max-rad-min)*layer_height/2]){
        cylinder(r=rad, h=layer_height);
        translate([0,.5-rad,layer_height]){
            linear_extrude(height=text_height)text(text=str(rad), size=text_size);
        }
    }
}
// text("hello", size=2);
