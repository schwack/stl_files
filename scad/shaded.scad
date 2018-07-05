$fn=10;


module shade(){rotate ([90,0,0])
import("C:/Mcam9/Data/SHADE.STL");};



difference(){
scale([25.4,25.4,25.4])color("green")shade();
    a();
    rotate(12)translate([0,0,6])a();
rotate(24)translate([0,0,12])a();
   rotate(36) translate([0,0,18])a();
rotate(48)translate([0,0,24])a();
    translate([0,0,30])a();
rotate(12)translate([0,0,36])a();
    rotate(24)translate([0,0,42])a();
rotate(36)translate([0,0,48])a();
    rotate(48)translate([0,0,54])a();
translate([0,0,60])a();
rotate(12)translate([0,0,66])a();
    rotate(24)translate([0,0,72])a();
rotate(36)translate([0,0,78])a();
    rotate(48)translate([0,0,84])a();
translate([0,0,90])a();
    
// difference (){
//  cylinder (2.6,38,36);  
//  translate([0,0,-1])cylinder (3.61,33,35.5); 
//};   difference (){
//  cylinder (2.2,30,28);  
//  translate([0,0,-1])cylinder (3.21,26,28); 
//};  
};

module bar(){
rotate([0,90,0])translate([-10,0,-90])cylinder(180,4.5,4.5);
    bar2();};


module bar2(){
rotate([-7.75,90,0])translate([-6.25,0,-90])cylinder(180,1.5,1.5);};

module a(){
bar();
rotate(30)bar();
rotate(60)bar();
rotate(90)bar();
rotate(120)bar();
rotate(150)bar();};

