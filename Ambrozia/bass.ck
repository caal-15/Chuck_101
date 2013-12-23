//Assignment 6
<<< "Assignment_6_Ambrozia" >>>;
//Bass Part
Mandolin inst => dac;

//scale
[46, 48, 49, 51, 53, 54, 56] @=> int scale[];

//durations 
0.625::second => dur quarter;
quarter/2 => dur eighth;
quarter/4 => dur sixteenth;

quarter*2 => dur half;
quarter*4 => dur whole;
quarter + half => dur halfdot;


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


//Set parameters
0.1 => inst.bodySize;
0.2 => inst.stringDamping;
0.9 => inst.pluckPos;
0.2 => inst.gain;

//First Note
Std.mtof(scale[4] - 2*12) => inst.freq;
0.8 => inst.noteOn;
eighth => now;

/*Phrases, each consisting of 4 arrays: one array for the grades of
the scale (p's), one for the activation of each note (ap's), one for
the velocity of each note (vp's) and one for the octave of the note
(op's)*/

//phrase 1
[ 0,  0,  0,  0,  0,  0,  4,  4,  4,  4,  5,  6] @=> int p1[];
[ 2,  1,  1,  2,  1,  1,  2,  1,  2,  1,  2,  2] @=> int ap1[];
[0.8, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.5] @=> float vp1[];
[-1, -1, -1, -1, -1, -1, -2, -2, -2, -2, -2, -2] @=> int op1[];

//phrase 2
[ 0,  0,  0,  0,  0,  4,  4,  4,  4,  4,  6,  6] @=> int p2[];
[ 2,  1,  1,  2,  1,  2,  2,  1,  2,  1,  2,  1] @=> int ap2[];
[0.8, 0.0, 0.0, 1.0, 0.0, 1.0, 0.7, 0.0, 1.0, 0.0, 1.0, 0.0] @=> float vp2[];
[-1, -1, -1, -1, -1, -2, -2, -2, -2, -2, -2, -2] @=> int op2[];


//phrase 3
[ 0,  0,  0,  0,  0,  0,  4,  4,  4,  4,  5,  5] @=> int p3[];
[ 2,  1,  1,  2,  1,  1,  2,  1,  2,  1,  2,  1] @=> int ap3[];
[0.8, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.0] @=> float vp3[];
[-1, -1, -1, -1, -1, -1, -2, -2, -2, -2, -2, -2] @=> int op3[];

//phrase 4
[ 0,  0,  0,  0,  0,  4,  4,  4,  4,  4,  6,  6] @=> int p4[];
[ 2,  1,  1,  2,  1,  2,  2,  1,  2,  1,  2,  1] @=> int ap4[];
[0.8, 0.0, 0.0, 1.0, 0.0, 1.0, 0.7, 0.0, 1.0, 0.0, 1.0, 0.0] @=> float vp4[];
[-1, -1, -1, -1, -1, -2, -1, -2, -2, -2, -2, -2] @=> int op4[];

//phrase 5
[ 0,  0,  0,  0,  0,  0,  6,  6,  6,  6,  6,  6] @=> int p5[];
[ 2,  1,  1,  2,  1,  2,  2,  1,  2,  1,  2,  1] @=> int ap5[];
[0.8, 0.0, 0.0, 1.0, 0.0, 1.0, 0.7, 0.0, 1.0, 0.0, 1.0, 0.0] @=> float vp5[];
[-1, -1, -1, -1, -1, -1, -1, -2, -2, -2, -2, -2] @=> int op5[];

//phrase 6
[ 5,  5,  5,  5,  5,  5,  2,  2,  2,  2,  4,  4] @=> int p6[];
[ 2,  1,  1,  2,  1,  1,  2,  1,  2,  1,  2,  2] @=> int ap6[];
[0.8, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.5] @=> float vp6[];
[-2, -2, -2, -2, -2, -2, -1, -1, -1, -1, -2, -1] @=> int op6[];

//phrase 7
[ 5,  5,  5,  5,  5,  5,  2,  2,  3,  3,  4,  4] @=> int p7[];
[ 2,  1,  1,  2,  1,  2,  2,  1,  2,  1,  2,  1] @=> int ap7[];
[0.8, 0.0, 0.0, 1.0, 0.0, 1.0, 0.7, 0.0, 1.0, 0.0, 1.0, 0.0] @=> float vp7[];
[-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2] @=> int op7[];

//phrase 8
[ 5,  5,  5,  5,  5,  5,  2,  2,  2,  2,  2,  2] @=> int p8[];
[ 2,  1,  1,  2,  1,  1,  2,  1,  2,  1,  2,  1] @=> int ap8[];
[0.8, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.5] @=> float vp8[];
[-2, -2, -2, -2, -2, -2, -1, -1, -1, -1, -2, -2] @=> int op8[];

//phrase 9
[ 5,  5,  5,  5,  5,  5,  2,  2,  2,  2,  4,  4] @=> int p9[];
[ 2,  1,  1,  2,  1,  2,  2,  1,  2,  1,  2,  1] @=> int ap9[];
[0.8, 0.0, 0.0, 1.0, 0.0, 1.0, 0.6, 0.0, 1.0, 0.0, 1.0, 0.0] @=> float vp9[];
[-2, -2, -2, -2, -2, -2, -1, -1, -1, -1, -2, -2] @=> int op9[];

//Execution of each phrase as neccesary
exec(p1, ap1, op1, vp1, sixteenth);
exec(p2, ap2, op2, vp2, sixteenth);
exec(p3, ap3, op3, vp3, sixteenth);
exec(p4, ap4, op4, vp4, sixteenth);

exec(p1, ap1, op1, vp1, sixteenth);
exec(p2, ap2, op2, vp2, sixteenth);
exec(p3, ap3, op3, vp3, sixteenth);
exec(p5, ap5, op5, vp5, sixteenth);

exec(p6, ap6, op6, vp6, sixteenth);
exec(p7, ap7, op7, vp7, sixteenth);
exec(p8, ap8, op8, vp8, sixteenth);
exec(p9, ap9, op9, vp9, sixteenth);

exec(p1, ap1, op1, vp1, sixteenth);
exec(p2, ap2, op2, vp2, sixteenth);
exec(p3, ap3, op3, vp3, sixteenth);
exec(p4, ap4, op4, vp4, sixteenth);

//last note
1 => inst.noteOff;

halfdot*2 => now;

