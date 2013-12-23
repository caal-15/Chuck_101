//Assignment 6
<<< "Assignment_6_Ambrozia" >>>;

//Flute Part
Flute inst => JCRev frev => Delay fdel => Pan2 fpan => dac;
fdel => fdel;

//scale
[46, 48, 49, 51, 53, 54, 56] @=> int scale[];

//durations 
0.625::second => dur quarter;
quarter/2 => dur eighth;
quarter/4 => dur sixteenth;

quarter*2 => dur half;
quarter*4 => dur whole;

quarter + half => dur halfdot;
eighth + quarter => dur quarterdot;

//Basic Functions 

//Function to octave a midi Note
fun int octave (int note, int oct)
{
    return note + 12*oct; 
}

/*Function to execute a compass, receives notes as grades of the scale (notes[])
the octave in which they are in (oct[]), if they are active or not (act[], 2
means de instrument must be activated (noteOn), 1 that it should remain as it is
and 0 that it must release the note (noteOff)), the velocity of each note
(vel[]), and the minimal beat to be executed*/
fun int exec(int notes[], int act[], int oct[], float vel[], dur beat)
{
    if (notes.cap() != act.cap() || act.cap() != oct.cap() || oct.cap() != vel.cap()) return 0;
    else
    {
        for(0 => int i; i < notes.cap(); i++)
        {
            Std.mtof(octave(scale[notes[i]], oct[i])) => inst.freq;
            
            if(act[i] == 2) vel[i] => inst.noteOn;
            else if(act[i]==0)   1 => inst.noteOff;
            beat => now;
        }
        return 1;
    }
}

//set parameters
6 => inst.vibratoFreq;
0.4 => inst.vibratoGain;
0.2 => inst.gain,
quarter => fdel.delay;
quarter => fdel.max;
0.5 => fdel.gain;
0.8 => fpan.pan;

/*Phrases, each consisting of 4 arrays: one array for the grades of
the scale (p's), one for the activation of each note (ap's), one for
the velocity of each note (vp's) and one for the octave of the note
(op's)*/

//Phrase 1
[0, 0, 0, 2, 4, 4, 4, 5] @=> int p1[];
[2, 1, 1, 2, 2, 1, 1, 2] @=> int ap1[];
[2, 2, 2, 2, 2, 2, 2, 2] @=> int op1[];
[1.0, 0.0, 0.0, 1.0, 0.7, 0.0, 0.0, 1.0] @=> float vp1[];

[4, 3, 0, 1, 0, 5, 1, 2, 4, 0, 0, 0] @=> int p2[];
[2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1] @=> int ap2[];
[2, 2, 2, 2, 2, 1, 2, 2, 1, 2, 2, 2] @=> int op2[];
[1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0] @=> float vp2[];



exec(p1, ap1, op1, vp1, quarterdot);
exec(p2, ap2, op2, vp2, halfdot);

1 => inst.noteOff;

halfdot*2 => now;



