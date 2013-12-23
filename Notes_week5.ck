//--VIBRATTO TYPE MODULATION---

SinOsc vib => SawOsc viol => ADSR env => dac;
(0.5::second, 0.1::second, 0.6, 0.5::second) => env.set;
660.0 => viol.freq;
6.0 => vib.freq;
0.6 => viol.gain;
2 => viol.sync; //set sync mode to frequency modulation
2 => vib.gain; //you can set a gain for the oscillator
//so the effect can become stronger oor weaker
1 => env.keyOn;

2.0::second => now;

1 => env.keyOff;

2.0::second => now;
//---SINTHESIS THROUGH FM MODULATION---

SinOsc mod => SinOsc car => ADSR env2 => dac;
(0.1::second, 0.01::second, 0.6, 0.2::second) => env2.set;
10000 => mod.gain; //HIGH GAIN TO EMPHAZISE THE EFFECT
2 => car.sync; //set sync mode to FM
0.6 => car.gain;
for(0 => int i; i<5; i++)
{
    
    Math.random2f(100.0, 1000.0) => car.freq; //Both frequencies in the audio range!!!!!!
    Math.random2f(100.0, 1000.0) => mod.freq; //Different frequencies generate different harmonics, spectrum
    1 => env2.keyOn;
    1::second => now;
    1 => env2.keyOff;
    1::second => now;
}


//---PHYSICAL MODELED "STRING"---
Noise n => ADSR env3 => Delay d => dac;
d => d; //feedback D:, works as a "loop"!!!!
0.99 => d.gain;
(0.005::second, 0.001::second, 0.0 ,0.2::second) => env3.set; //Strumming the string
0.005::second => d.delay;

1 => env3.keyOn;

1::second => now;

1 => env3.keyOff;

1::second => now;

//---FILTERS--
Impulse imp => ResonZ res => dac;

200 => res.Q;

for(0 => int i; i<100 ; i++)
{
    200 => imp.next;
    Math.random2f(200, 1000) => res.freq;
    Math.random2f(0.02, 0.05)::second => now;
}

//---AUDIO EFFECTS---
/* -Reverb types : JCRev, NRev *best one more complex, PRCRev *lower grade
   -Chorus
   - Pitch Shifter: PitShift
*/

//---INCLUDED PHYSICAL MODELS---
/* Mandolin with body size and other cool methods


