public class ST_rampGen extends Stream {
    Stream st_input;
    Stream st_number;
    
    float last;
    int count;
    0 => int target;
    
    fun void init(Stream input,Stream number) {
        input @=> this.st_input;
        number @=> this.st_number;
    }
    
    fun int more() {
        return target != 0;
    }
    
    fun float next() {
        // trigger testing             
        last => float tmp;
        st_input.next() => last;
        if (target == 0) {
            if (Math.fabs(tmp-last) > 0.5) { // if difference is more than half, trigger new target
                Math.floor(st_number.next()) $ int => target;
            }
        }  
        
        0. => float out;
        // if running:
        if (target) {
            // we want to include zero.
            count => out; 
            if (count >= target) { // reset if target is reached
                0 => count => target;
            }
            count + (target != 0) => count; // count if target 
        } 
        
        return out $ float;
    }
}

/*
test
class M extends st {        
    
    ST_rampGen ramp;
    ramp.init( seq ( latch( st(1), st(1)) 
                   , latch( st(0), st(10))
                   ) 
             , st(14) 
             );
    ramp.test();
}

M m;
*/
