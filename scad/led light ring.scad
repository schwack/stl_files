$fn=50;



difference(){
translate ([0,0,4])
sphere (12);
 
translate ([0,0,4])
sphere (10.25);
translate ([-15,-15,-10])
    cube([30,30,10]);
    
translate ([-15,-15,10])
    cube([30,30,10]);

cylinder (12,8.475,8.475);
translate ([0,0,-.001])
cylinder (2,10.735,10.75);    
};