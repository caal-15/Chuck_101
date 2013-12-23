/*Originally composed using E1 Aeolian as main scale and 145 tempo, 
modified to fit the assignment requirements (D Dorian, 240 tempo),
with all figures from the original replaced to the one that represents
double its duration (E.G: eigths replaced by quarter), except in the 
randomized intro*/
<<< "Assignment_2_Awesome_Solo" >>>;
//Sound Network
SinOsc a => Pan2 p1 => dac;
SqrOsc b => Pan2 p2 => dac;
// Variable Initialization
0.0 => a.gain;
0.0 => b.gain;
0 => int m;
0 => int h;
0 => int om;
0 => int oh;
0 => int panr;
0.0 => float bgain;
0.0 => float again;
2.0 => float f;
0.25::second => dur quarter;
quarter*2 => dur half;
quarter/2 => dur eighth;
quarter/4 => dur sixteenth;

//Array with the first, third and fifth degree of the scale
[50, 53, 57] @=> int RH[];
//Array containing the seven notes of the scale
[50, 52, 53, 55, 57, 59, 60] @=> int D_d[];

//Random melody and harmony generator using the first array
for (0.0 => float i; i <= 1.0; i+0.01 => i){
    Math.random2(0,2) => m;//random melody
    Math.random2(0,2) => h;//random harmony
    Math.random2(1,4) => om;//random octave for melody
    Math.random2(1,4) => oh;//random octave for harmony
    //random variable to decide where to pan each oscillator
    Math.random2(-1, 1) => panr;
    //random panning condition
    if(panr >= 0){
        -1.0 => p1.pan;
        1.0 => p2.pan;
    }
    else{
        1.0 => p1.pan;
        -1.0=> p2.pan;
    }
    Std.mtof(RH[m]+12*om)=> a.freq;
    //Fade in first oscillator
    i=>a.gain;
    Std.mtof(RH[h]+12*oh) => b.freq;
    //Fade in second oscillator
    bgain + 0.002=> bgain;
    bgain => b.gain;
    sixteenth => now;
}

//Vibratto
1.2 => f;
for( 0 => int i ; i<16 ; i++){
    Std.mtof(D_d[0]+12*2) +f => b.freq;
    Std.mtof(D_d[2]+12*2) + f => a.freq;
    -f => f; 
    eighth => now;
}
Std.mtof(D_d[0]+12*2) => b.freq;

//first figure 
[D_d[2]+12*2, D_d[3]+12*2, D_d[3]+12*2, D_d[4]+12*2, D_d[4]+12*2, D_d[6]+12*2] @=> int s1[];

for( 0 => int i ; i<6 ; i++){
    1.0 => a.gain;
    Std.mtof(s1[i]) => a.freq;
    bgain - 0.01 => bgain;
    bgain => b.gain;
    quarter => now;
    0.0 => a.gain;
    
}

//second figure
[D_d[6]+12*2, D_d[0]+12*3, D_d[1]+12*3, D_d[2]+12*3, D_d[3]+12*3] @=> int s2[];
1.0 => a.gain;

for( 0 => int i ; i<5 ; i++){
    Std.mtof(s2[i]) => a.freq;
    bgain - 0.01 => bgain;
    bgain => b.gain;
    half/5 => now;   
}

//third figure
[D_d[4]+12*3, D_d[3]+12*3, D_d[2]+12*3, D_d[1]+12*3, D_d[2]+12*3, D_d[3]+12*3 ] @=> int s3[];
for( 0 => int i ; i<6 ; i++){
    bgain - 0.01 => bgain;
    bgain => b.gain;
    Std.mtof(s3[i]) => a.freq;
    if(i == 2 || i==5){
        quarter => now;
    }
    else{
        quarter + eighth => now;
    }   
}

//fourth figure
[D_d[2]+12*3, D_d[1]+12*3, D_d[0]+12*3, D_d[6]+12*2, D_d[0]+12*3, D_d[1]+12*3 ] @=> int s4[];
for( 0 => int i ; i<6 ; i++){
    Std.mtof(s4[i]) => a.freq;
    if(i == 2 || i==5){
        quarter => now;
    }
    else{
        quarter + eighth => now;
    }   
}

