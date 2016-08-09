public class ST_sine extends Stream {    
    2.0 * pi => float twopi;
    
    float freq;
    null @=> Stream st_freq;
    
    fun ST_sine init (float arg) {
        arg => freq;
        null @=> st_freq;
        return this;
    }
    
    fun ST_sine init(Stream arg) {
        arg @=> st_freq;
        return this;
    }
    
    fun float next() {
        now / second => float phase;
        if (st_freq != null) {
            st_freq.next() => freq;
        }
        return Math.sin(phase * freq * twopi);
    }
}

    