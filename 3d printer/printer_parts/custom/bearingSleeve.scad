    
$fn=80;
difference(){
    union(){
        cylinder(7,15,15);
        translate([0,0,6.9])
            cylinder(.1,16,16);
        cylinder(.1,16,16);
    };
    cylinder(7,13,13);
    translate([0,0,-1])
        cylinder(1.15,14,14);
    translate([0,0,6.85])
        cylinder (1.11,14,14);
    translate([5,-7,-.5])
        rotate([30,0,0])
            cube([20,16,.2]);
};