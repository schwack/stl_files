import("C:/Mcam9/Data/CUP.STL");

$fn=40;



module a(){
color("green")
rotate_extrude(angle = 45, convexity = 10)
translate([17.3, 0, 0])
circle(r = 1);
};

translate([0,0,12.5])a();

