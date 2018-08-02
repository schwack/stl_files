


$fn=80;

//build first

ring();
b();
f();
y();
c();

a();
ring();
c();
x();
/*
move extruder
insert disk
then build:
*/
module f(){

translate([0,0,2.01])import("bedini_2.stl");
};
////
//union(){
//translate([0,0,2.01])rotate(30)import("bedini_2.stl");
module x(){
difference(){
translate([0,0,2.01])import("bedini_2.stl");
rotate(30)cube([55,55,20]);
rotate(240)cube([55,55,20]);
translate([-55,-60,0])cube([55,120,20]);
cylinder(20,20,20);
};};
//};
//d();

module y(){
difference(){
translate([0,0,2.01])rotate(30)import("bedini_2.stl");
translate([0,-60,5.01])cube([55,120,20]);
rotate(20)cube([55,55,20]);
rotate(250)cube([55,55,20]);
translate([-55,-60,0])cube([55,120,20]);
cylinder(20,20,20);


};
};

module ring(){
difference(){
color("white")translate([0,0,-.01])cylinder(2,51,51);
color("blue")translate([0,0,1])cylinder(1,49.2,50.7);
color("black")translate([0,0,-1])cylinder(5,40,40);
    
    
};
};

module a(){
difference(){
color("white")translate([0,0,.999])cylinder(1,51.001,51.001);
color("blue")translate([0,0,0])cylinder(3,49.1,49.1);
color("blue")translate([0,0,.998])cylinder(1.01,49.2,50.7);    
};
};

module b(){  //posts    
color("white")translate([50,0,1])cylinder(1,1,1);
color("white")translate([0,50,1])cylinder(1,1,1);
color("white")translate([0,-50,1])cylinder(1,1,1);
color("white")translate([-50,0,1])cylinder(1,1,1);
};
module c(){ //ring   
difference(){
color("white")translate([0,0,1])cylinder(1,51,51);
color("blue")translate([0,0,0])cylinder(3,49.1,49.1); 
   }; 
};

module d(){
    difference(){
        c();
a();
       translate([0,0,.001]) b();

    };
};
    
//d();
//import("C:/Users/nunya/Documents/OpenSCAD/bedini_2.stl");