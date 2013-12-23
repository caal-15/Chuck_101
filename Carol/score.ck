//Assignment_7_Carol_of_the_Bells
<<< "Assignment_7_Carol_of_the_Bells" >>>;

//Score
BPM t;
t.initialize(96);

General g;
g.initialize([57, 59, 60, 62, 64, 65, 67]); //A Aeolian, same notes as C Ionian

Machine.add(me.dir() + "/guitar.ck");
Machine.add(me.dir() + "/piano.ck");
Machine.add(me.dir() + "/bass.ck");
Machine.add(me.dir() + "/hihat.ck");

for(0 => int i; i < 4; i++)
{
    Machine.add(me.dir() + "/hihat.ck");
    12*t.eighth => now;
}

for(0 => int i; i < 16; i++){
    Machine.add(me.dir() + "/randomness.ck");
    if(i%4 == 0) Machine.add(me.dir() + "/hihat.ck"); 
    t.eighth*3 => now;    
}

