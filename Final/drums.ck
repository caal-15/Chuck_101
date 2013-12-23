//Drums
General g;
BPM t;


Drummer d;

SndBuf drumkit[4];

me.dir(-1) + "/audio/kick_04.wav" => drumkit[0].read;
me.dir(-1) + "/audio/snare_02.wav" => drumkit[1].read;
me.dir(-1) + "/audio/hihat_01.wav" => drumkit[2].read;
me.dir(-1) + "/audio/hihat_04.wav" => drumkit[3].read;

d.initialize(drumkit, 0.45, [0.25, 0.8, 0.2, 0.4], [0.0, 0.2, -0.2, -0.2]);

[1, 0, 0, 0, 0, 0, 1, 1] @=> int k1[];
[0, 0, 0, 0, 0, 0, 0, 0] @=> int s1[];
[0, 0, 0, 0, 0, 0, 1, 1] @=> int ch1[];
[1, 0, 0, 0, 0, 0, 0, 0] @=> int oh1[];

repeat(3) d.play([k1, s1, ch1, oh1], t.quarter);

d.play([[1], [0], [0], [1]], t.whole);

d.play([[1], [0], [0], [1]], t.half);

[0, 0, 0, 0, 0, 0, 0, 0] @=> int k2[];
[1, 0, 1, 1, 1, 1, 1, 1] @=> int s2[];
[0, 0, 0, 0, 0, 0, 0, 0] @=> int ch2[];
[0, 0, 0, 0, 0, 0, 0, 0] @=> int oh2[];

d.play([k2, s2, ch2, oh2], t.sixteenth);

[1, 0, 0, 0, 0, 0, 1, 0] @=> int k3[];
[0, 0, 0, 0, 1, 0, 0, 0] @=> int s3[];
[0, 0, 1, 1, 0, 0, 1, 1] @=> int ch3[];
[1, 0, 0, 0, 0, 0, 0, 0] @=> int oh3[];

repeat(38) d.play([k3, s3, ch3, oh3], t.sixteenth);
