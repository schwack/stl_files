
module s1(){
    color("green")
import("C:/Mcam9/Data/SERVO1.STL");
}

module j1(){
    color("red")
    import("C:/Mcam9/Data/JAW1.STL");
}
module a2(){
    color("blue")
import("C:/Mcam9/Data/ARM2.STL");
}
module s2(){
    color("white")
import("C:/Mcam9/Data/SERVO2.STL");
}
module c(){
    color("blue")
import("C:/Mcam9/Data/CARRIAGE.STL");
}
module a1(){
    color("yellow")
import("C:/Mcam9/Data/ARM1.STL");
}
module mb(){
    color("orange")
import("C:/Mcam9/Data/MOUNT.STL");
}

module j2(){
    color("yellow")
import("C:/Mcam9/Data/JAW2.STL");
}
color("violet")s2();
a1();
a2();
j1();
j2();
c();
mb();
rotate([-90,180,0])translate([-71.5,-11.75,4])s2();
s1();
