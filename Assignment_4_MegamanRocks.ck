//Assignment 4
<<< "Assignment_4_MegamanRocks" >>>;

//Scale definition Eb mixolidian
[51, 53, 55, 56, 58, 60, 61] @=> int E_mix[];

//Duration definitions
0.6::second => dur quarter;
quarter/2 => dur eighth;
quarter/4 => dur sixteenth;

quarter*2 => dur half;
quarter*4 => dur whole;

//Function to octave midi notes
fun int octavem(int note, int oct)
{
    int newnote;
    note + 12*oct => newnote;
    return newnote;
}

/*Function, compass execution receives an array of instruments (SawOscs) with the respective notes (represented by 
it's grade on the scale) to be executed by each instrument one and the octave of each note, also receives an array 
of SndBuf and the "hits" each SndBuff object shall execute, finally receives the beat, and the scale in order to
convert to Midi notes, doesn't return anything*/
fun void compass_Exe (SawOsc melo[], SndBuf perc[], int notes[][], int oct[][], int hits[][], dur beat, int scale[])
{
    for(0 => int i; i < notes[0].cap(); i++)
    {
        for(0 => int j; j < notes.cap(); j++)
        {
            Std.mtof(octavem(scale[notes[j][i]], oct[j][i])) => melo[j].freq;
            
            
        }
        for(0 => int j; j < hits.cap(); j++)
        {
            if(hits[j][i] == 1) 0 => perc[j].pos;
        }
        beat => now;    
    }
}


/*Function to harmonize, Taces the length of the scale, the grades and
the octaves of the notes to be harmonized, and finally the interval
returns a two dimension array containing the new grades and octaves*/ 
fun int[][] harmonize (int scale_len, int sect[], int oct[], int inter)
{
    int harm[2][sect.cap()];
    for(0 => int i; i < sect.cap(); i++)
    {
        if(inter > 0)
        {
            
            if(sect[i] + inter >= scale_len)
            {
                sect[i] + inter - (scale_len) => harm[0][i];
                oct[i] + 1 => harm[1][i];
            } 
            else 
            {
                sect[i] + inter => harm[0][i];
                oct[i] => harm[1][i];
            }
        }
        else
        {
            if(sect[i] + inter < 0) 
            {
                scale_len + (sect[i] + inter) => harm[0][i];
                oct[i] - 1 => harm[1][i];
            }
            else 
            {
                sect[i] + inter => harm[0][i];
                oct[i] => harm[1][i];
            }    
        }
                
    }
    return harm;
}

// Sound network
Gain instru => Gain master => dac;
Gain perc => master;
1 => master.gain;
0.5 => instru.gain;
0.5 => perc.gain;
SawOsc mel[3];
mel[0] => Pan2 pmel1 => instru;
mel[1] => Pan2 pmel2 =>instru;
mel[2] => instru;
SndBuf drums[4];
drums[0] => Pan2 pdrums1 => perc;
drums[1] => perc;
drums[2] => Pan2 pdrums2 => perc;
drums[3] => Pan2 pdrums3 =>perc;


//Set gains for each instrument and SndBUff
1.0/3.0 => mel[0].gain;
1.0/3.0 => mel[1].gain;
1.0/3.0 => mel[2].gain;
1.0/3.0 => mel[2].gain;
1.0 => drums[0].gain;
1.0 => drums[1].gain;
1.0 => drums[2].gain;
1.0 => drums[3].gain;

//Set Panning
-1 => pmel1.pan;
1 => pmel1.pan;
0.2 => pdrums1.pan;
-0.2 => pdrums2.pan;
-0.4 => pdrums3.pan;

//Load Samples
me.dir() + "/audio/snare_01.wav" => drums[0].read;
me.dir() + "/audio/kick_01.wav" => drums[1].read;
me.dir() + "/audio/hihat_01.wav" => drums[2].read;
me.dir() + "/audio/hihat_04.wav" => drums[3].read;

//Set PlayHeads to end
drums[0].samples() => drums[0].pos;
drums[1].samples() => drums[1].pos;
drums[2].samples() => drums[2].pos;
drums[3].samples() => drums[3].pos;

