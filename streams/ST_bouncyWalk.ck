public class ST_bouncyWalk extends ST_boundedWalk {
    "ST_bouncyWalk" @=> _type;
    
    1 => int direction;
    
    fun void wrap() {
        if (st_min != null) st_min.next() => _min;
        if (st_max != null) st_max.next() => _max;
        
        if (_min > _max) {
            _max => float tmp;
            _min => _max;
            tmp => _min;
        }
        
        if (_value < _min) {
            1 => direction;
            _min => _value;
            return;
        }
        
        if (_value > _max) {
            -1 => direction;
            _max => _value;
            return;
        }
    }
    
    fun float next() {
        if (st_step != null) {
            st_step.next() => _step;
        }
        (_step*direction) + _value => _value;
        wrap();
        return _value;
    }
}