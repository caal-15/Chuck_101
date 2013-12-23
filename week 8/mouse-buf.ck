SndBuf buffy => dac;

me.dir() + "/audio/snare_01.wav" => buffy.read;
buffy.samples() => buffy.pos;

Hid hid;
HidMsg msg;

if( !hid.openMouse(1) ) me.exit();

<<< "mouse:", hid.name(), "ready!" >>>;

while( true )
{
    hid => now;
    
    while( hid.recv( msg ) )
    {
        if( msg.isButtonDown() )
        {
            // print
            <<< "BUTTON DOWN!" >>>;
            // play!
            0 => buffy.pos;
        }
        else if( msg.isMouseMotion() )
        {
            if( msg.deltaX )
            {
                <<< "MOUSE DELTA X:", msg.deltaX >>>;
                msg.deltaX / 20.0 => buffy.rate;
            }
        }
    }
}