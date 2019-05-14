public class ST_linseg extends Stream {
    0. => float _current;
    0. => float _target;
    0. => float _rate;
    0 => int _steps;
    
    null @=> Stream @ st_startValues;
    null @=> Stream @ st_endValues;
    null @=> Stream @ st_numberOfSteps;

    false => int _holdMode;
    false => int _more;
    
    fun ST_linseg holdMode (int arg) {
        (arg != 0) => _holdMode;
        true => _more;
        return this;
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
    
    fun float calcRate (float a, float b, int steps) {
        if (steps == 0) {
            return (b-a);
        }
        return (b - a) / Math.abs(steps);
    }

    fun float next() {
        if ( _steps == 0 ) {
            st_startValues.next() => _current;
            st_endValues.next() => _target;
            Math.floor(st_numberOfSteps.next()) $ int => _steps;
            calcRate(_current,_target,_steps) => _rate;
        }
        _steps--;
        _current => float tmp;
        _current + _rate => _current;
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
    
    fun ST_linseg steps (float arg ) {
        return steps( Math.floor( arg ));
    }
}