//Set Rates
1 => drums[0].rate;
1 => drums[1].rate;
1 => drums[2].rate;
1 => drums[3].rate;

//Grades of the first figure for lead instruments
[0, 4, 0, 4, 0, 1, 0, 4, 0, 4, 1, 2, 0, 4, 2, 1, 0, 5, 0, 1] @=> int fl1[];
//Octaves of the first figure for lead isntruments
[2, 1, 2, 1, 2, 2, 2, 1, 2, 1, 2, 2, 2, 1, 2, 2, 2, 1, 2, 2] @=> int ol1[];

//Grades of the first figure for bass instruments
[0,  0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] @=> int fb1[];
//Octaves of the first figure for bass isntruments
[0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] @=> int ob1[];

//Hits of the snare
[0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] @=> int s1[];
//Hits of the kick
[1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] @=> int k1[];
//Hits of the closed Hihat
[0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0] @=> int ch1[];
//Hits of the Open hihat
[0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0] @=> int oh1[];

//assignation to multidimensional array in order to sedn to the function
[fl1, fl1, fb1] @=> int f[][];
[ol1, ol1, ob1] @=> int o[][];
[s1, k1, ch1, oh1] @=> int d[][];

//Execute the first figure twice
compass_Exe(mel, drums, f, o, d, sixteenth, E_mix);
compass_Exe(mel, drums, f, o, d, sixteenth, E_mix);

//Harmonize the lead of the first figure
harmonize(E_mix.cap(), fl1, ol1, 2) @=> int fh1[][];

//Assign the harmony to the multidimensional array
fh1[0] @=> f[1];
fh1[1] @=> o[1];

//kill bass
0 => mel[2].gain;

//change drum pattern, use of random "because i have to..."
[Math.random2(0,1), 0, 0, 0, 0, 0, 0, 0, Math.random2(0,1), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] @=> s1;
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] @=> k1;
[1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0] @=> ch1;
[Math.random2(0,1), 0, 0, 0, 0, 0, 0, 0, Math.random2(0,1), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] @=> oh1;

//Assign to multidimensional array
[s1, k1, ch1, oh1] @=> d;

//Execute figure with harmony and changed drum pattern twice
compass_Exe(mel, drums, f, o, d, sixteenth, E_mix);
compass_Exe(mel, drums, f, o, d, sixteenth, E_mix);

//-----FIGURE 2-----

//Second lead figure, for first lead instrument
[2, 1, 0, 6, 5, 4, 6, 0, 6, 2, 2, 1, 0, 6, 5, 4, 6, 0, 6, 2] @=> fl1;
[2, 2, 2, 1, 1, 1, 1, 2, 1, 1, 2, 2, 2, 1, 1, 1, 1, 2, 1, 1] @=> ol1;

//Arpeggios for second lead instrument
[2, 6, 2, 3, 6, 3, 2, 6, 2, 2, 2, 6, 2, 3, 6, 3, 2, 6, 2, 2] @=> int fl2[];
[0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0] @=> int ol2[];

//New bass line
[2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2] @=> fb1;
[-1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0] @=> ob1;

//Bring back the bass
1.0/3.0 => mel[2].gain;

//Assign to multidimensional array
[fl1, fl2, fb1] @=> f;
[ol1, ol2, ob1] @=> o;

//Change drum pattern
[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0] @=> s1;
[0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1] @=> k1;
[0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1] @=> ch1;
[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0] @=> oh1;

//Assign to multidimensional array
[s1, k1, ch1, oh1] @=> d;

//execute the figure
compass_Exe(mel, drums, f, o, d, sixteenth, E_mix);


//Bring WHOLE Figure 2 a fourth up
harmonize(E_mix.cap(), fl1, ol1, 3) @=> fh1;
fh1[0] @=> f[0];
fh1[1] @=> o[0];

harmonize(E_mix.cap(), fl2, ol2, 3) @=> fh1;
fh1[0] @=> f[1];
fh1[1] @=> o[1];

harmonize(E_mix.cap(), fb1, ob1, 3) @=> fh1;
fh1[0] @=> f[2];
fh1[1] @=> o[2];

