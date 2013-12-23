/*Class Rhodey Player, inherits from Player
this class is designed to be an exclusive Rhodey STK Instrument
player, though it also can function as a standard player if
initialized with another instrument that is not a Rhodey STKInstrument array*/

public class RhodeyPlayer extends Player
{
    Rhodey keys[];
     
    /*Initializes the Rhodey Player by giving it a set of Rhodey STK Instruments
    which are connected to its isntrument, they are also connected to master gain and pan,
    while also chucking the first Rhodey to inst, works in a similar way to the standard
    Player initializer*/    
    fun void initialize (Rhodey keys[])
    {
        keys @=> this.keys;
        this.keys[0] @=> this.inst;
        for(0 => int i; i< keys.cap(); i++)
        {
            this.keys[i] => this.master;
            1.0/this.keys.cap() => this.keys[i].gain;
        }
        1.0 => this.master.gain;
        0.0 => this.pan.pan; 
    }
    
    fun void initialize (Rhodey keys[], float gain)
    {
        keys @=> this.keys;
        this.keys[0] @=> this.inst;
        for(0 => int i; i< keys.cap(); i++)
        {
            keys[i] => this.master;
            1.0/this.keys.cap() => this.keys[i].gain;
        }
        gain => this.master.gain;
        0.0 => this.pan.pan; 
    }
    
    fun void initialize (Rhodey keys[], float gain, float pan)
    {
        keys @=> this.keys;
        this.keys[0] @=> this.inst;
        for(0 => int i; i< keys.cap(); i++)
        {
            keys[i] => this.master;
            1.0/this.keys.cap() => this.keys[i].gain;
        }
        gain => this.master.gain;
        pan => this.pan.pan; 
    }
    
    /*Function to play chords using, very similar to the playNotes method
    the difference is that it receives a 2 dimension array with the chords,
    instead of a 1 dimension array with the notes*/
    fun int playChords(int chords[][], int act[], float vel[], dur beat)
    {
        if((chords.cap() != act.cap()) || (vel.cap() != act.cap()) || (keys == null) || (chords[0].cap() > keys.cap())) return 0;
        else
        {
            for(0 => int i; i<chords.cap(); i++)
            {
                for(0 => int j; j<chords[0].cap(); j++)
                {
                    Std.mtof(chords[i][j]) => keys[j].freq;
                    if(act[i] == 2) vel[i] => keys[j].noteOn;
                    else if(act[i]==0)   1 => keys[j].noteOff;
                }
                
                beat => now;
            }
            for(0 => int i; i<keys.cap(); i++) 1 => keys[i].noteOff;
            return 1;
        }
    } 
}