//Enter harmony
0.2=>bgain;
bgain => b.gain;
Std.mtof(D_d[4]+12*2) => a.freq;
Std.mtof(D_d[6]+12*2) => b.freq;
half => now;
Std.mtof(D_d[5]+12*2) => a.freq;
Std.mtof(D_d[0]+12*3) => b.freq;
quarter => now;


//Vibratto
3.5 => f;
for( 0 => int i ; i<6 ; i++){
    Std.mtof(D_d[6]+12*2) + f => a.freq;
    Std.mtof(D_d[1]+12*3) + f => b.freq;
    -f => f;
    eighth => now;
}
Std.mtof(D_d[1]+12*3) => b.freq;

//Harmonized Fifth figure
//degrees of the scale of every successive note in the figure
[1, 0, 6, 4, 4, 1, 1, 2, 6, 1] @=> int n1[];
//octaves to which each successive note belongs to
[3, 3, 2, 2, 2, 2, 2, 2, 1, 2] @=> int on1[];
for( 0 => int i ; i<10 ; i++){
    1.0 => a.gain;
    0.2 => b.gain;
    //Play note of the melody
    Std.mtof(D_d[n1[i]]+12*on1[i]) => a.freq;
    //Harmonize with thirds up (kind of automatic)
    if (i==8){
        Std.mtof(D_d[n1[i]]+12*on1[i]+1) => a.freq; //alteration
    }
    if(i>1){
        if(n1[i]<=4){
            Std.mtof(D_d[n1[i]+2]+12*on1[i]) => b.freq;
        }
        else{
            Std.mtof(D_d[n1[i]-5]+12*(on1[i]+1)) => b.freq;
        }
    }
    quarter => now;
    0.0 => a.gain;
    0.0 => b.gain;
}
1.0 => a.gain;
0.2 => b.gain;

//Vibratto
1.2 =>  f;
for( 0 => int i ; i<16 ; i++){
    Std.mtof(D_d[1]+12*2) + f => a.freq;
    Std.mtof(D_d[3]+12*2) + f => b.freq;
    -f => f;
    eighth => now;
}

//Sixth figure Harmonized
[2, 3, 2, 1, 6, 1] @=> int n2[];
[2, 2, 2, 2, 1, 2] @=> int on2[];
for( 0 => int i ; i<6 ; i++){
    Std.mtof(D_d[n2[i]]+12*on2[i]) => a.freq;
    if(n2[i]<=4){
        Std.mtof(D_d[n2[i]+2]+12*on2[i]) => b.freq;
    }
    else{
        Std.mtof(D_d[n2[i]-5]+12*(on2[i]+1)) => b.freq;
    }
    if(i == 2 || i==5){
        quarter => now;
    }
    else{
        quarter + eighth => now;
    } 
}  

//Vibratto
1.2 =>  f;
for( 0 => int i ; i<16 ; i++){
    Std.mtof(D_d[1]+12*2) + f => a.freq;
    Std.mtof(D_d[3]+12*2) + f => b.freq;
    -f => f;
    eighth => now;
}

//Seventh figure Harmonized 
[2, 3, 2, 0, 6, 0] @=> int n3[];
[2, 2, 2, 2, 1, 2] @=> int on3[];
for( 0 => int i ; i<6 ; i++){
    Std.mtof(D_d[n3[i]]+12*on3[i]) => a.freq;
    if(n3[i]<=4){
        Std.mtof(D_d[n3[i]+2]+12*on3[i]) => b.freq;
    }
    else{
        Std.mtof(D_d[n3[i]-5]+12*(on3[i]+1)) => b.freq;
    }
    if(i == 2 || i==5){
        quarter => now;
    }
    else{
        quarter + eighth => now;
    } 
}  

//Vibratto 
1.2 =>  f;
for( 0 => int i ; i<12 ; i++){
    Std.mtof(D_d[0]+12*2) + f => a.freq;
    Std.mtof(D_d[2]+12*2) + f => b.freq;
    -f => f;
    eighth => now;
}

Std.mtof(D_d[2]+12*2) => b.freq;

