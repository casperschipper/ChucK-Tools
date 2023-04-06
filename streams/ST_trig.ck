public class ST_trig extends Stream {
    Stream @ st_input;
    Stream @ st_trigger;
    
    int state; // 0 is waiting for trigger, 1 is going until no more
    float value;
    
    fun ST_trig init(Stream input, Stream trig) {
        input @=> this.st_input;
        trig @=> this.st_trigger;
        return this;
    }
    
    fun int more() {
        return state;
    }
    
    fun float next() { 
        if (state == 0) {
            if (st_trigger.next() == 0) {
                return value;
            }
        }
        // state is not 0
        st_input.next() => value;
        st_input.more() => state; // if more, continue next time
        return value;
    }
}
/*

class M extends st {
    ST_trig tst;
    tst.init( seq(cs.fillf(32,-1,1),true) , seq( latch(st(0),st(1000)).st(),st(1) ) );
    
    StepSynth synth => Safe safe => dac;
    synth.init( tst, st(1));
}

M m;
hour => now;
*/


        