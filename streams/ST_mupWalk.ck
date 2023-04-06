public class ST_mupWalk extends ST_walk {  
    fun float next() {
        if (st_step != null) {
            st_step.next() => _step;
        }
        _step * _value => _value;
        wrap();
        return _value;
    }
}
