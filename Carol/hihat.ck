//Assignment_7_Carol_of_the_Bells
<<< "Assignment_7_Carol_of_the_Bells" >>>;

//Hihat
BPM t;

SndBuf hihat => Pan2 pan => dac;
0.35 => hihat.gain;
0.5 => pan.pan;
me.dir(-1) + "/audio/hihat_03.wav" => hihat.read;

for(0 => int i; i<12; i++)
{
    0 => hihat.pos;
    Math.random2f(0.6, 1.0) => hihat.rate;
    t.eighth => now;
}