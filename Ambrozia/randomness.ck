//Assignment 6
<<< "Assignment_6_Ambrozia" >>>;

ModalBar mod => Pan2 mpan => dac;
SinOsc vib => SawOsc viol => ADSR env => Pan2 vpan => dac;
(0.5::second, 0.1::second, 0.6, 0.5::second) => env.set;

//scale
[46, 49, 53] @=> int scale[];

//durations 
0.625::second => dur quarter;
quarter/2 => dur eighth;
quarter/4 => dur sixteenth;

quarter*2 => dur half;
quarter*4 => dur whole;
quarter + half => dur halfdot;

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
        eighth => now;
    }
    1 => mod.noteOff;
    halfdot => now;
    
}

//Function randomizing panning, notes and, preset for an Oscillator wrapped in an Envelope
fun void randViol()
{
    for(0 => int i; i<3; i++)
    {
        Math.random2f(-1.0, 1.0) => vpan.pan;
        Std.mtof(scale[Math.random2(0, 2)] + 12) => viol.freq;
        1 => env.keyOn;
        quarter => now;    
    }
    1 => env.keyOff;
    halfdot => now;
}


if(Math.random2(0,1) == 0) spork ~ randMod();
else spork ~ randViol();

halfdot*2 => now;
    