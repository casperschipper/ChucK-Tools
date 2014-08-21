unit => Envelope a => blackhole;
unit => Envelope b => blackhole;

fun void ctrlab() {
    while (1) {
        cs.rvf(0,1) => a.target => b.target;
        cs.choosed([.5,1,2,4,5]) => e.duration => now;
        0 => a.target 1 => b.target;
        cs.choosed([.5,1,2,4,5]) => e.duration => now;
    }
}