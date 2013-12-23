fun void vibratto (float note, float alter, dur interval, dur length, Osc osc)
{
    0::second => dur timer;
    while (timer <= length)
    {
        note + alter => osc.freq;
        interval => now;
        -alter => alter;
        timer + interval => timer;    
    }
}

fun void granularize (int steps, SndBuf file)
{
    file.samples()/steps => int grain;
    Math.random2(0, file.samples() - grain) => file.pos;
    grain::samp => now;
}

SinOsc lol => dac;
0.5::second => dur quarter;
0.8 => lol.gain;

vibratto(440, 5, quarter/4, quarter*4, lol);

<<< lol.gain() >>>; //ACCESOR METHOD!