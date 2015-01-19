public class ST_timedLatch extends Stream {
    "ST_timedLatch" @=> _type;
    
    float _time;
    
    null @=> Stream @ st_value;
    null @=> Stream @ st_time;
    
    float _value;
    
    true => int isFirstRun;
    time nextTime;
    
    fun ST_timedLatch init(Stream valueArg,Stream timeArg) {
        value(valueArg);
        times(timeArg);
        return this;
    }
    
    fun ST_timedLatch value(Stream valueArg) {
        valueArg @=> st_value;
        return this;
    }
    
    fun ST_timedLatch times(Stream timeArg) {
        timeArg @=> st_time;
        return this;
    }
    
    fun dur nextT() {
        if (st_time != null) st_time.next() => _time;
        return _time * second;
    }
    
    fun int more() {
        if (nextTime > now) {
            return true;
        } else { // create a new next that is in the future.
            do {
                nextTime + nextT() => nextTime;
            } while ( nextTime < now );
        }
        return false;
    }
    
    fun float next() {
        return st_value.next();
    }
}
        
    