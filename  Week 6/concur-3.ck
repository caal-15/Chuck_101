//-----------------------------------------------------------------------------
// name: concur-2.ck
// desc: polyrhythmic concurrency example
//
// authors: Ge Wang (ge@ccrma.stanford.edu)
//    date: spring 2013
//-----------------------------------------------------------------------------

// sound chain (left)
ModalBar modal => NRev reverbL => dac.left;
// set reverb mix
.1 => reverbL.mix;
// modal bar parameters
7 => modal.preset;
.9 => modal.strikePosition;

// another sound chain (right)
ModalBar modal2 => NRev reverbR => dac.right;
// set reverb mix
.1 => reverbR.mix;
// modal bar parameters
3 => modal2.preset;
.9 => modal.strikePosition;

// spork off 3 shreds using functions
spork ~ one();
spork ~ two();
spork ~ detune();

// keep the main shred going (so child shreds don't stop)
while( true ) 1::second => now;

// rhythm 1
fun void one()
{
    // infinite loop
    while( true )
    {
        // note!
        1 => modal.strike;
        // wait
        300::ms => now;
        // note!
        .7 => modal.strike;
        // wait
        300::ms => now;

        // repeat 6 times
        repeat( 6 )
        {
            // note!
            .5 => modal.strike;
            // wait
            100::ms => now;
        }
    }
}

// rhythm 2
fun void two()
{
    // infinite loop
    while( true )
    {
        // wait! (offset to cause phasing)
        150::ms => now;

        // note!
        1 => modal2.strike;
        // wait
        300::ms => now;
        // note!
        .75 => modal2.strike;
        // wait
        300::ms => now;
        // note!
        .5 => modal2.strike;
        // wait
        300::ms => now;
        // note!
        .25 => modal2.strike;
        // wait
        300::ms => now;
    }
}

// detuning (both modalbars)
fun void detune()
{
    // infinite loop
    while( true )
    {
        // update modal bar 1 resonances
        84 + Math.sin(now/second*.25*Math.PI) * 2 => Std.mtof => modal.freq;
        // update modal bar 2 resonances
        76 + Math.sin(now/second*.1*Math.PI) * .5 => Std.mtof => modal2.freq;
        5::ms => now;
    }
}
