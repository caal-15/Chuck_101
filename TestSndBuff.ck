//Sound chain
SndBuf snare => Pan2 sp => dac;


//Basics
me.dir() + "/audio/snare_01.wav" => string file;

file => snare.read;

0 => snare.pos;

.5=> snare.gain;

1.0 => snare.rate;

-1.0 => sp.pan;

1::second => now;

snare.samples() => int numSamples;

<<< numSamples >>>;

1.0 => sp.pan;

numSamples => snare.pos;

-1.0 => snare.rate;

1::second => now;

//Management
0.0 => sp.pan;
string snares[3];
me.dir() + "/audio/snare_01.wav" => snares[0];
me.dir() + "/audio/snare_02.wav" => snares[1];
me.dir() + "/audio/snare_03.wav" => snares[2];

for(0 => int i; i<10; i++){
    snares[Math.random2(0, 2)] => snare.read;
    0 => snare.pos;
    1.0 => snare.rate;
    0.25::second => now;
}

//Stereo Sound
SndBuf2 stereo => dac;
me.dir() + "/audio/stereo_fx_01.wav" => stereo.read;
0 => stereo.pos;
1.0 => stereo.gain;
10::second => now;