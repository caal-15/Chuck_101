//Assignment_7_Carol_of_the_Bells
<<< "Assignment_7_Carol_of_the_Bells" >>>;

//Guitar
BPM t;
General g;

HevyMetl guitar => Delay d => Pan2 pan => dac;

t.sixteenth => d.max;
t.sixteenth => d.delay;
d => d;
0.2 => d.gain;
-0.9 => pan.pan;

Player p;

p.initialize(guitar, 0.3, -0.9);

//phrase construction
[2, 2, 1, 2, 0, 0] @=> int g1[];
[2, 2, 2, 2, 2, 2] @=> int o1[];
[2, 1, 2, 2, 2, 1] @=> int a1[];
[1.0, 0.0, 1.0, 0.6, 0.8, 0.0] @=> float v1[];

[0, 0, 0, 0, 0, 0, 0, 0, 6, 6, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 1, 1] @=> int g2[];
[3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2] @=> int o2[];
[2, 1, 1, 1, 2, 2, 2, 1, 2, 1, 2, 1, 2, 1, 1, 1, 2, 2, 2, 1, 2, 1, 2, 1] @=> int a2[];
[1.0, 0.0, 0.0, 0.0, 1.0, 0.6, 0.8, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0, 0.6, 0.8, 0.0, 1.0, 0.0, 1.0, 0.0] @=> float v2[];

[3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] @=> int g3[];
[2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2] @=> int o3[];
g.gradeToMidi(g1, o1) @=> int p1[];

repeat(32) p.playNotes(p1, a1, v1, t.sixteenth);
p.playNotes(g.gradeToMidi(g2, o2), a2, v2, t.thirtysecond);
p.playNotes(g.gradeToMidi(g3, o3), a2, v2, t.thirtysecond);

t.quarter => now;