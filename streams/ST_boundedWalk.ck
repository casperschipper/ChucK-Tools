public class ST_boundedWalk extends ST_walk {
    "ST_boundedWalk" @=> _type;
    
    20 => float _min;
    20000 => float _max;
    
    null @=> Stream @ st_min;
    null @=> Stream @ st_max;
    
    fun void wrap() {
        if (st_min != null) st_min.next() => _min;
        if (st_max != null) st_max.next() => _max;
        
        if (value < _min) {
            _max => value;
        }
        
        if (value > _max) {
            _min => value;
        }
    }
            
    
    fun ST_boundedWalk min(float arg) {
        arg => _min; return this;
    }
    fun ST_boundedWalk max(float arg) {
        arg => _max; return this;
    }
    fun ST_boundedWalk min(Stream arg) {
        arg @=> st_min; return this;
    }
    fun ST_boundedWalk max(Stream arg) {
        arg @=> st_max; return this;
    }
}