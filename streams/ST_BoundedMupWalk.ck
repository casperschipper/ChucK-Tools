public class ST_boundedMupWalk extends ST_mupWalk {
    "ST_boundedMupWalk" @=> _type;
    
    20 => float _min;
    20000 => float _max;
    
    null @=> Stream @ st_min;
    null @=> Stream @ st_max;
    
    fun void wrap() {
        if (st_min != null) st_min.next() => _min;
        if (st_max != null) st_max.next() => _max;
        if (value == 0) {
            _min => value;
        }
        if (value < Math.min(_min,_max)) {
            value * 2 => value;
        }
        if (value > Math.max(_min,_max)) {
            value * 0.5 => value;
        }
    }
    
    fun ST_boundedMupWalk min(Stream arg) {
        arg @=> st_min;
        return this;
    }
    
    fun ST_boundedMupWalk max(Stream arg) {
        arg @=> st_max;
        return this;
    }
    
    fun ST_boundedMupWalk min(float arg) {
        arg => _min;
        null @=> st_min;
        return this;
    }
    
    fun ST_boundedMupWalk max(float arg) {
        arg => _max;
        null @=> st_min;
        return this;
    }
}