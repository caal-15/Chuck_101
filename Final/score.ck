<<< "Assignment_8_Infinity_Mijinion" >>>;
//Score
General g;
BPM t;

g.initialize([13, 14, 16, 18, 20, 21, 23]);
t.initialize(135);

Machine.add(me.dir() + "/flute.ck");
Machine.add(me.dir() + "/piano.ck");
Machine.add(me.dir() + "/bass.ck");
Machine.add(me.dir() + "/drums.ck");

t.whole*9 => now;
t.eighth*7 => now;
Machine.add(me.dir() + "/mandolin.ck");
