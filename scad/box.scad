
module top(){
import("C:/Mcam9/Data/LID.STL");};

module base(){
import("C:/Mcam9/Data/BOX.STL");};

difference (){
 top();
 translate ([0,0,-.05])top() ;
 // translate([-1,-1,-5])%cube([7,7,5]);  
    
};
base();