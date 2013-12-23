//Class BPM

public class BPM
{
    // global variables
    
    static dur quarter, eighth, sixteenth, thirtysecond, half, whole;
    
    fun void initialize(int beat)  {
        // beat is BPM, example 120 beats per minute
        
        60.0/(beat) => float SPB; // seconds per beat
        SPB :: second => quarter;
        quarter*0.5 => eighth;
        eighth*0.5 => sixteenth;
        sixteenth*0.5 => thirtysecond;        
        
        quarter*2 => half;
        quarter*4 => whole;
      
    }
    
    fun void initialize(float quarterdur)
    {
        quarterdur::second => quarter;
        quarter*0.5 => eighth;
        eighth*0.5 => sixteenth;
        sixteenth*0.5 => thirtysecond;        
        
        quarter*2 => half;
        quarter*4 => whole;
       
    }
    
    
}
