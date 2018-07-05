$fn=50;

difference (){
    start();
    translate([0,0,-.01])
    cylinder (25,18,17.875);
    translate([0,0,-1])
    cylinder (3,19,18
    );
    
    
}
module start(){
    cylinder (.5,21.5,21.25);
     cylinder (13,20,19.5);
    translate([0,0,13])
    cylinder (2,19.5,19);
};