//Test program
//10/22/2013



SinOsc s => dac;
1.0 => s.gain;

61.74 => s.freq;
0.25::second => now;

92.5 => s.freq;
0.25::second => now;

123.47 => s.freq;
0.25::second => now;