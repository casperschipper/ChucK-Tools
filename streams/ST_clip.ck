public class ST_clip extends Stream {
    Stream @ st_input;
    -1 => float _min;
    1 => float _max;
    
    null @=> Stream @ st_min;
    null @=> Stream @ st_max;
    
    fun ST_clip input(Stream arg) {
        arg @=> st_input;
        return this;
    }
    
    fun ST_clip min(float arg) {
        arg @=> _min;
        null @=> st_min;
        return this;
    }
    
    fun ST_clip max(float arg) {
        arg @=> _max;
        null @=> st_max;
        return this;
    }
    
    fun ST_clip min(Stream arg) {
        arg @=> st_min;
        return this;
    }
    
    fun ST_clip max(Stream arg) {
        arg @=> st_max;
        return this;
    }
   
    fun int more() {
        return st_input.more();
    }
    
    fun float next() {
        if (st_min != null) st_min.next() => _min;
        if (st_max != null) st_max.next() => _max;
        return cs.clipf(st_input.next(),_min,_max);
    }
}