// sequencer (class example)
Gain master => dac;
SndBuf kick => master;
SndBuf hihat => master;
SndBuf snare => master;

me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/hihat_01.wav" => hihat.read;
me.dir() + "/audio/snare_01.wav" => snare.read;

0 => int counter; 
0 => kick.gain;
0 => snare.gain;
0 => hihat.gain;
while(true)
{
    
    if ((counter % 8 == 0) || (counter % 8 == 4))
    {
        1 => kick.gain;
        0 => kick.pos;
    }
    if ((counter % 8 == 2) || (counter % 8 == 6))
    {
        1 => snare.gain;
        0 => snare.pos;
    }
    0.3 => hihat.gain;
    0 => hihat.pos;
    counter++;
    0.25::second => now;
}