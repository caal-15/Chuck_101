//Bass
General g;
BPM t;
Player p;

Mandolin bass;

//Set parameters
0.1 => bass.bodySize;
0.2 => bass.stringDamping;
0.9 => bass.pluckPos;


p.initialize(bass, 0.4);

[3, 3, 3, 3, 3, 3, 3, 2] @=> int g1[];
[1, 1, 1, 1, 1, 1, 1, 1] @=> int o1[];
[2, 1, 1, 1, 1, 1, 2, 2] @=> int a1[];
[1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.9] @=> float v1[];

g.gradeToMidi(g1, o1) @=> int p1[];

p.playNotes(p1, a1, v1, t.quarter);

[1, 1, 1, 1, 1, 1, 1, 0] @=> int g2[];
[1, 1, 1, 1, 1, 1, 2, 2] @=> int o2[];

g.gradeToMidi(g2, o2) @=> int p2[];

p.playNotes(p2, a1, v1, t.quarter);

[6, 6, 6, 6, 6, 6, 6, 6] @=> int g3[];
[1, 1, 1, 1, 1, 1, 1, 1] @=> int o3[];

g.gradeToMidi(g3, o3) @=> int p3[];

p.playNotes(p3, a1, v1, t.quarter);

[2, 0, 3, 3] @=> int gs1[];
[2, 2, 1, 1] @=> int os1[];

g.gradeToMidi(gs1, os1) @=> int s1[];

for(0 => int i; i < s1.cap(); i++) p.shredNote(s1[i], 0.8, 1.0, 8, t.eighth);
    
[3, 5, 6, 0] @=> int gs2[];
[1, 1, 1, 2] @=> int os2[];

g.gradeToMidi(gs2, os2) @=> int s2[];

repeat(2) for(0 => int i; i < s2.cap(); i++) p.shredNote(s2[i], 0.8, 1.0, 8, t.eighth);

p.shredNote(g.gradeToMidiSingle(1, 1), 0.8, 1.0, 8, t.eighth);
repeat(3)
{
    p.shredNote(g.gradeToMidiSingle(1, 1), 0.8, 1.0, 3, t.eighth);
    p.shredNote(g.gradeToMidiSingle(2, 1), 0.8, 1.0, 5, t.eighth);
}

p.shredNote(g.gradeToMidiSingle(1, 1), 0.8, 1.0, 8, t.eighth);
repeat(2)
{
    p.shredNote(g.gradeToMidiSingle(1, 1), 0.8, 1.0, 3, t.eighth);
    p.shredNote(g.gradeToMidiSingle(2, 1), 0.8, 1.0, 5, t.eighth);
}

p.shredNote(g.gradeToMidiSingle(0, 2), 0.8, 1.0, 8, t.eighth);
p.shredNote(g.gradeToMidiSingle(1, 1), 0.8, 1.0, 4, t.eighth);
p.shredNote(g.gradeToMidiSingle(2, 1), 0.8, 1.0, 4, t.eighth);