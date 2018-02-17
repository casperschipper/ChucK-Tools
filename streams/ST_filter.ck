class ST_filter extends Stream {
    Stream st_input;
    
    float nextValue;
    false => int flag;
    
    fun ST_filter init(Stream inArg) {
        inArg @=> st_input;
        return this;
    }
    
    fun int filter(float x) {
        // only accepts odd numbers 
        // this can be overloaded to contain some other test:
        Math.floor(x) => x;
        return ((x $ int) % 2);
    }

    fun int more() {
        1 => flag;
        // check if more
        if(!st_input.more()) {
            return false;
        } 
        st_input.next() => nextValue;
        // store the next value
        if (filter(nextValue)) {
            return true; // Yes it is ok
        }
        return more(); // whoops, calculate another.
    }
    
    fun float next() {
        if (!flag) {
            more();
            0 => flag;
        } 
        return nextValue;        
    }
}

class M extends st {
    (new ST_filter).init(latch(count(100),st(100))).test();
}

M m;
hour => now;
    

    
    