$fn=50;
difference (){
import("C:/Mcam9/Data/FAN_BRACKETS.STL");
   rotate([90,90,0])translate([-10,0,-5])cylinder(100,2,2);
   translate([-60,-90,-1])cube([120 ,60,30]);
//    translate([-1,-1,0])import("C:/Mcam9/Data/MINUS BLOCK FOR FAN.STL");
//    translate([1,1,0])import("C:/Mcam9/Data/MINUS BLOCK FOR FAN.STL");
}
