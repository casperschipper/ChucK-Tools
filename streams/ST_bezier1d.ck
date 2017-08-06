class ST_bezier1d extends Stream {
    Stream st_input;
    Stream st_a;
    Stream st_b;
    Stream st_c;
    Stream st_d;
    
    fun ST_bezier1d init (Stream inputArg, Stream aArg, Stream bArg, Stream cArg, Stream dArg) {
        inputArg @=> st_input;
        aArg @=> st_a;
        bArg @=> st_b;
        cArg @=> st_c;
        dArg @=> st_d;
        return this;
    }
    
    fun float cube(float x) {
        return x * x * x;
    }
    
    fun float sqr(float x) {
        return x * x;
    }
    
    fun float next() {
        st_input.next() => float x;
        1 - x => float invx;
        st_a.next() => float a;
        st_b.next() => float b;
        st_c.next() => float c;
        st_d.next() => float d;
        // A*(1-x)^3 + 3*B*(1-x)^2*x + 3*C*(1-x)*x^2 + D*x^3
        return (a * cube(invx)) + ( 3 * x * b * sqr(invx) ) + (3 * c * invx * sqr(x)) + (d * cube(x));
    }
}

class Main extends st {
    
    fun Stream foo() {
        return line( seq(-1,1),rv(0,.5) );
    }
    
    fun Stream bar() {
        return line( seq(-0.01,0.01), rv( 0, 13 ) );
    }
    
    foo() @=> Stream 

    (new ST_bezier1d).init( phasor(1), 
    foo(),
    foo(),
    foo(),
    foo()
    ) @=> Stream amp;
    
    StepSynth synth => SinOsc c => Safe s => dac;
    c.sync(2);
    
    synth.gain(10000);
    
    s.gain(0.1);
    
    synth.init(
    amp,
    st(1.0)
    );
}

Main main;

hour => now;