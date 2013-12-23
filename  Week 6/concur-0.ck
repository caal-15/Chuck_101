
// function foo
fun void foo()
{
    // infinite time loop
    while( true )
    {
        // print
        <<< "foo!", "" >>>;
        // advance time
        250::ms => now;
    }
}

// function bar
fun void bar()
{
    // infinite time loop
    while( true )
    {
        // print
        <<< "BAAAAAAAR!!!", "" >>>;
        // advance time
        1::second => now;
    }
}

// spork foo() and bar() each on a child shred
spork ~ foo();
spork ~ bar();

// infinite time loop to keep the parent shred alive
while( true ) 1::second => now;
