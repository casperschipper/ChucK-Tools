public class ST_compose extends Stream {
    Stream @ st_input;
    Stream @ st_segment;
    
    float current;
    float target;
    float mup;
    
    fun ST_compose init(Stream inArg,Stream segArg) {
        ST_compose stream;
        stream.input(inArg);
        stream.segment(segArg);
        return stream;
    }
    
    fun void input(Stream arg) {
        arg @=> this.st_input;
    }
    
    fun void segment(Stream arg) {
        arg @=> this.st_segment;
    }
    
    fun float next() {
        if (!st_segment.more()) {
            target => current;
            st_input.next() => target;
            st_segment.reset();
            target - current => mup;
            if (mup > 1) { 
                1 => mup; 
            }
        }
        return ( st_segment.next() * mup) + current;
    }
}

/*
class M extends st {
    (new ST_compose).init( seq(OSC.table2) , latch( seq(OSC.table1), line(seq(100,128),ch(3,37))) ) @=> Stream compose;
    
    StepSynth synth => dac;
    
    synth.init( compose, st(1) );
    hour => now;
}

M m;

*/
    
        
        
    