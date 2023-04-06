public class ST_sine extends Stream {    
    2.0 * pi => float twopi;

    float phase;
    dur wl;
    
    null @=> Stream st_freq;
    time then;
        
    fun ST_sine init (float arg) {
        now => then;
        second /arg => wl;
        null @=> st_freq;
        return this;
    }
    
    fun ST_sine init(Stream arg) {
        now => then;
        arg @=> st_freq;
        second / st_freq.next() => wl;
        return this;
    }
    
    fun float next() {
        now - then => dur diff;
        now => then;
        if (st_freq != null) {
            second /st_freq.next() => wl;
        }
        (phase + (diff/wl)) => phase;
        while (phase < 0) {
            1.0 +=> phase;
        }
        while (phase > 1.0) {
            1.0 -=> phase;
        }
        
        return Math.sin(phase * twopi);
    }
}

    