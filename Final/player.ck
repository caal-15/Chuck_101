/*Class Player
Has an STK Instrument connected to a Gain and a Pan,
It's purpose is to play notes using the instrument received*/
public class Player
{
    StkInstrument inst;
    Gain master => Pan2 pan => dac;//Useful for extensions
    
    /*Receives the instruments and chucks it to the player, as well as to master
    If no other parameters are given, sets master to 1.0 and Pan to 0.0, if a 
    float is received with the instrument, will use that float to set gain
    if two floats are received with the instrument, it will ise the first float
    for gain anth second for panning*/
    fun void initialize (StkInstrument inst)
    {
        inst @=> this.inst;
        this.inst => master;
        1.0 => this.master.gain;
        0.0 => this.pan.pan;
    }
    
    fun void initialize (StkInstrument inst, float gain)
    {
        inst @=> this.inst;
        this.inst => this.master;
        gain => this.master.gain;
        0.0 => this.pan.pan;
    }
    
    fun void initialize (StkInstrument inst, float gain, float pan)
    {
        inst @=> this.inst;
        this.inst => this.master;
        gain => this.master.gain;
        pan => this.pan.pan;
    }
    
    //function to set Pan
    fun void setPan(float pan)
    {
        pan => this.pan.pan;
    }
    
    //function to set Gain
    fun void setGain(float gain)//Useful for extensions
    {
        gain => master.gain;
    }
    
    /*function that plays MIDI notes received in an array (notes), according
    to the activation status (act), and the velocity (vel) received also in
    arrays, and following the smalles duration to be taken into account (beat)*/
    fun int playNotes(int notes[], int act[], float vel[], dur beat)
    {
        if((notes.cap() != act.cap()) || (vel.cap() != act.cap())) return 0;
        else
        {
            for(0 => int i; i<notes.cap(); i++)
            {
                Std.mtof(notes[i]) => inst.freq;
                if(act[i] == 2) vel[i] => inst.noteOn;
                else if(act[i]==0)   1 => inst.noteOff;
                beat => now;
            }
            1 => inst.noteOff;
            return 1;
        }
    }
    
    fun int shredNote(int note, int times, dur beat)
    {
        Std.mtof(note) => inst.freq;
        for(0 => int i; i < times; i++) 
        {
            1.0 => inst.noteOn;
            beat => now;
        }
        inst.noteOff;
        return 1;    
    }
    
    fun int shredNote(int note, float low, float high, int times, dur beat)
    {
        Std.mtof(note) => inst.freq;
        for(0 => int i; i < times; i++) 
        {
            Math.random2f(low, high) => inst.noteOn;
            beat => now;
        }
        inst.noteOff;
        return 1;    
    }

}