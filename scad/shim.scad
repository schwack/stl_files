
$fn=50;

difference(){
    cylinder(5,12,12);
    translate([7,0,-1])cylinder(7,3,3);
    translate([-7,0,-1])cylinder(7,3,3);
    translate([0,-7,-1])cylinder(7,3,3);
    translate([0,7,-1])cylinder(7,3,3);
    translate([0,0,-1])cylinder(7,2.5,2.5);
    translate([6,6,-1])cylinder(7,2,2);
    translate([-6,6,-1])cylinder(7,2,2);
    translate([6,-6,-1])cylinder(7,2,2);
    translate([-6,-6,-1])cylinder(7,2,2);
    
};