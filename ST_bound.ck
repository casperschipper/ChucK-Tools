// an attempt to split boundary behavor from the walk itself.
// various boundaries can be combined with various types of 'walk'.
// holdmode results in a walk that stops the hold as soon as a boundary is hit.

class ST_bound extends Stream {
    ST_walk @ walk;
    
    Stream @ st_min;
    Stream @ st_max;
    
    float _min;
    float _max;
    float _range;
    float _result;
    
    false => int _more;
    false => int _holdMode;
    
    fun ST_bound init(ST_walk walkArg,Stream minArg,Stream maxArg) {
        walkArg @=> walk;
        minArg @=> st_min;
        maxArg @=> st_max;
        return this;
    }
    
    fun ST_bound holdMode(int arg) {
        arg => _holdMode;
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
        
    
    fun ST_bound min (Stream arg) {
        arg @=> st_min;
        return this;
    }
    
    fun ST_bound max (Stream arg) {
        arg @=> st_max;
        return this;
    }
        
    fun void checkBoundaries() {
        st_min.next() => _min;
        st_max.next() => _max;
        if ( walk._value < _min ) {
            boundMin();
        }
        if ( walk._value > _max ) {
            boundMax();
        }
    }
    
    fun void boundMin() {
        false => _more;
        _min => walk.value;
    }
    
    fun void boundMax() {
        false => _more;
        _max => walk.value;
    }
    
    fun float next() {
        walk.next() => _result;
        checkBoundaries();
        return walk._value;
    }
}


// an example of an extension, the boundary wraps the othe way around
class ST_bound2 extends ST_bound {
    fun void boundMin() {
        false => _more;
        cs.wrapf(walk._value,_min,_max) => walk.value;
    }
    
    fun void boundMax() {
        false => _more;
        cs.wrapf(walk._value,_min,_max) => walk.value;
    }
}

class Main extends st {
    SinSynth s => Safe safe => dac;
    
    s.init(
    (new ST_bound2).init(walk(1,rv(-10,10)),st(0),st(100)),
    st(44100)
    ); 
}

Main main;

minute => now;

// should bound 0 to 100, if smaller, return 0, bigger return 1--
        