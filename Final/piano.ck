//Piano 
General g;
BPM t;

Rhodey piano[3];
JCRev rev => Pan2 pan => dac;
for(0 => int i; i<piano.cap(); i++) piano[i] => rev;
0.2 => rev.mix;
-0.8 => pan.pan;
0.4 => rev.gain;

RhodeyPlayer p;

p.initialize(piano, 0.4, -0.8);
[3, 0, 3] @=> int gc1[];
[2, 3, 3] @=> int oc1[];

[2, 6, 2] @=> int gc2[];
[2, 2, 3] @=> int oc2[];

[1, 5, 1] @=> int gc3[];
[2, 2, 3] @=> int oc3[];

[3, 3, 4] @=> int oc4[];

[0, 5, 0] @=> int gc5[];
[3, 3, 4] @=> int oc5[];

[6, 3, 6] @=> int gc6[];
[2, 3, 3] @=> int oc6[];

[3, 3, 4] @=> int oc7[];

[5, 3, 5] @=> int gc8[];
[6, 4, 6] @=> int gc9[];


g.gradeToMidi(gc1, oc1) @=> int c1[];
g.gradeToMidi(gc2, oc2) @=> int c2[];
g.gradeToMidi(gc3, oc3) @=> int c3[];
g.gradeToMidi(gc3, oc4) @=> int c4[];
g.gradeToMidi(gc5, oc5) @=> int c5[];
g.gradeToMidi(gc6, oc6) @=> int c6[];
g.gradeToMidi(gc2, oc7) @=> int c7[];
g.gradeToMidi(gc8, oc1) @=> int c8[];
g.gradeToMidi(gc9, oc1) @=> int c9[];


[c1, c1, c1, c1, c1, c1, c1, c2] @=> int p1[][];
[2, 1, 1, 1, 1, 1, 2, 2] @=> int a1[];
[1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0] @=> float v1[];

p.playChords(p1, a1, v1, t.quarter);

[c3, c3, c3, c3, c3, c3, c4, c5] @=> int p2[][];

p.playChords(p2, a1, v1, t.quarter);

[c6, c6, c6, c6, c6, c6, c6, c6] @=> int p3[][];

p.playChords(p3, a1, v1, t.quarter);

[c7, c5] @=> int p4[][];

p.playChords(p4, [2, 2], [1.0, 1.0], t.whole);

t.whole*2 => now;

[c1, c8, c9, c5] @=> int sc1[][];

repeat(2) for(0 => int i; i < sc1.cap(); i++) p.shredChord(sc1[i], 0.8, 1.0, 8, t.eighth);
    
0.0 => pan.pan;
p.setPan(0.0);

[c3, c3, c3, c2, c2, c2, c2, c2] @=> int p5[][];
[2, 1, 1, 2, 1, 1, 1, 1] @=> int a5[];
[1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0] @=>float v5[];

p.shredChord(c3, 1, t.whole);
repeat(3) p.playChords(p5, a5, v5, t.eighth);

p.shredChord(c3, 1, t.whole);
repeat(2) p.playChords(p5, a5, v5, t.eighth);

p.shredChord(c5, 1, t.whole);
p.shredChord(c3, 1, t.half);
p.shredChord(c2, 1, t.half);