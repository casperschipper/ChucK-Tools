public class ST_sine extends Stream {    
    2.0 * pi => float twopi;
    
    float freq;
    
    fun ST_sine init (float arg) {
        arg => freq;
        return this;
    }
    
    fun float next() {
        now / second => float phase;
        return Math.sin(phase * freq * twopi);
    }
}

    