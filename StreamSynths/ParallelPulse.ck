class ParallelPulse extends Stream {
    Stream @ st_freq;
    Stream @ st_n;
    Stream @ st_delta;
    Stream @ st_pan;
    
    fun ParallelPulse init( Stream freqArg, Stream nArg, Stream deltaArg,Stream panArg) {
        freqArg @=> this.st_freq;
        nArg @=> this.st_n;
        deltaArg @=> this.st_delta;
        panArg @=> this.st_pan;
        return this;
    }
    
    fun float pulse( float freq, float n, float p ) {
        SinOsc c => Pan2 pan => dac;
        c.gain(0.01);
        c.freq(freq);
        pan.pan(p);
        (second / freq) * n => now;
    }
    
    fun void play() {
        while(1) {
            spork ~ pulse ( st_freq.next(), st_n.next(), st_pan.next() );
            st_delta.next() * second => now;
        }
    }
}

class M extends st { 
    fun Stream mask () {
        return line( seq(-1,1) ,ch([3.,5,7]) );
    }
        
    
    ParallelPulse foo;
    foo.init( 
    rf(4.0,128),
    line(seq(1,20),ch(3,7)),
    div(1,line( seq (1,1000), st(10) )),
    rv( mask(), mask() ));
    spork ~ foo.play();
}

M m;
hour => now;
