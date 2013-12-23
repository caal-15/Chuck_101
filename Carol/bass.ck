//Assignment_7_Carol_of_the_Bells
<<< "Assignment_7_Carol_of_the_Bells" >>>;

//Bass
BPM t;
General g;

Mandolin bass;
//Set parameters
0.1 => bass.bodySize;
0.2 => bass.stringDamping;
0.9 => bass.pluckPos;

Player p;

p.initialize(bass, 0.3);


//phrase construction
[2, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0] @=> int g1[];
[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1] @=> int o1[];
[2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2] @=> int a1[];
[1.0, 0.0, 1.0, 0.7, 1.0, 0.8, 1.0, 0.8, 1.0, 0.8, 1.0, 0.8] @=> float v1[];
g.gradeToMidi(g1, o1) @=> int p1[];

[2, 2, 1, 2, 0, 6, 6, 6, 6, 6, 6, 6] @=> int g2[];
[-1, -1, -1, -1, -1, -2, -2, -2, -2, -2, -2, -2] @=> int o2[];
g.gradeToMidi(g2, o2) @=> int p2[];

[2, 2, 1, 2, 0, 5, 5, 5, 5, 5, 5, 5] @=> int g3[];
g.gradeToMidi(g3, o2) @=> int p3[];

[2, 2, 1, 2, 0, 4, 4, 4, 4, 4, 4, 4] @=> int g4[];
g.gradeToMidi(g4, o2) @=> int p4[];

[0, 0, 0, 0, 0, 0, 0, 0, 3, 2, 1, 0] @=> int g5[];
[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1 ,-1] @=> int o5[];
[2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2] @=> int a5[];
[1.0, 0.8, 1.0, 0.8, 1.0, 0.8, 1.0, 0.8, 1.0, 0.8, 1.0, 0.8] @=> float v5[];
g.gradeToMidi(g5, o5) @=> int p5[];

[6, 6, 6, 6, 6, 6, 6, 6, 2, 1, 0, 6] @=> int g6[];
[-2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -1 ,-2] @=> int o6[];
g.gradeToMidi(g6, o6) @=> int p6[];

[5, 5, 5, 5, 5, 5, 5, 5, 2, 1, 6, 5] @=> int g7[];
[-2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -2 ,-2] @=> int o7[];
g.gradeToMidi(g7, o7) @=> int p7[];

[4, 4, 4, 4, 4, 4, 4, 4, 3, 4, 5, 6] @=> int g8[];
[-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2 ,-2] @=> int o8[];
g.gradeToMidi(g8, o8) @=> int p8[];

[0, 0, 0, 6, 6, 6, 5, 5, 5, 4, 5, 6] @=> int g9[];
[-1, -1, -1, -2, -2, -2, -2, -2, -2, -2, -2, -2] @=> int o9[];
[2, 1, 1, 2, 1, 1, 2, 1, 1, 2, 2, 2] @=> int a9[];
[1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.7, 0.9] @=> float v9[];
g.gradeToMidi(g9, o9) @=> int p9[];

[0, 0, 0, 0, 0, 0, 0, 0, 6, 6, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 3, 3, 1, 1] @=> int g10[];
[0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1] @=> int o10[];
[2, 1, 1, 1, 2, 2, 2, 1, 2, 1, 2, 1, 2, 1, 1, 1, 2, 2, 2, 1, 2, 1, 2, 1] @=> int a10[];
[1.0, 0.0, 0.0, 0.0, 1.0, 0.6, 0.8, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0, 0.6, 0.8, 0.0, 1.0, 0.0, 1.0, 0.0] @=> float v10[];

g.gradeToMidi(g10, o10) @=> int p10[];

[3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] @=> int g11[];
[-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1] @=> int o11[];
g.gradeToMidi(g11, o11) @=> int p11[];

repeat(2)
{
    p.playNotes(p1, a1, v1, t.sixteenth);
    p.playNotes(p2, a1, v1, t.sixteenth);
    p.playNotes(p3, a1, v1, t.sixteenth);
    p.playNotes(p4, a1, v1, t.sixteenth);
}

p.playNotes(p5, a5, v5, t.sixteenth);
p.playNotes(p6, a5, v5, t.sixteenth);
p.playNotes(p7, a5, v5, t.sixteenth);
p.playNotes(p8, a5, v5, t.sixteenth);

p.playNotes(p9, a9, v9, t.eighth);
p.playNotes(p9, a9, v9, t.eighth);

p.playNotes(p10, a10, v10, t.thirtysecond);
p.playNotes(p11, a10, v10, t.thirtysecond);