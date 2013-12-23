public class Drummer
{
    SndBuf drumkit[];
    Pan2 drumpan[];
    Gain master => dac;
    
    fun int initialize(SndBuf drumkit[]){
        drumkit @=> this.drumkit;
        Pan2 pan[drumkit.cap()] @=> drumpan;    
        for(0 => int i; i < this.drumkit.cap(); i++)
        {
            1.0/this.drumkit.cap() => this.drumkit[i].gain;
            this.drumkit[i].samples() => this.drumkit[i].pos;
            this.drumkit[i] => drumpan[i];
            0.0 => drumpan[i].pan;
            drumpan[i] => master;
        }
        1.0 => master.gain;
        return 1;
    }
    
    fun int initialize(SndBuf drumkit[], float gain){
        drumkit @=> this.drumkit;
        Pan2 pan[drumkit.cap()] @=> drumpan;    
        for(0 => int i; i < this.drumkit.cap(); i++)
        {
            1.0/this.drumkit.cap() => this.drumkit[i].gain;
            this.drumkit[i].samples() => this.drumkit[i].pos;
            this.drumkit[i] => drumpan[i];
            0.0 => drumpan[i].pan;
            drumpan[i] => master;
        }
        gain => master.gain;
        return 1;
    }
    
    fun int initialize(SndBuf drumkit[], float gain, float panning[]){
        if (panning.cap() != drumkit.cap()) return 0;
        drumkit @=> this.drumkit;
        Pan2 pan[panning.cap()] @=> drumpan;    
        for(0 => int i; i < this.drumkit.cap(); i++)
        {
            1.0/this.drumkit.cap() => this.drumkit[i].gain;
            this.drumkit[i].samples() => this.drumkit[i].pos;
            this.drumkit[i] => drumpan[i];
            panning[i] => drumpan[i].pan;
            drumpan[i] => master;
        }
        gain => master.gain;
        return 1;
    }
    
    fun int initialize(SndBuf drumkit[], float gain, float igain[], float panning[]){
        if (panning.cap() != drumkit.cap() || drumkit.cap() != igain.cap()) return 0;
        drumkit @=> this.drumkit;
        Pan2 pan[panning.cap()] @=> drumpan;    
        for(0 => int i; i < this.drumkit.cap(); i++)
        {
            igain[i] => this.drumkit[i].gain;
            this.drumkit[i].samples() => this.drumkit[i].pos;
            this.drumkit[i] => drumpan[i];
            panning[i] => drumpan[i].pan;
            drumpan[i] => master;
        }
        gain => master.gain;
        return 1;
    }
    
    fun void setGain(float gain)
    {
        gain => master.gain;
    }
    
    fun int setPan(float panning[])
    {
        if(panning.cap() != drumpan.cap()) return 0;
        for(0 => int i; i < panning.cap(); i++) panning[i] => drumpan[i].pan;
    }
    
    fun int play(int hits[][], dur beat)
    {
        if(hits.cap() > drumkit.cap()) return 0;
        for (0 => int i; i < hits[0].cap(); i++)
        {
            for(0 => int j; j< hits.cap(); j++)
            {
                1 => drumkit[j].rate;
                if(hits[j][i]!=0) 0 => drumkit[j].pos;
            }
            beat => now;
        }
        return 1;
    }
    
    fun int play(int hits[][], float rates[][], dur beat)
    {
        if(hits.cap() > drumkit.cap() || hits.cap() != rates.cap() || hits[0].cap() != rates[0].cap() ) return 0;
        for (0 => int i; i < hits[0].cap(); i++)
        {
            for(0 => int j; j< hits.cap(); j++)
            {
                if(hits[j][i] != 0)
                {
                    rates[j][i] => drumkit[j].rate;
                    if(rates[j][i] >= 0.0) 0=> drumkit[j].pos;
                    else drumkit[j].samples() => drumkit[j].pos; 
                }
            }
            beat => now;
        }
        return 1;
    }
}

