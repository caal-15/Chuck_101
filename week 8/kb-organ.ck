// Hid object
Hid hi;
// message to convey data from Hid device
HidMsg msg;

// device number: which keyboard to open
0 => int device;

// open keyboard; or exit if fail to open
if( !hi.openKeyboard( device ) ) me.exit();
// print a message!
<<< "keyboard '" + hi.name() + "' ready", "" >>>;

// sound chain
BeeThree organ => JCRev r => dac;

// set gains
.05 => r.mix;
// silence the organ for now
0 => organ.gain;

// infinite event loop
while( true )
{
    // wait for event
    hi => now;

    // get message
    while( hi.recv( msg ) )
    {
        // filter out button down events
        if( msg.isButtonDown() )
        {
            // take ascii value of button, convert to freq
            Std.mtof( msg.ascii ) => float freq;
            // if too high then skip
            if( freq > 20000 ) continue;

            // set the frequency
            freq => organ.freq;
            // set the gain
            .5 => organ.gain;
            // sound the note
            1 => organ.noteOn;

            // optional wait some minimal amount of time
            80::ms => now;
        }
        else // this should button up
        {
            // deactivate the note
            0 => organ.noteOff;
        }
    }
}
