/*Newbase Intro Fraction
--Notes: First Song of my project Newbase translated from
common music writing methods to ChucK, only the guitar will
be translated in this particular code (120 main tempo)
--Date: 10/22/2013
--Author: Empty due to submission rules*/

<<< "Assignment_1_Newbase_intro" >>>;

//Sound Network

SinOsc guitar => dac;


1 => guitar.gain;


/*Frequencies of the notes belonging to B Aeolian, 
starting on the lowest note used (B1)*/
61.74 => float B;
69.30 => float Cs;
73.42 => float D;
82.41 => float E;
92.50 => float Fs;
98.00 => float G;
110.00 => float A;
//Extra float
0.0 => float Lfreq;

//--Phrase 1--
for(0 => int i; i < 2; i++)
{
    1 => guitar.gain;
    /*Assignment of the frequency of the note selected
    to oscillator's frequency, this event won't be
    commented from now on*/
    B => guitar.freq;
    0.25::second => now;
    Fs => guitar.freq;
    0.25::second => now;
    /*By multiplying the original note by two we get
    the octave above the original note, this event
    won't be commented from now on*/    
    B*2 => guitar.freq;
    0.25::second => now;
    0 => guitar.gain; //"Plucking"
}

1 => guitar.gain;
B => guitar.freq;
0.25::second => now;

//Slide
B*2 =>  Lfreq; 
for(0 => int i; i < 200; i++)
{
    Lfreq + 0.1168 => Lfreq;
    Lfreq => guitar.freq;
    0.0005::second => now;
}

D*2 => guitar.freq;  
0.4::second => now;
Cs*2=> guitar.freq;
0.5::second => now;

//Vibratto 
1.5 => Lfreq;
for(0 => int i; i < 12; i++)
{
    A + Lfreq => guitar.freq;
    -Lfreq => Lfreq;
    0.1::second => now;
}
0.05::second => now;

//--Phrase 2--
for(0 => int i; i < 2; i++)
{
    1 => guitar.gain;
    B => guitar.freq;
    0.25::second => now;
    Fs => guitar.freq;
    0.25::second => now;
    B*2 => guitar.freq;
    0.25::second => now;
    0 => guitar.gain; //"Plucking"
}

1 => guitar.gain;
B => guitar.freq;
0.25::second => now;

//Slide
B*2 =>  Lfreq; 
for(0 => int i; i < 200; i++)
{
    Lfreq + 0.1168 => Lfreq;
    Lfreq => guitar.freq;
    0.0005::second => now;
}

D*2 => guitar.freq;  
0.4::second => now;
Cs*2=> guitar.freq;
0.5::second => now;
E*2 => guitar.freq;
0.5::second => now;
Cs*2=> guitar.freq;
0.125::second => now;
D*2 => guitar.freq;  
0.125::second => now;
Cs*2=> guitar.freq;
0.25::second => now;
A => guitar.freq;
0.25::second => now;

//--Phrase 3--
for(0 => int i; i < 2; i++)
{
    1 => guitar.gain;
    B => guitar.freq;
    0.25::second => now;
    Fs => guitar.freq;
    0.25::second => now;
    B*2 => guitar.freq;
    0.25::second => now;
    0 => guitar.gain; //"Plucking"
}

1 => guitar.gain;
B => guitar.freq;
0.25::second => now;

//Slide
B*2 =>  Lfreq; 
for(0 => int i; i < 200; i++)
{
    Lfreq + 0.1168 => Lfreq;
    Lfreq => guitar.freq;
    0.0005::second => now;
}

D*2 => guitar.freq;  
0.4::second => now;
Cs*2=> guitar.freq;
0.5::second => now;

//Vibratto 
1.5 => Lfreq;
for(0 => int i; i < 5; i++)
{
    A + Lfreq => guitar.freq;
    -Lfreq => Lfreq;
    0.1::second => now;
}

D => guitar.freq;  
0.25::second => now;
G => guitar.freq;
0.25::second => now;
Cs*2 => guitar.freq;
0.25::second => now;

