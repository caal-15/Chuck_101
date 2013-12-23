/*General operations class
Keeps the scale and provides useful operations
for general purpose */
public class General 
{
    static int scale[];
    
    //Initializes with the scale
    fun int initialize(int scale[])
    {
        if(scale.cap() != 7) return 0;
        scale @=> this.scale;
        return 1; 
    }
        
    //Receives grades of the scale and the octaves they are in
    //and returns an array with the standard MIDI note numbers
    fun int[] gradeToMidi (int grades[], int oct[])
    {
        if(grades.cap() != oct.cap()) return [0];
        else
        {
            int midiNotes[grades.cap()];
            for(0 => int i; i<grades.cap(); i++)
            {
                if(grades[i]>6 || grades[i]<0) return [0];
                scale[grades[i]] + 12*oct[i] => midiNotes[i];  
            }
            return midiNotes;
        }
            
    }
    
    
    //Similar to the previous one, but also harmonizes the
    //notes with the specified interval (inter) in the process;
    fun int[] harmonize(int sect[], int oct[], int inter)
    {
        int harm[sect.cap()];
        if(sect.cap() != oct.cap()) return[0]; 
        for(0 => int i; i < sect.cap(); i++)
        {
            if(sect[i]>6 || sect[i]<0) return [0];
            if(inter > 0)
            {
                if(sect[i] + inter >= 7) scale[sect[i] + inter - 7] + 12*(oct[i]+1) => harm[i];
                else scale[sect[i] + inter] + 12*oct[i] => harm[i];
            }
            else
            {
                if(sect[i] + inter < 0) scale[7 + (sect[i] + inter)] + 12*(oct[i]-1) => harm[i];
                else scale[sect[i] + inter] + 12*oct[i] => harm[i];                   
            }        
        }
        return harm;
    }
}