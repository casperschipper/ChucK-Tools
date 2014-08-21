class ST_timed extends Stream {
    //
    float _time;
    
    null @=> Stream @ _stvalue;
    null @=> Stream @ _sttime;
    
    float _value;
    
    time then;
    
    fun float nextT() {
        if (_sttime) _sttime.next() => _time;
        return _time;
    }
    
    fun float nextValue() {
        if (_stvalue) _stvalue.next() => _value;
        return _value;
    }
    
    fun float next() {
        while (now > then) {
            nextT() * second => dur interval;
            now + interval => time then;
            nextValue() => _value;
        }
        return _value;
    }
    
    fun ST_timed setValues(Stream arg) {
        arg @=> _stvalues;
        return this;
    }
    
    fun ST_timed setTimes(Stream arg) {
        arg @=> _sttimes;
        return this;
    }
}

ST
            
        