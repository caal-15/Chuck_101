//Assignment_3_Fck_Techno
<<< "Assignment_3_Fck_Techno" >>>;
//Sound Network
SawOsc rythm => Pan2 rythmPan => Gain melody => dac;
SawOsc lead => Pan2 leadPan => melody => dac;
SndBuf kick => Pan2 kickPan => Gain drums => dac;
SndBuf snare => Pan2 snarePan => drums => dac;
SndBuf chihat => Pan2 hihatPan => drums => dac;
SndBuf ohihat => hihatPan => drums => dac;
SndBuf rand1 => Pan2 rand1Pan => Gain randGain => dac;
SndBuf rand2 => Pan2 rand2Pan => randGain => dac;

//sound file loading (Drumkit)
me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/snare_01.wav" => snare.read;
me.dir() + "/audio/hihat_01.wav" => chihat.read;
me.dir() + "/audio/hihat_04.wav" => ohihat.read;

//String array containing soundfiles
[me.dir() + "/audio/clap_01.wav",
me.dir() + "/audio/click_01.wav",
me.dir() + "/audio/cowbell_01.wav",
me.dir() + "/audio/stereo_fx_01.wav",
me.dir() + "/audio/click_02.wav",
me.dir() + "/audio/click_03.wav",
me.dir() + "/audio/stereo_fx_03.wav"] @=> string files[];



//Scale definition
[50, 52, 53, 55, 57, 59, 60] @=> int D_d[];

//Dur definitions
0.25::second => dur quarter;
quarter/2 => dur eighth;
quarter/4 => dur sixteenth;

quarter*2 => dur half;
quarter*4 => dur whole;

//Set Drum Rates
1.0 => snare.rate;
1.0 => kick.rate;
1.0 => chihat.rate;
1.0 => ohihat.rate;

//Set Gains
0.3 => kick.gain;
0.7 => snare.gain;
0.2 => chihat.gain;
0.2 => ohihat.gain;
0.5 => lead.gain;
0.5 => rythm.gain;
1 => rand1.gain;
1 => rand2.gain;
0 => melody.gain;
0 => drums.gain;
0 => randGain.gain;

//Set Drumkit headers to end
kick.samples() => kick.pos;
snare.samples() => snare.pos;
chihat.samples() => chihat.pos;
ohihat.samples() => ohihat.pos;

//Panning
-1.0 => rythmPan.pan;
1.0 => leadPan.pan;
-0.2 => hihatPan.pan;
0.2 => snarePan.pan;

//Figures construction, used later in different ways
//to create different phrases, the first array
//represents the note, the second one represents
//the cotave it should be played in according to the
//main scale defined above
[ 0,  0, 2,  0, 0, 1,  0,  0] @=> int c1[];
[-1, -1, 0, -1, 0, 0, -1, -1] @=> int oc1[];

[2,  0, 0, 1,  0,  0,  6, 0] @=> int c2[];
[0, -1, 0, 0, -1, -1, -1, 0] @=> int oc2[];

[5,  0, 4,  0, 3,  0,  6, 0] @=> int c3[];
[0, -1, 0, -1, 0, -1, -1, 0] @=> int oc3[];

[2,  0, 0, 1,  0,  0,  6, 0,  6] @=> int c4[];
[0, -1, 0, 0, -1, -1, -1, 0, -1] @=> int oc4[];

[ 4,  4,  6,  4,  6 , 0,  4,  4] @=> int c5[];
[-1, -1, -1, -1, -1 , 0, -1, -1] @=> int oc5[];

[ 5,  5,  6,  5,  6,  5,  6,  5,  6, 0, 1,  0] @=> int c6[];
[-1, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, -1] @=> int oc6[];

[ 5,  5, 5,  5, 4,  5, 3,  5] @=> int c7[];
[-1, -1, 0, -1, 0, -1, 0, -1] @=> int oc7[];

[2,  5, 1,  5, 2,  5, 1, 2] @=> int c8[];
[0, -1, 0, -1, 0, -1, 0, 0] @=> int oc8[];

//Construction of main phrase using the figures above
[ c1,  c2,  c1,  c3,  c1,  c4,  c5,  c6] @=> int p1[][];
[oc1, oc2, oc1, oc3, oc1, oc4, oc5, oc6] @=> int op1[][];

//Construction of Intro phrase 
[ c1, c2,  c3,  c4,  c5] @=> int p2[][];

