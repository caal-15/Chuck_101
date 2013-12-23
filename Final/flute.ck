//Flute
General g;
BPM t;

Flute flute => Delay d => JCRev rev => Pan2 pan => dac;
d => d;
t.eighth => d.max;
t.eighth => d.delay;
0.0 => pan.pan; 
0.4 => d.gain;
0.1 => rev.mix;
0.2 => rev.gain;


Player p;
p.initialize(flute, 0.3, 0.0);

[3, 2, 3, 0, 0, 5, 6, 2] @=> int g1[];
[4, 4, 4, 5, 5, 4, 4, 5] @=> int o1[];
[2, 2, 2, 2, 1, 2, 2, 2] @=> int a1[];
[1.0, 1.0, 1.0, 1.0, 0.0, 1.0, 0.8, 1.0] @=> float v1[];

g.gradeToMidi(g1, o1) @=> int p1[];
p.playNotes(p1, a1, v1, t.eighth);

p.playNotes(g.gradeToMidi([0], [5]), [2], [1.0], t.whole);

[3, 3, 3, 3, 3, 3, 3, 4, 5, 5, 5, 5, 3, 3, 3, 3] @=> int g2[];
[5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5] @=> int o2[];
[2, 1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 2, 1, 1, 1] @=> int a2[];
[1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.8, 0.9, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0] @=> float v2[];

g.gradeToMidi(g2, o2) @=> int p2[];

p.playNotes(p2, a2, v2, t.sixteenth);

p.playNotes(g.gradeToMidi([0], [5]), [2], [1.0], t.whole);

[0, 0, 6, 6, 0, 0, 3, 3, 3, 3, 1, 1, 2, 2, 3, 5] @=> int g3[];
[5, 5, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5] @=> int o3[];
[2, 1, 2, 1, 2, 1, 2, 1, 1, 1, 2, 1, 2, 1, 2, 2] @=> int a3[];
[1.0, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.8] @=> float v3[];

g.gradeToMidi(g3, o3) @=> int p3[];

p.playNotes(p3, a3, v3, t.sixteenth);

p.playNotes(g.gradeToMidi([3], [5]), [2], [1.0], t.whole);

[4, 4, 4, 4, 4, 4, 4, 5, 6, 6, 6, 6, 6, 6, 6, 6] @=> int g4[];
[5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5] @=> int o4[];
[2, 1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1] @=> int a4[];
[1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.8, 0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0] @=> float v4[];


g.gradeToMidi(g4, o4) @=> int p4[];

p.playNotes(p4, a4, v4, t.sixteenth);

p.playNotes(g.gradeToMidi([0], [6]), [2], [1.0], t.whole);

t.whole*10 => now;

-0.8 => pan.pan;
p.setPan(-0.8);
p.shredNote(g.gradeToMidiSingle(3, 4), 1, t.whole);

[5, 6, 0, 6, 6, 6, 6, 6] @=> int g5[];
[4, 4, 5, 4, 4, 4, 4, 4] @=> int o5[];
[2, 2, 2, 2, 1, 1, 1, 1] @=> int a5[];
[1.0, 0.8, 0.9, 1.0, 0.0, 0.0, 0.0, 0.0] @=> float v5[];

g.gradeToMidi(g5, o5) @=> int p5[];

p.playNotes(p5, a5, v5, t.eighth);

p.shredNote(g.gradeToMidiSingle(0, 5), 1, t.eighth + t.quarter);
p.shredNote(g.gradeToMidiSingle(6, 4), 1, t.eighth + t.quarter*2);

[5, 6, 5, 4, 4, 4, 4] @=> int g6[];
[4, 4, 4, 4, 4, 4, 4] @=> int o6[];
[2, 2, 2, 2, 1, 1, 1] @=> int a6[];
[1.0, 0.9, 0.7, 0.9, 0.0, 0.0, 0.0] @=> float v6[];

g.gradeToMidi(g6, o6) @=> int p6[];
p.playNotes(p6, a6, v6, t.eighth);

p.shredNote(g.gradeToMidiSingle(3, 4), 1, t.sixteenth);
p.shredNote(g.gradeToMidiSingle(4, 4), 1, t.sixteenth);

p.shredNote(g.gradeToMidiSingle(5, 4), 1, t.whole);
p.playNotes(p5, a5, v5, t.eighth);

p.shredNote(g.gradeToMidiSingle(0, 5), 1, t.eighth + t.quarter);
p.shredNote(g.gradeToMidiSingle(6, 4), 1, t.quarter);
p.shredNote(g.gradeToMidiSingle(2, 5), 1, t.eighth + t.quarter);

[0, 0, 0, 6, 6, 2, 0, 5] @=> int g7[];
[5, 5, 5, 4, 4, 5, 5, 4] @=> int o7[];
[2, 1, 1, 2, 1, 2, 2, 2] @=> int a7[];
[1.0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.8, 0.9] @=> float v7[];

g.gradeToMidi(g7, o7) @=> int p7[];

p.playNotes(p7, a7, v7, t.eighth);

[2, 3] @=> int g8[];
[4, 4] @=> int o8[];

g.gradeToMidi(g8, o8) @=> int p8[];
p.playNotes(p8, [2, 2], [1.0, 1.0], t.half);
t.whole => now; 