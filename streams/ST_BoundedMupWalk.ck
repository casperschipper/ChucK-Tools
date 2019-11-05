public class ST_boundedMupWalk extends ST_mupWalk {
    "ST_boundedMupWalk" @=> _type;
    
    20 => float _min;
    20000 => float _max;
    
    null @=> Stream @ st_min;
    null @=> Stream @ st_max;
    
    fun void wrap() {
        if (st_min != null) st_min.next() => _min;
        if (st_max != null) st_max.next() => _max;
        if (_value == 0) {
            _min => _value;
        }
        while (_value < Math.min(_min,_max)) {
            _value * 2 => _value;
        }
        while (_value > Math.max(_min,_max)) {
            _value * 0.5 => _value;
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