//Assignment_7_Carol_of_the_Bells
<<< "Assignment_7_Carol_of_the_Bells" >>>;

//Piano
BPM t;
General g;

Rhodey piano[3];
JCRev rev => Pan2 pan => dac;
for(0 => int i; i<piano.cap(); i++) piano[0] => rev;
0.2 => rev.mix;
0.9 => pan.pan;
0.5 => rev.gain;
RhodeyPlayer p;
p.initialize(piano, 0.1, 0.9);

//phrase construction
[0, 4, 0] @=> int c1[];
[1, 1, 2] @=> int oc1[];
[0, 0, 1] @=> int oc6[];

[6, 3, 6] @=> int c2[];
[0, 1, 1] @=> int oc2[];

[5, 2, 5] @=> int c3[];
[0, 1, 1] @=> int oc3[];

[4, 1, 4] @=> int c4[];
[0, 1, 1] @=> int oc4[];

[3, 0, 3] @=> int c5[];
[0, 1, 1] @=> int oc5[];

[g.gradeToMidi(c1, oc1), g.gradeToMidi(c2, oc2), g.gradeToMidi(c3, oc3), g.gradeToMidi(c4, oc4)] @=> int chords[][];
[2, 2, 2, 2] @=> int a1[];
[1.0, 1.0, 1.0, 1.0] @=> float v1[];

[2, 2, 1, 2, 0, 0] @=> int g2[];
[2, 2, 2, 2, 2, 2] @=> int o2[];
[2, 1, 2, 2, 2, 1] @=> int a2[];
[1.0, 0.0, 1.0, 0.6, 0.8, 0.0] @=> float v2[];
g.harmonize(g2, o2, -2) @=> int harmony[];

[g.gradeToMidi(c1, oc1), g.gradeToMidi(c1, oc1), g.gradeToMidi(c1, oc1), g.gradeToMidi(c4, oc4), g.gradeToMidi(c4, oc4), g.gradeToMidi(c4, oc4)] @=> int chords2[][];
[2, 0, 1, 2, 0, 1] @=> int a3[];
[1.0, 0.0, 0.0, 1.0, 0.0, 0.0] @=> float v3[];

[g.gradeToMidi(c5, oc5), g.gradeToMidi(c5, oc5), g.gradeToMidi(c5, oc5), g.gradeToMidi(c1, oc6), g.gradeToMidi(c1, oc6), g.gradeToMidi(c1, oc6)] @=> int chords3[][];

repeat(2) p.playChords(chords, a1, v1, t.half + t.quarter);

repeat(16) p.playNotes(harmony, a2, v2, t.sixteenth);

p.playChords(chords2, a3, v3, t.eighth);
p.playChords(chords3, a3, v3, t.eighth);

t.quarter => now;