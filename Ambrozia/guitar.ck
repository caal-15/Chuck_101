//Assignment 6
<<< "Assignment_6_Ambrozia" >>>;

//Guitar Part
Mandolin inst => JCRev grev => Pan2 gpan => dac;

//scale
[46, 48, 49, 51, 53, 54, 56] @=> int scale[];

//durations 
0.625::second => dur quarter;
quarter/2 => dur eighth;
quarter/4 => dur sixteenth;

quarter*2 => dur half;
quarter*4 => dur whole;
quarter + half => dur halfdot;


Std.mtof(46 + 12) => inst.freq;

//Basic Functions

//Function to octave a midi Note
fun int octave (int note, int oct)
{
    return note + 12*oct; 
}

/*Function to execute a compass, receives notes as grades of the scale (notes[])
the octave in which they are in (oct[]), if they are active or not (act[], 2
means de instrument must be activated (noteOn), 1 that it should remain as it is
and 0 that it must release the note (noteOff)), and the velocity of each note
(vel[]) and the minimal beat to be executed*/
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

//Set Parameters
1 => inst.bodySize;
0.3 => inst.pluckPos;
0.02 => inst.stringDetune;
0.3 => inst.gain;

0.2 => grev.mix;

-0.8 => gpan.pan;


/*Phrases, each consisting of 4 arrays: one array for the grades of
the scale (p's), one for the activation of each note (ap's), one for
the velocity of each note (vp's) and one for the octave of the note
(op's)*/

//Phrase 1
[0, 0, 3, 3, 4, 4, 1, 2, 6, 1, 3, 4] @=> int p1[];
[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] @=> int op1[];
[2, 1, 2, 1, 2, 1, 2, 2, 2, 2, 2, 2] @=> int ap1[];
[1.0, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.5, 0.5, 1.0, 0.5, 0.5] @=> float vp1[];
//phrase 2
[0, 0, 4, 4, 4, 5, 1, 2, 6, 1, 3, 4] @=> int p2[];
[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] @=> int op2[];
[2, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2] @=> int ap2[];
[1.0, 0.0, 1.0, 0.0, 1.0, 0.5, 1.0, 0.5, 0.5, 1.0, 0.5, 0.5] @=> float vp2[];


//executtion
for(0 => int i; i<10; i++) exec(p1, ap1, op1, vp1, sixteenth);

for(0 => int i; i<4; i++) exec(p2, ap2, op2, vp2, sixteenth);
    
for(0 => int i; i<4; i++) exec(p1, ap1, op1, vp1, sixteenth);
    
1 => inst.noteOff;

halfdot*2 => now;





