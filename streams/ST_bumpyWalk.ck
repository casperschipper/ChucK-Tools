public class ST_bumpyWalk extends ST_boundedWalk {
    fun void wrap() {
        if (st_min != null) st_min.next() => _min;
        if (st_max != null) st_max.next() => _max;
        
        if (_min > _max) {
            _max => float tmp;
            _min => _max;
            tmp => _min;
        }
        
        if (_value < _min) {
            _min => _value;
            return;
        }
        
        if (_value > _max) {
            _max => _value;
            return;
        }
    }
}