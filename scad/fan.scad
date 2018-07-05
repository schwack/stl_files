$fn=50;
difference (){
import("C:/Mcam9/Data/fan_brkt_print.stl");
rotate([0,90,90])translate([-10,0,-95])cylinder(100,2,2);
translate ([-60,-90,-1])cube([120,60,30]);
};

