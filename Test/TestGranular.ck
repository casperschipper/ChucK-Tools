class Vosim {
    st.st(1.0) @=> Stream timer;
    st.st(440) @=> Stream freq;
    st.st(1.0) @=> Stream dura;
    st.st(0.0) @=> Stream stpan;
    

    fun void ping() {
        SqrOsc c => Envelope env => Pan2 p => dac;
        freq.next() => float frq;
        c.width(0.5);
        env.gain(timer.next());
        c.phase(0);
        frq => c.freq;
        env.value(1);
        env.target(0);
        p.pan(stpan.next());
        dura.next() * second => env.duration => now;
        null @=> p;
        null @=> c;
        null @=> env;
    }
    
    fun void run() {
        while(1) {
            timer.next() * second => now;
            spork ~ ping();
        }
    }
}

class M extends st {
    Vosim x;
    seq([
    t( div(1.0,rf(-80,30)), ch([1.,4,0.01])) $ Stream,
    t( div(1.0,rf(-80,30)), ch([1.,4,0.01])),
    t( div(1.0,rf(-80,30)), ch([1.,4,0.01])),
    t( div(1.0,rf(-80,30)), ch([1.,4,0.01])) ]) @=> x.timer;
    t( ch([0.1,0.2,0.5,2.0]), ch([0.1,0.4,1.0,5.0]) ) @=> x.dura;
    t( rf(10,128), fractRandTimer(ch([0.01,0.2,0.4,1.0,0.001])) ) @=> x.freq;
    t( seq(-1,1), fractRandTimer(ch([0.01,0.2,0.4,1.0,2.0,5.0])) ) @=> x.stpan;
    x.run();
}

M m;


hour => now;


        
    