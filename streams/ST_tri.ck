public class ST_tri extends Stream {
    time then;
    
    dur wl;
    
    now => then;
    
    fun float next() {
        ((now - then) % wl) / wl => float phase;
        return Math.fabs( (phase * 2) - 1 ); 
    }
    
    fun float freq(float freq) {
        second / freq => wl;
        return freq;
    }
    
    fun float freq() {
        return second / wl;
    }
}
        
        
        