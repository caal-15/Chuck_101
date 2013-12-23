// human interface device
Hid hid;
// a message to convey data from Hid
HidMsg msg;

// device number
1 => int device;

// try to open keyboard
if( hid.openMouse( device ) == false ) me.exit();
// print
<<< "mouse:", hid.name(), "ready!" >>>;

// sound chain
SndBuf buffy => dac;
// read file into sndbuf
me.dir() + "/audio/snare_01.wav" => buffy.read;
// set playhead to the end of file
buffy.samples() => buffy.pos;

while( true )
{
    // wait for event
    hid => now;
    
    // get message
    while( hid.recv( msg ) )
    {
        if( msg.isButtonDown() )
        {
            // print
            <<< "BUTTON DOWN!" >>>;
            // play
            0 => buffy.pos;
        }
        else if( msg.isMouseMotion() )
        {
            if( msg.deltaX != 0 )
            {
                // print
                <<< "MOUSE DELTA X:", msg.deltaX >>>;
                msg.deltaX / 20.0 => buffy.rate;
            }
        }
    }
}
