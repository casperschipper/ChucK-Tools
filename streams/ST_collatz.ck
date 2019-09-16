public class ST_collatz extends Stream {
    Stream @ st_input;
    
    0 => int value;
    
    fun ST_collatz init(Stream arg) {
        arg @=> st_input;
        return this;
    }
    
    fun float next() {
        if (value <= 1) {
            st_input.nextInt() => value;
        }
        if ((value % 2) == 0) {
            value / 2 => value;
        } else {
            (value * 3) + 1=> value;
        }
        return value $ float; 
    }
}

/*
(ST_collatz foo).init(st.rv(0,2000));
Pan2 p => dac;

p.pan(cs.rvf(-1,1));
0.01 => p.gain;
cs.choose([10000,5000,3000,200,100])*ms => dur a;

fun void note() {
    SinOsc osc => Envelope env => p;   
    foo.next() * 20 => osc.freq;
    env.target(1);
    a * 0.1 => env.duration =>  now;
    env.target(0);
    a * 0.9 => env.duration => now;
}

while(1) {
    spork~ note();
    second / 20 => now;
}
*/