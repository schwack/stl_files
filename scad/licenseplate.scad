
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
cylinder(22,18,18);
};

//translate([0,50,0]){
difference(){
    all();
    translate([20,20,-1])
    cylinder(37.5,3.5,3.5);
    translate([20,20,-1])
    cylinder(5,6.5,3.5);
    translate([42.5,8,2])
    color("aqua")
    cube([57.5,11,10]);
    translate([45,10.25,-1])
    color("aqua")
    cube([52.5,6.5,10]);
    
    translate([100,30,-1])
    cylinder(15,2.5,2.5);
    translate([100,30,-1])
    cylinder(3,5.5,2.5);

};
//};
//difference(){
//    all();
//    translate([20,20,-1])
//    cylinder(32.5,3.5,3.5);
//    translate([20,20,-1])
//    cylinder(5,6.5,3.5);
//    translate([42.5,21,2])
//    color("aqua")
//    cube([57.5,11,10]);
//    translate([45,23.25,-1])
//    color("aqua")
//    cube([52.5,6.5,10]);
//    translate([100,10,-1])
//    cylinder(15,2.5,2.5);
//    translate([100,10,-1])
//    cylinder(3,5.5,2.5);
//
//};