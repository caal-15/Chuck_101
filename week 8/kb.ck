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
           // print ascii value
           <<< "key DOWN:", msg.ascii >>>;
        }
        else // button up
        {
            // do nothing for now
        }
    }
}
