
// two bar
ModalBar one => dac.left;
ModalBar two => dac.right;

// set initial parameters
7 => one.preset;
4 => two.preset;
.9 => one.strikePosition => two.strikePosition;
60 => Std.mtof => one.freq;
64 => Std.mtof => two.freq;

// function foo
fun void foo()
{
    // infinite time loop
    while( true )
    {
        // print
        <<< "foo!", "" >>>;
        // strike
        1 => one.strike;
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
        // strike
        1 => two.strike;
        // advance time
        1::second => now;
    }
}

// spork foo() and bar() each on a child shred
spork ~ foo();
spork ~ bar();

// infinite time loop to keep the parent shred alive
while( true ) 1::second => now;
