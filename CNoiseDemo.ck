CNoise noise => dac;
0.1 => noise.gain;

1::second => dur T;

"white" => noise.mode;
T => now;
noise.mode("pink");
T => now;
noise.mode("flip");
T => now;
noise.mode("brown"); // doesn't work ?
