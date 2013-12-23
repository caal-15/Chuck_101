class TheEvent extends Event
{
    int pitch;
    float velocity;
}

TheEvent e;

// patch
NRev ketchup => dac;
.1 => ketchup.mix;

// fun to spork
fun void foo( StkInstrument instr, TheEvent e, string s )
{
    // connect to output
    instr => ketchup;
    
    // go
    while( true )
    {
        // wait
        e => now;
        // play
        e.pitch => Std.mtof => instr.freq;
        e.velocity => instr.noteOn;
        // action
        <<< s, "" >>>;
    }
}

// spork a foo
spork ~ foo( new StifKarp, e, "hi" );
spork ~ foo( new Mandolin, e, "there" );
spork ~ foo( new Rhodey, e, "you" );
spork ~ foo( new Wurley, e, "come back here!" );

// let time advance
me.yield();

// signal the event
while( true )
{
    // set
    Std.rand2( 30, 90 ) => e.pitch;
    Std.rand2f( .2, .9 ) => e.velocity;
    // fire the next signal
    e.signal();
    // advance time
    1::second => now;
}
