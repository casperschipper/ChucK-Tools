public class ST_boundedWalk extends ST_walk {
    "ST_boundedWalk" @=> _type;
    
    20.0 => float _min;
    20000.0 => float _max;
    
    null @=> Stream @ st_min;
    null @=> Stream @ st_max;
    
    fun void wrap() {
        if (st_min != null) st_min.next() => _min;
        if (st_max != null) st_max.next() => _max;
        
        if (_min > _max) {
            _max => float tmp;
            _min => _max;
            tmp => _min;
        }
        
        if (_value < _min) {
            _max => _value;
            return;
        }
        
        if (_value > _max) {
            _min => _value;
            return;
        }
    }
    
    fun ST_boundedWalk min(int arg) {
        <<<arg $ float>>> => _min;
        null @=> st_min;
        return this;
    }
    fun ST_boundedWalk max(int arg) {
        <<<arg $ float>>> => _max;
        null @=> st_max;
        return this;
    }
    
    fun ST_boundedWalk min(float arg) {
        arg => _min; 
        null @=> st_min;
        return this;
    }
    fun ST_boundedWalk max(float arg) {
        arg => _max;
        null @=> st_max;
        return this;
    }
    fun ST_boundedWalk min(Stream arg) {
        arg @=> st_min; 
        return this;
    }
    fun ST_boundedWalk max(Stream arg) {
        arg @=> st_max; 
        return this;
    }
}