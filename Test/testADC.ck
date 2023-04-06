SinOsc c => dac;

0.1 => c.gain;


while(1) {
    cs.rf(40,80) => c.freq;
    .1*second => now;
}
    