//Background note
Std.mtof(D_d[0] - 12);
0 => float gain;
for(0 => int i; i < p2.cap(); i++)
{
    for (0 => int j; j < p2[i].cap(); j++)
    {
        //Each note of the figures in arandom octave
        Std.mtof(D_d[p2[i][j]] + 12*Math.random2(-2,2)) => lead.freq;
        //Bring up the Gain up to 0.4
        if(gain < 0.4) gain + 0.02 => gain;
        gain => melody.gain;
        gain => randGain.gain;
        //Load a 2 random soundfiles
        files[Math.random2(0, files.cap()-1)] => rand1.read;
        files[Math.random2(0, files.cap()-1)] => rand2.read;
        //set header to the last sample
        rand1.samples() => rand1.pos; 
        rand2.samples() => rand2.pos;
        //Set a random panning for both soundfiles
        Math.random2f(-1.0, 1.0) => rand1Pan.pan;
        Math.random2f(-1.0, 1.0) => rand2Pan.pan;
        //Set a random reverse rate for both soundfiles
        Math.random2f(-1.0, -0.2) => rand1.rate;
        Math.random2f(-1.0, -0.2) => rand2.rate;
        //Advance time
        quarter => now;
    }
}
//Set frequency of lead
Std.mtof(D_d[0]) => lead.freq;
//Wait in the same notes for 3 compasses
whole*3 => now;
//kill random soundfiles
0 => randGain.gain;
//kill any sounding notes
0 => melody.gain;
//First drumkit hit
0.5 => drums.gain;
//Set positions to 0 in order to read the sample
0 => snare.pos;
0 => kick.pos;
0 => ohihat.pos;
<<< "Fck Techno! You Want Metal, Right?!" >>>;
whole => now;

//drum counter
0 => int drumc;
//Set Melody and Percussion gains
0.35 => melody.gain;
0.3 => drums.gain; 

//Execute main phrase (p1)
for(0 => int i; i<p1.cap() ; i++)
{
   for(0 => int j; j<p1[i].cap(); j++)
   {
       // snare every pair hit 
       if (drumc % 2 == 0) 0=> snare.pos;
       //closed hihat and kick every odd hit    
       else
       {
           0 => kick.pos;
           0 => chihat.pos;
       }
       //Note of the melody
       Std.mtof(D_d[p1[i][j]] + 12*op1[i][j]) => rythm.freq => lead.freq;
       //Alteration in the rythmic pattern
       if (i == 5 && (j == 6 || j == 7))
       {
           if (j == 7) drumc++; //Increase Drum Counter
           sixteenth => now;
       }
       else
       {
           //Increase Drum Counter
           drumc++;
           eighth => now;
       }
       
       
   } 
}

//Alteration on main phrase;
c7 @=> p1[6];
oc7 @=> op1[6];
c8 @=> p1[7];
oc8 @=> op1[7];
//Reset drum counter
0 => drumc;
//Bring Down melody gain
0.3 => melody.gain;
//Execute Altered Main Phrase
for(0 => int i; i<p1.cap() ; i++)
{
   for(0 => int j; j<p1[i].cap(); j++)
   {
       // snare every pair hit
       if (drumc % 2 == 0) 0=> snare.pos;
       //open hihat and kick every odd hit  
       else
       {
           0 => kick.pos;
           0 => ohihat.pos;
       }
       //Note of the Melody
       Std.mtof(D_d[p1[i][j]] + 12*op1[i][j]) => lead.freq;
       //Harmony
       if(p1[i][j]<=4){
           Std.mtof(D_d[p1[i][j]+2]+12*op1[i][j]) => rythm.freq;
       }
       else{
           Std.mtof(D_d[p1[i][j]-5]+12*(op1[i][j]+1)) => rythm.freq;
       }
       //Same alteration as above
       if (i == 5 && (j == 6 || j == 7))
       {
           if (j == 7) drumc++;//Increase Drum Counter
           sixteenth => now;
       }
       else
       {
           // Increase Drum Counter
           drumc++;
           eighth => now;
       }
       
       
   } 
}


//Last Hit
0 => ohihat.pos;
0 => snare.pos;
0 => kick.pos;

//Fade Out
0.3 => gain;
for(0 => int i; i <100; i++)
{
    
    gain - 0.003 => gain;
    gain => melody.gain;
    sixteenth/2 => now;    
}




