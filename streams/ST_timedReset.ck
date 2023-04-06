public class ST_timedReset extends Stream {
    ST_walk @ st_walk;
    Stream @ st_timer;
    Stream @ st_value;
    
    time then;
    
    false => int _holdMode;
    true => int _more;
    
    fun ST_timedReset init(ST_walk walkArg,Stream valueArg,Stream timerArg) {
        walk(walkArg);
        value(valueArg);
        timer(timerArg);
        now + (st_timer.next()*second) => then;
        return this;
    }
    
    fun ST_timedReset holdMode(int bool) {
        bool => _holdMode;
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
    
    fun ST_timedReset walk(ST_walk walkArg) {
        walkArg @=> st_walk;
        return this;
    }
    
    fun ST_timedReset value(Stream valueArg) {
        valueArg @=> st_value;
        return this;
    }
    
    fun ST_timedReset timer(Stream timerArg) {
        timerArg @=> st_timer;
        return this;
    }
    
    fun float next() {
        checkIfReset();
        return st_walk.next();
    }
    
    fun void checkIfReset() {
        if (now > then) {
            false => _more;
            st_walk.value(st_value.next()); // reset walk
            do { // update timer, untill then is in future
                then + (st_timer.next() * second) => then;
            } while ( then < now );
        } else {
            true => _more;
        }
    }
}

// this would create a walk, that resets to 0 every 10 seconds) 
    
    
    