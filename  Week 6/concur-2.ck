//-----------------------------------------------------------------------------
// name: concur-1.ck
// desc: basic concurrency example
//
// authors: Ge Wang (ge@ccrma.stanford.edu)
//    date: spring 2013
//-----------------------------------------------------------------------------

// sound chain
ModalBar modal => NRev reverb => dac;
// set reverb mix
.1 => reverb.mix;
// modal bar parameters
7 => modal.preset;
.9 => modal.strikePosition;

// spork detune() as a child shred
// note: must do this before entering into infinite loop below!
spork ~ detune();

// infinite time loop
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

// function for varying tuning over time
fun void detune()
{
    // loop
    while( true )
    {
        // update frequency
        84 + Math.sin(now/second*.25*Math.PI) * 2 => Std.mtof => modal.freq;
        // advance time (controls update rate)
        5::ms => now;
    }
}
