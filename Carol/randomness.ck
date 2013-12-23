//Assignment_7_Carol_of_the_Bells
<<< "Assignment_7_Carol_of_the_Bells" >>>;

//Randomness
BPM t;

ModalBar mod => Pan2 mpan => dac;
SinOsc vib => SawOsc viol => ADSR env => Pan2 vpan => dac;
(0.5::second, 0.1::second, 0.6, 0.5::second) => env.set;

//scale
[57, 60, 64] @=> int scale[];

//Set Parameters
0.7 => mod.gain;
0.05 => viol.gain;
6.0 => vib.freq;
2 => viol.sync;
2 => vib.gain;


//Function randomizing panning, notes and, preset for a Modal bar
fun void randMod ()
{
    Math.random2(0, 8) => mod.preset;
    for(0 => int i; i < 6; i++)
    {
        Math.random2f(-1.0, 1.0) => mpan.pan;
        Std.mtof(scale[Math.random2(0, 2)]) => mod.freq;
        1 => mod.noteOn;
        t.sixteenth => now;
    }
    1 => mod.noteOff;
    t.quarter + t.eighth => now;
    
}

//Function randomizing panning, notes and, preset for an Oscillator wrapped in an Envelope
fun void randViol()
{
    for(0 => int i; i<3; i++)
    {
        Math.random2f(-1.0, 1.0) => vpan.pan;
        Std.mtof(scale[Math.random2(0, 2)] + 12) => viol.freq;
        1 => env.keyOn;
        t.eighth => now;    
    }
    1 => env.keyOff;
    t.quarter + t.eighth => now;
}


if(Math.random2(0,1) == 0) spork ~ randMod();
else spork ~ randViol();

(t.quarter + t.eighth)*2 => now;
    