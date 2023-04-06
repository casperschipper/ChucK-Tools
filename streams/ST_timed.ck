public class ST_timed extends Stream {
    //
    "Stream_timed" @=> _type;
    
    float _time;
    
    null @=> Stream @ _stvalue;
    null @=> Stream @ _sttime;
    
    float _value;
    
    true => int isFirstRun;    
    time nextTime;
    
    false => int _holdMode;
    true => int _more;
    
    fun static ST_timed make(Stream values,Stream times) {
        ST_timed stream;
        stream.values(values);
        stream.times(times);
        return stream;
    }
    
    fun ST_timed init(Stream values,Stream times) {
        values @=> _stvalue;
        times @=> _sttime;
        return this;
    }
    
    fun ST_timed init(Stream values,Stream times,int holdArg) {
        values @=> _stvalue;
        times @=> _sttime;
        holdArg => _holdMode;
        return this;
    }
    
    fun ST_timed holdMode(int bool) {
        bool => _holdMode;
        return this;
    }
    
    fun dur nextT() {
        if (_sttime != null) _sttime.next() => _time;
        return _time * second;
    }
    
    fun float nextValue() {
        if (_stvalue != null) _stvalue.next() => _value;
        return _value;
    }
    
    fun float next() {
        if (isFirstRun) {
            false => isFirstRun;
            nextValue() => _value;
            nextT() + now => nextTime;
            return _value;
        }   
        
//        <<<((then + dT) - now) / second>>>;
        
        if (nextTime > now) { // check if now has arrived at next
            true => _more;
            return _value; // if not, just return value
        } else { // create a new next that is in the future.
            false => _more;
            do {
                nextTime + nextT() => nextTime;
                nextValue() => _value;
            } while ( nextTime < now );
        }
        return _value;
    }
    
    fun int more() {
        if (_holdMode) {
            if (_more) {
                return true;
            } else {
                true => _more;
                return false;
            }
        } 
        return false;
    }
    
    fun ST_timed values(Stream arg) {
        arg @=> _stvalue;
        return this;
    }
    
    fun ST_timed times(Stream arg) {
        arg @=> _sttime;
        return this;
    }
}
        