//--Phrase 4--
for(0 => int i; i < 2; i++)
{
    1 => guitar.gain;
    B => guitar.freq;
    0.25::second => now;
    Fs => guitar.freq;
    0.25::second => now;
    B*2 => guitar.freq;
    0.25::second => now;
    0 => guitar.gain; //"Plucking"
}

1 => guitar.gain;
B => guitar.freq;
0.25::second => now;

//Slide
B*2 =>  Lfreq; 
for(0 => int i; i < 200; i++)
{
    Lfreq + 0.1168 => Lfreq;
    Lfreq => guitar.freq;
    0.0005::second => now;
}

D*2 => guitar.freq;  
0.4::second => now;
Cs*2=> guitar.freq;
0.5::second => now;
E*2=> guitar.freq;
0.25::second => now;
D*2=> guitar.freq;
0.25::second => now;
Cs*2=> guitar.freq;
0.25::second => now;

//Legatto-Slide
A =>  Lfreq; 
A => guitar.freq;
0.2::second => now;
for(0 => int i; i < 200; i++)
{
    Lfreq + 0.06735 => Lfreq;
    Lfreq => guitar.freq;
    0.0005::second => now;
}
B*2 => guitar.freq;
0.2::second => now;
    
for(0 => int j; j < 2; j++)
{
    //--Phrase 1--
    for(0 => int i; i < 2; i++)
    {
        1 => guitar.gain;
        B => guitar.freq;
        0.25::second => now;
        Fs => guitar.freq;
        0.25::second => now;
        B*2 => guitar.freq;
        0.25::second => now;
        0 => guitar.gain; //"Plucking"
    }

    1 => guitar.gain;
    B => guitar.freq;
    0.25::second => now;

    //Slide
    B*2 =>  Lfreq; 
    for(0 => int i; i < 200; i++)
    {
        Lfreq + 0.1168 => Lfreq;
        Lfreq => guitar.freq;
        0.0005::second => now;
    }

    D*2 => guitar.freq;  
    0.4::second => now;
    Cs*2=> guitar.freq;
    0.5::second => now;

    //Vibratto 
    1.5 => Lfreq;
    for(0 => int i; i < 12; i++)
    {
        A + Lfreq => guitar.freq;
        -Lfreq => Lfreq;
        0.1::second => now;
    }
    0.05::second => now;

    //--Phrase 2B--
    for(0 => int i; i < 2; i++)
    {
        1 => guitar.gain;
        B => guitar.freq;
        0.25::second => now;
        Fs => guitar.freq;
        0.25::second => now;
        B*2 => guitar.freq;
        0.25::second => now;
        0 => guitar.gain; //"Plucking"
    }

    1 => guitar.gain;
    B => guitar.freq;
    0.25::second => now;

    //Slide
    B*2 =>  Lfreq; 
    for(0 => int i; i < 200; i++)
    {
        Lfreq + 0.1168 => Lfreq;
        Lfreq => guitar.freq;
        0.0005::second => now;
    }

    D*2 => guitar.freq;  
    0.4::second => now;
    Cs*2=> guitar.freq;
    0.5::second => now;
    E*2 => guitar.freq;
    0.5::second => now;
    Cs*2=> guitar.freq;
    0.125::second => now;
    D*2 => guitar.freq;  
    0.125::second => now;
    Cs*2=> guitar.freq;
    0.25::second => now;
    A => guitar.freq;
    0.25::second => now;
    E => guitar.freq;
    0.25::second => now;
    A => guitar.freq;
    0.25::second => now;
    E*2 => guitar.freq;
    0.5::second => now;

    //--Phrase 3--
    for(0 => int i; i < 2; i++)
    {
        1 => guitar.gain;
        B => guitar.freq;
        0.25::second => now;
        Fs => guitar.freq;
        0.25::second => now;
        B*2 => guitar.freq;
        0.25::second => now;
        0 => guitar.gain; //"Plucking"
    }

    1 => guitar.gain;
    B => guitar.freq;
    0.25::second => now;

    //Slide
    B*2 =>  Lfreq; 
    for(0 => int i; i < 200; i++)
    {
        Lfreq + 0.1168 => Lfreq;
        Lfreq => guitar.freq;
        0.0005::second => now;
    }

    D*2 => guitar.freq;  
    0.4::second => now;
    Cs*2=> guitar.freq;
    0.5::second => now;

    //Vibratto 
    1.5 => Lfreq;
    for(0 => int i; i < 5; i++)
    {
        A + Lfreq => guitar.freq;
        -Lfreq => Lfreq;
        0.1::second => now;
    }

    D => guitar.freq;  
    0.25::second => now;
    G => guitar.freq;
    0.25::second => now;
    Cs*2 => guitar.freq;
    0.25::second => now;

    //--Phrase 4--
    for(0 => int i; i < 2; i++)
    {
        1 => guitar.gain;
        B => guitar.freq;
        0.25::second => now;
        Fs => guitar.freq;
        0.25::second => now;
        B*2 => guitar.freq;
        0.25::second => now;
        0 => guitar.gain; //"Plucking"
    }

    1 => guitar.gain;
    B => guitar.freq;
    0.25::second => now;

    //Slide
    B*2 =>  Lfreq; 
    for(0 => int i; i < 200; i++)
    {
        Lfreq + 0.1168 => Lfreq;
        Lfreq => guitar.freq;
        0.0005::second => now;
    }

    D*2 => guitar.freq;  
    0.4::second => now;
    Cs*2=> guitar.freq;
    0.5::second => now;
    E*2=> guitar.freq;
    0.25::second => now;
    D*2=> guitar.freq;
    0.25::second => now;
    Cs*2=> guitar.freq;
    0.25::second => now;

    //Legatto-Slide
    A =>  Lfreq; 
    A => guitar.freq;
    0.2::second => now;
    for(0 => int i; i < 200; i++)
    {
        Lfreq + 0.06735 => Lfreq;
        Lfreq => guitar.freq;
        0.0005::second => now;
    }
    B*2 => guitar.freq;
    0.2::second => now;
    
    
    //--Phrase 5 (Finisher)--
    E => guitar.freq;
    0.25::second => now;
    A => guitar.freq;
    0.25::second => now;
    E*2 => guitar.freq;
    0.25::second => now;
    E => guitar.freq;
    0.25::second => now;
    D => guitar.freq;
    0.25::second => now;
    G => guitar.freq;
    0.25::second => now;
    D*2 => guitar.freq;
    0.25::second => now;
    D => guitar.freq;
    0.25::second => now;
    G => guitar.freq;
    0.25::second => now;
    Cs*2 => guitar.freq;
    0.25::second => now;
    G => guitar.freq;
    0.25::second => now;
    if(j == 0)
    {
        D => guitar.freq;
        0.25::second => now;
        Fs => guitar.freq;
        0.25::second => now;
        Cs*2 => guitar.freq;
        0.25::second => now;
        D => guitar.freq;
        0.25::second => now;
        Cs => guitar.freq;
        0.25::second => now;
        Fs => guitar.freq;
        0.25::second => now;
        Cs*2 => guitar.freq;
        0.5::second => now;
    }
}

//--Phrase 5 (Last 2 figures, 80 tempo)--
D => guitar.freq;
0.375::second => now;
Fs => guitar.freq;
0.375::second => now;
Cs*2 => guitar.freq;
0.375::second => now;
D => guitar.freq;
0.375::second => now;
Cs => guitar.freq;
0.375::second => now;
Fs => guitar.freq;
0.375::second => now;
Cs*2 => guitar.freq;
0.75::second => now;

1.0 => float ag;

//Fadeout
for(0 => int i; i<100; i++)
{
    ag => guitar.gain;
    ag - 0.01 => ag;
    0.05::second => now;
}

/*Here would go a heavy drum intro with heavily
distorted guitars... but i'm too sleepy so i will
leave this like it is now*/