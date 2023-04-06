public class ST_timedLatch extends Stream {
    "ST_timedLatch" @=> _type;
    
    float _time;
    
    null @=> Stream @ st_value;
    null @=> Stream @ st_time;
    
    float _value;
    
    int firstTime;
    time nextTime;
    
    fun ST_timedLatch init(Stream valueArg,Stream timeArg) {
        value(valueArg);
        times(timeArg);
        true => firstTime;
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
        if (firstTime) { // first time it is run, so schedule a time.
            now + nextT() => nextTime; 
            false => firstTime;
            return true;
        }
        if (nextTime > now) { // not yet, return true
            return true;
        } else { // create a new next that is in the future.
            true => firstTime;
        }            
        return false;

    }
    
    fun float next() {
        return st_value.next();
    }
}
        
    