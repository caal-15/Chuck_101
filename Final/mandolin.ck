//Mandolin 
General g;
BPM t;

Moog lead => JCRev rev => Pan2 pan => dac;
//Set Parameters

//1 => mand.bodySize;
//0.5 => mand.pluckPos;
0.4 => rev.mix;
0.9 => rev.gain;
0.8 => pan.pan;

Player p;
p.initialize(lead, 0.9, 0.8);

[2, 3, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 0, 2, 2] @=> int g1[];
[4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5] @=> int o1[];
[2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1] @=> int a1[];
[1.0, 0.8, 0.9, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0] @=> float v1[];

g.gradeToMidi(g1, o1) @=> int p1[];

p.playNotes(p1, a1, v1, t.sixteenth);

[0, 0, 3, 2, 5, 5] @=> int g2[];
[5, 5, 4, 4, 4, 4] @=> int o2[];
[2, 1, 2, 2, 2, 1] @=> int a2[];
[1.0, 0.0, 1.0, 1.0, 1.0, 0.0] @=> float v2[];

g.gradeToMidi(g2, o2) @=> int p2[];

p.playNotes(p2, a2, v2, t.quarter);

t.eighth => now;

[3, 4, 5, 5, 6, 0] @=> int g3[];
[4, 4, 4, 4, 4, 5] @=> int o3[];
[2, 2, 2, 1, 2, 2] @=> int a3[];
[1.0, 0.7, 0.85, 0.0, 1.0, 0.8] @=> float v3[];

g.gradeToMidi(g3, o3) @=> int p3[];

p.playNotes(p3, a3, v3, t.sixteenth);

g.gradeToMidi([6, 2], [4, 4]) @=> int s1[];

p.shredNote(s1[0], 1, t.eighth + t.quarter);
p.shredNote(s1[1], 1, t.half);

p.playNotes(p1, a1, v1, t.sixteenth);

[5, 5, 5, 5, 5, 5] @=> int o4[];

g.gradeToMidi(g2, o4) @=> int p4[];
p.playNotes(p4, a2, v2, t.quarter);

t.eighth => now;

[5, 5, 5, 5, 5, 6] @=> int o5[];

g.gradeToMidi(g3, o5) @=> int p5[];
p.playNotes(p5, a3, v3, t.sixteenth);

g.gradeToMidi([6, 3], [5, 5]) @=> int s2[];

p.shredNote(s2[0], 1, t.whole);
p.shredNote(s2[1], 1, t.whole);

[5, 6, 0, 6, 6, 6, 6, 6] @=> int g6[];
[5, 5, 6, 5, 5, 5, 5, 5] @=> int o6[];
[2, 2, 2, 2, 1, 1, 1, 1] @=> int a6[];
[1.0, 0.8, 0.9, 1.0, 0.0, 0.0, 0.0, 0.0] @=> float v6[];

g.gradeToMidi(g6, o6) @=> int p6[];

p.playNotes(p6, a6, v6, t.eighth);

p.shredNote(g.gradeToMidiSingle(0, 6), 1, t.eighth + t.quarter);
p.shredNote(g.gradeToMidiSingle(6, 5), 1, t.eighth + t.quarter*2);

[5, 6, 5, 4, 4, 4, 4] @=> int g7[];
[5, 5, 5, 5, 5, 5, 5] @=> int o7[];
[2, 2, 2, 2, 1, 1, 1] @=> int a7[];
[1.0, 0.9, 0.7, 0.9, 0.0, 0.0, 0.0] @=> float v7[];

g.gradeToMidi(g7, o7) @=> int p7[];
p.playNotes(p7, a7, v7, t.eighth);

p.shredNote(g.gradeToMidiSingle(3, 5), 1, t.sixteenth);
p.shredNote(g.gradeToMidiSingle(4, 5), 1, t.sixteenth);

p.shredNote(g.gradeToMidiSingle(5, 5), 1, t.whole);
p.playNotes(p6, a6, v6, t.eighth);

p.shredNote(g.gradeToMidiSingle(0, 6), 1, t.eighth + t.quarter);
p.shredNote(g.gradeToMidiSingle(6, 5), 1, t.quarter);
p.shredNote(g.gradeToMidiSingle(2, 6), 1, t.eighth + t.quarter + t.whole);