$fn=60;

module main(){
   color("red") cylinder (50.35,2.5,2.5);
     color("green")cylinder (48.7,4.42,4.42);
    translate ([0,0,.5])
     color("blue")cylinder (48.2,7,7);
};

translate ([0,0,7])
rotate([0,90,0])
difference (){
main();
    translate ([0,0,-1])
    cylinder (55,.6,.6);
    
    translate ([0,0,-1])
    cylinder (1.25,2,2);
    translate ([0,0,50.1])
    cylinder (1.5,2,2);
};
    




