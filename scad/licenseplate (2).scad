
module all(){
difference(){
color("red")
cube([120,40,22.5]);
    translate([-2,-1,12.5])
rotate([0,4,0])
color("blue")
cube([130,45,20]);
};
translate([20,20,0])
color ("green")
cylinder(20,18,18);
};

translate([0,50,0]){
difference(){
    all();
    translate([20,20,-1])
    cylinder(32.5,3.5,3.5);
    translate([20,20,-1])
    cylinder(5,6.5,3.5);
    translate([50,8,3.5])
    color("aqua")
    cube([50,11,10]);
    translate([52.5,10.25,-1])
    color("aqua")
    cube([45,6.5,10]);

};};
difference(){
    all();
    translate([20,20,-1])
    cylinder(32.5,3.5,3.5);
    translate([20,20,-1])
    cylinder(5,6.5,3.5);
    translate([50,21,3.5])
    color("aqua")
    cube([50,11,10]);
    translate([52.5,23.25,-1])
    color("aqua")
    cube([45,6.5,10]);

};