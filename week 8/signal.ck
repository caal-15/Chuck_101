Event e;

// fun to spork
fun void foo( Event e )
{
    // wait
    e => now;
    // action
    <<< "I am foo!", "" >>>;
}

// spork a foo
spork ~ foo( e );

// let time advance
me.yield();

// signal the event
e.signal();

// wait
while( true ) 1::day => now;
