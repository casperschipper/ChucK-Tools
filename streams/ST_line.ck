public class ST_line extends ST_timed {    
    second => dur _currentDur;
    now => time _previousTime;
    0 => float _previousValue;
    
    fun float next() {
        if(isFirstRun) {
            false => isFirstRun;
            // init values:
            nextValue() => _previousValue;
            nextValue() => _value;
            nextT() => _currentDur;
            _currentDur + now => nextTime;
            now => _previousTime;
            
            return _previousValue;
        } 
        
        // fetch current position in the dur       
        if (nextTime > now) { 
            true => _more;
            now - _previousTime => dur currentDiff;
            return interpValue(_previousValue,_value,currentDiff);
        } else {
            false => _more;
            do {
                nextTime => _previousTime;
                nextT() => _currentDur;
                nextTime + _currentDur => nextTime;
                
                _value => _previousValue;
                nextValue() => _value;  
            } while (nextTime < now );
        }
        now - _previousTime => dur currentDiff;
        return interpValue(_previousValue,_value,currentDiff);
    }
 
    fun float interpValue(float a,float b,dur currentDiff) {
        // period is y2 - y1;
        // current is yx
        // a = x1, b = x2
        return a + ((currentDiff / _currentDur) * (b - a));
    }
}