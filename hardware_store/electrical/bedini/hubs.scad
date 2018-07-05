
$fn=60;
//translate([40,0,0])



//difference (){
//union(){
//import("C:/Mcam9/Data/HUB.STL");
//translate ([0,0,3]) cylinder (1,15,15);
//import("C:/Mcam9/Data/HUB2.STL");}

module hub(){
union(){

 cylinder (6,15,15);
    translate ([0,0,2])
import("HUB2.STL");};};

difference (){
    hub();
translate ([0,0,1]) cylinder (6.1,10,12);
translate ([0,0,-.1]) cylinder (2.2,1.5,.5);
//    };

translate ([1.5,1.5,6]) cube(15,15,4);
translate ([-16.5,-16.5,6]) cube(15,15,4);
translate ([-16.5,1.5,6]) cube(15,15,4);
translate ([1.5,-16.5,6]) cube(15,15,4);
}
