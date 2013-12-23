//Assignment 6
<<< "Assignment_6_Ambrozia" >>>;

//Drumroll
//Load File, Set Parameters
SndBuf snare => Pan2 span => dac;
me.dir(-1) + "/audio/snare_01.wav" => snare.read;
0.2 => span.pan;
0.0 => snare.gain; 


//Durations
0.625::second => dur quarter;
quarter/2 => dur eighth;
quarter/4 => dur sixteenth;

quarter*2 => dur half;
quarter*4 => dur whole;

//Execute Drum Roll while turning up the gain 
for (0 => int i; i<48 ; i++)
{
   snare.gain() + 0.45/48.0 => snare.gain;
   0 => snare.pos;
   Math.random2f(0.6, 1.0) => snare.rate;
   sixteenth => now; 
}