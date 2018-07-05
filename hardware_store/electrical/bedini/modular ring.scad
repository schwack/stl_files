$fn=60;

translate([0,0,-2.01])f();
//d();
module c(){
//rotate (45)a();
rotate (135)a();
rotate (225)a();
rotate (315)a();
rotate (0)b();
rotate (90)b();
rotate (180)b();
rotate (270)b();
};

module a(){import("C:/Mcam9/Data/bedini/bediniflatwedge.stl");};
module b(){import("C:/Mcam9/Data/bedini/bedinihumpwedge.stl");};


poles = 5;
angle = 360 / poles;

module d(){
 for(i = [1:poles]){
  rotate(angle * i)b(); 
 rotate(angle * (i+.5))a(); 
 };  
};

module e(){
   
  for (j = [1:poles]){
  rotate(angle * j){  
rotate([90,0,0])translate([0,9.01,26.5])cylinder(24,4.01,4.01);
  };
    
   };   
    
}

module f(){
   difference(){
     
       d(); 
       e(); 
   };
   };

