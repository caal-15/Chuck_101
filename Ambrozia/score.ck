//Assignment 6
<<< "Assignment_6_Ambrozia" >>>;

//durations 
0.625::second => dur quarter;
quarter/2 => dur eighth;
quarter/4 => dur sixteenth;

quarter*2 => dur half;
quarter*4 => dur whole;

quarter + half => dur halfdot;

//Add Guitar
Machine.add(me.dir() + "/guitar.ck");
eighth*11 => now;
//Add Bass
Machine.add(me.dir() + "/bass.ck");
eighth => now;
//Add Flute
Machine.add(me.dir() + "/flute.ck");
halfdot*4 => now;
//Add randomness each bar
for(0 => int i; i<8; i++) 
{
    Machine.add(me.dir() + "/randomness.ck");
    halfdot => now;
} 
//Add Drumroll
Machine.add (me.dir() + "/drumroll.ck");
//Add randomness each bar
for(0 => int i; i<4; i++) 
{
    Machine.add(me.dir() + "/randomness.ck");
    halfdot => now;
} 
halfdot*2 => now;

