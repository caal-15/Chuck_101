Event e;

// fun to spork
fun void foo( Event e, string s )
{
    while( true )
    {
        // wait
        e => now;
        // action
        <<< s, "" >>>;
    }
}

// spork a foo
spork ~ foo( e, "hi" );
spork ~ foo( e, "there" );
spork ~ foo( e, "you" );
spork ~ foo( e, "come back here!" );

// let time advance
me.yield();

// signal the event
while( true )
{
    // fire the next signal
    e.signal();
    // advance time
    1::second => now;
}
