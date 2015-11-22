class ST_linseg extends Stream {
    0 => int _current;
    0 => int _target;
    
    0. => float _currentValue;
    0. => float _targetValue;
    1 => float _rate;
    1 => int _steps;
    
    null @=> Stream @ st_startValues;
    null @=> Stream @ st_endValues;
    null @=> Stream @ st_numberOfSteps;

    false => int _holdMode;

    fun ST_linseg holdMode (int arg) {
        (arg != 0) => _holdMode;
        return this;
    }
    
    fun int more() {
        if (_holdMode) {
            if (_currentValue < _targetValue) {
                return true;
            } 
        } 
        return false;
    }

    fun float next() {
        _currentValue => float tmp;
        if(_current < _target) {
            _currentValue + _rate => _currentValue;
        } else {
            0 => _current;
            st_startValues.next() => _currentValue;
            st_endValues.next() => _targetValue;
            if (st_numberOfSteps != null) st_numberOfSteps.nextInt() => _steps;
            _current + _steps => _target;
            (_targetValue - _currentValue) / (_steps $ float) => _rate;
        }
        _current++;
        
        return tmp;
    }
    
    fun ST_linseg start ( Stream arg ) {
        arg @=> st_startValues;
        return this;
    }
    
    fun ST_linseg end ( Stream arg ) {
        arg @=> st_endValues;
        return this;
    }
    
    fun ST_linseg steps ( Stream arg ) {
        arg @=> st_numberOfSteps;
        return this;
    }
    
    fun ST_linseg steps ( int arg ) {
        arg => steps;
        null @=> st_numberOfSteps;
        return this;
    }
}

ST_linseg test;

test
.start(st.st(1))
.end(st.st(10))
.steps(10)
.test();