//Execute the melody a fourth up
compass_Exe(mel, drums, f, o, d, sixteenth, E_mix);


//Bring WHOLE Figure 2 a secondth up
harmonize(E_mix.cap(), fl1, ol1, 1) @=> fh1;
fh1[0] @=> f[0];
fh1[1] @=> o[0];

harmonize(E_mix.cap(), fl2, ol2, 1) @=> fh1;
fh1[0] @=> f[1];
fh1[1] @=> o[1];

harmonize(E_mix.cap(), fb1, ob1, 1) @=> fh1;
fh1[0] @=> f[2];
fh1[1] @=> o[2];

compass_Exe(mel, drums, f, o, d, sixteenth, E_mix);

//Bring WHOLE Figure 2 a fifth up
harmonize(E_mix.cap(), fl1, ol1, 4) @=> fh1;
fh1[0] @=> f[0];
fh1[1] @=> o[0];

harmonize(E_mix.cap(), fl2, ol2, 4) @=> fh1;
fh1[0] @=> f[1];
fh1[1] @=> o[1];

harmonize(E_mix.cap(), fb1, ob1, 4) @=> fh1;
fh1[0] @=> f[2];
fh1[1] @=> o[2];

compass_Exe(mel, drums, f, o, d, sixteenth, E_mix);

//change Bass line
[2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2] @=> fb1;
[-1, -1, 0, -1, 0, -1, -1, 0, -1, 0, -1, -1, 0, -1, 0, -1, -1, 0, -1, 0] @=> ob1;

[fl1, fl2, fb1] @=> f;
[ol1, ol2, ob1] @=> o;

[0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] @=> s1;
[1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1] @=> k1;
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0] @=> ch1;
[1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0] @=> oh1;

[s1, k1, ch1, oh1] @=> d;

compass_Exe(mel, drums, f, o, d, sixteenth, E_mix);

//Same process as before
harmonize(E_mix.cap(), fl1, ol1, 3) @=> fh1;
fh1[0] @=> f[0];
fh1[1] @=> o[0];

harmonize(E_mix.cap(), fl2, ol2, 3) @=> fh1;
fh1[0] @=> f[1];
fh1[1] @=> o[1];

harmonize(E_mix.cap(), fb1, ob1, 3) @=> fh1;
fh1[0] @=> f[2];
fh1[1] @=> o[2];

compass_Exe(mel, drums, f, o, d, sixteenth, E_mix);

//-------------------------------------------------

harmonize(E_mix.cap(), fl1, ol1, 1) @=> fh1;
fh1[0] @=> f[0];
fh1[1] @=> o[0];

harmonize(E_mix.cap(), fl2, ol2, 1) @=> fh1;
fh1[0] @=> f[1];
fh1[1] @=> o[1];

harmonize(E_mix.cap(), fb1, ob1, 1) @=> fh1;
fh1[0] @=> f[2];
fh1[1] @=> o[2];

compass_Exe(mel, drums, f, o, d, sixteenth, E_mix);

//-------------------------------------------------

harmonize(E_mix.cap(), fl1, ol1, 4) @=> fh1;
fh1[0] @=> f[0];
fh1[1] @=> o[0];

harmonize(E_mix.cap(), fl2, ol2, 4) @=> fh1;
fh1[0] @=> f[1];
fh1[1] @=> o[1];

harmonize(E_mix.cap(), fb1, ob1, 4) @=> fh1;
fh1[0] @=> f[2];
fh1[1] @=> o[2];

compass_Exe(mel, drums, f, o, d, sixteenth, E_mix);

//set last note
Std.mtof(octavem(E_mix[0], 3)) => mel[0].freq;
Std.mtof(octavem(E_mix[0], 2)) => mel[1].freq;
Std.mtof(octavem(E_mix[0], 0)) => mel[2].freq;
0 => drums[0].pos;
0 => drums[1].pos;
0 => drums[2].pos;

//fadeout (should've done a function for this)
for(0 => int i ; i <= 100; i++)
{ 
    master.gain() - 0.01 => master.gain;
    sixteenth/4 => now;
}