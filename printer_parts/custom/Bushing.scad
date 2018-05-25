// Bushing Builder by schwackmaster 2015.10.30 
//
// Self explanatory. Clearance is applied to the id only.
// Better tight than loose. A little sandpaper never hurt.
//
// Typical linear bearings are 15mm x 8mm.

od = 15;  
id = 8;
height = 5;
fillet = 1;
clearance =.01;

$fn=80;

module cross_section () {
    rotate_extrude(){
    translate([(id+clearance)/2+fillet,fillet,0])
    minkowski(){
    square([od/2-(id+clearance)/2-2*fillet,height-2*fillet]); 
   circle(1);}; };
};

cross_section ();