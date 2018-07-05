$fn=50;
difference (){
import("C:/Mcam9/Data/fan_brkt_print.stl");
rotate([0,90,90])translate([-10,0,-95])cylinder(100,2,2);
color("red")rotate([0,90,90])translate([-10,0,-32])cylinder(20,3,3);
translate ([-60,-90,-1])cube([120,60,30]);
color("green")translate ([-8.375,-12.5,-1])cube([16.75,2.5,22]);
color("blue")translate ([-8.375,-23,-1])cube([3,10.5,22]);
color("red")translate ([5.375,-23,-1])cube([3,10.5,22]);
color("red")translate ([-2.375,-16,-1])cube([4.75,3.5,22]);
};





