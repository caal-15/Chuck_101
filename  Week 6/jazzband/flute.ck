// flute.ck
// Our famous headliner flute solo (with EFX)
Flute solo => JCRev rev => dac;
0.1 => rev.mix;
solo => Delay d => d => rev;
0.8 :: second => d.max => d.delay;
0.5 => d.gain;
0.5 => solo.gain;

// shared jazz scale data
[41,43,45,48,50,51,53,60,63] @=> int scale[]; 

// then our main loop headliner flute soloist
while (1)  {
    (Math.random2(1,5) * 0.2) :: second => now;
    if (Math.random2(0,3) > 1) {
        Math.random2(0,scale.cap()-1) => int note;
        Math.mtof(24+scale[note])=> solo.freq;
        Math.random2f(0.3,1.0) => solo.noteOn;
    }
    else 1 => solo.noteOff;
}