//Eigth figure, no Harmony
[3, 4, 6, 0] @=> int n4[];
[1, 1, 1, 2] @=> int on4[];
for( 0 => int i ; i<4 ; i++){
    Std.mtof(D_d[n4[i]]+12*on4[i])=> a.freq;
    eighth => now;
}

//Vibratto
1.2 =>  f;
for( 0 => int i ; i<12 ; i++){
    Std.mtof(D_d[3]+12*2) + f => a.freq;
    Std.mtof(D_d[3]+12*2) + f => b.freq;
    -f => f;
    eighth => now;
}

Std.mtof(D_d[3]+12*2)=> b.freq;

//Ninth figure, b changes note on tenth end second iteration
[4, 4, 4, 6, 6, 6, 6, 0, 0, 0, 0, 1] @=> int n5[];
[2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3] @=> int on5[];
for( 0 => int i ; i<12 ; i++){
    1.0 => a.gain;
    Std.mtof(D_d[n5[i]]+12*on5[i])=> a.freq;
    if(i==2){
        Std.mtof(D_d[4]+12*2)=> b.freq;
    }
    if(i==10){
        Std.mtof(D_d[6]+12*2)=> b.freq;
    }
    quarter => now;
    0.0 => a.gain;
}

//Tenth figure, hamonized with thirds below the note
1.0 => a.gain;
[3, 4, 5, 4, 3, 2, 3] @=> int n6[];
[3, 3, 3, 3, 3, 3, 3] @=> int on6[];
for( 0 => int i ; i<7 ; i++){
    Std.mtof(D_d[n6[i]]+12*on6[i]) => a.freq;
    //Harmonize with thirds below (kind of automatic)
    if(n6[i]>=2){
        Std.mtof(D_d[n6[i]-2]+12*on6[i]) => b.freq;
    }
    else{
        Std.mtof(D_d[n6[i]+5]+12*(on6[i]-1)) => b.freq;
    }
    if(i == 0 || i==1 || i==4){
        quarter => now;
    }
    else{
        quarter + eighth => now;
    } 
} 

//Vibratto
1.2 =>  f;
for( 0 => int i ; i<6 ; i++){
    Std.mtof(D_d[4]+12*3) + f => a.freq;
    Std.mtof(D_d[2]+12*3) + f => b.freq;
    -f => f;
    eighth => now;
}


//Eleventh figure Harmonized
[0, 1, 2, 3, 4] @=> int n7[];
[3, 3, 3, 3, 3] @=> int on7[];
for( 0 => int i ; i<5 ; i++){
    Std.mtof(D_d[n7[i]]+12*on7[i]) => a.freq;
    if(n7[i]>=2){
        Std.mtof(D_d[n7[i]-2]+12*on7[i]) => b.freq;
    }
    else{
        Std.mtof(D_d[n7[i]+5]+12*(on7[i]-1)) => b.freq;
    }
    half/5 => now;
    
}

//Twelfth figure Harmonized
[4, 3, 2, 1, 6, 0] @=> int n8[];
[3, 3, 3, 3, 2, 3] @=> int on8[];
for( 0 => int i ; i<6 ; i++){
    if(i==4){
        Std.mtof(D_d[n8[i]]+12*on8[i]+1) => a.freq;
        Std.mtof(D_d[4]+12*2) => b.freq;
    }
    else{
        Std.mtof(D_d[n8[i]]+12*on8[i]) => a.freq;
        if(n8[i]>=2){
            Std.mtof(D_d[n8[i]-2]+12*on8[i]) => b.freq;
        }
        else{
            Std.mtof(D_d[n8[i]+5]+12*(on8[i]-1)) => b.freq;
        }
        
    }
    
    if(i == 2 || i==5 ){
        quarter => now;
    }
    else{
        quarter + eighth => now;
    } 
} 

//Vibratto 
1.2 =>  f;
1.0 => again;
for( 0 => int i ; i<32 ; i++){
    Std.mtof(D_d[0]+12*3) + f => a.freq;
    Std.mtof(D_d[5]+12*2) + f => b.freq;
    again - 0.03125 => again;
    bgain - 0.00625 => bgain;
    again => a.gain;
    bgain => b.gain;
    -f => f;
    eighth => now;
}
