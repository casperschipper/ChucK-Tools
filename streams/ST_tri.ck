public class ST_tri extends Stream {
    "ST_tri" @=> _type;
    
    float _freq;
    float _range;
    float _offset;
    
    null @=> Stream @ st_min;
    null @=> Stream @ st_max;
        
    fun float next() {
        if (st_min != null && st_max != null) { 
            range(st_min.next(),st_max.next());
        }
        ((now / second) * _freq) % 1.0 => float phase;
        return Math.fabs((phase * 2) - 1.0) * _range + _offset;
    }
    
    fun ST_tri range(float low,float high) {
        Math.fabs(high - low) => _range;
        Math.min(low,high) => _offset;
    }
        
    
    fun ST_tri init(float arg) {
        range(-1.0,1.0);
        freq(arg);
        return this;
    }
    
    fun ST_tri init(float arg,float min,float max) {
        range(min,max);
        freq(arg);
        return this;
    }
    
    fun ST_tri freq(float arg) {
        arg => _freq;
        return this;
    }
}
        
        
(new ST_tri).init(0.5).test();

hour => now;