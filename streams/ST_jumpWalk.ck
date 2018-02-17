public class ST_jumpWalk extends ST_walk {
    Stream st_start;

    fun ST_jumpWalk init(Stream startArg,Stream stepArg) {
        startArg @=> st_start;
        stepArg @=> st_step;
        return this;
    }
    
    fun float next() {
        if (!st_step.more()) {
            st_start.next() => _value;
            return _value;
        } 
        _value + st_step.next() => _value;
        return _value;
    }
}

        
        
        