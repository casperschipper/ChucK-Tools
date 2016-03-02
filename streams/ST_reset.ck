 class ST_reset extends Stream 
{
    "ST_reset" @=> _type;
    
    ST_walk @ st_walk;
    Stream @ st_source;
    Stream @ st_reps;
    
    int repLeft;
    float memValue;
    
    0 => int _holdMode;
        
    fun ST_reset holdMode(int arg) {
        arg @=> _holdMode;
        return this;
    }
    
    fun int more() { 
        if (_holdMode) {
            if (repLeft > 0) {
                return true;
            }
        } 
        return false;
    }           
         

    fun ST_reset walk(ST_walk walkArg) {
        walkArg @=> st_walk;
        return this;
    }

    fun ST_reset source(Stream sourceArg) {
        sourceArg @=> st_source;
        return this;
    }

    fun ST_reset reps(Stream repeatArg) {
        repeatArg @=> st_reps;
        return this;
    }
    
    fun ST_reset init(ST_walk walkArg, Stream sourceArg,Stream repsArg) {
        walk(walkArg);
        source(sourceArg);
        reps(repsArg);
        return this;
    }
    
    fun float next() {
        if (repLeft-- > 0) {
            return st_walk.next();
        } else {
            st_reps.nextInt() => repLeft;
            st_source.next() => memValue;
            memValue => st_walk.value;
        }
        repLeft--;
        return memValue;
    }
}

class Main extends st {
    seq( [
    (new ST_reset).init( walk(0,ch(1,1)),st(0),rv(3,6)).holdMode(true),
    st(200)
    ]).test();
    
}

Main main;

hour => now;