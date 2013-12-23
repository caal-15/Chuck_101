// score.ck

// paths to chuck file
me.dir() + "/piano.ck" => string pianoPath;
me.dir() + "/bass.ck" => string bassPath;
me.dir() + "/drums.ck" => string drumsPath;
me.dir() + "/flute.ck" => string flutePath;

// start piano
Machine.add(pianoPath) => int pianoID; 
4.8::second => now;

// start drums
Machine.add(drumsPath) => int drumsID;
4.8::second => now;

// start bass
Machine.add(bassPath) => int bassID;
4.8::second => now;

// start flute solo
Machine.add(flutePath) => int fluteID;
4.8::second => now;

// remove drums
Machine.remove(drumsID);
4.8::second => now;

// add drums back in 
Machine.add(drumsPath) => drumsID;

