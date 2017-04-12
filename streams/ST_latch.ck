public class ST_latch extends Stream 
{
    "ST_latch" @=> _type;
    
    Stream @ st_source;
    Stream @ st_reps;
    
    int repLeft;
    float memValue;
    
    fun static ST_latch make(Stream sourceArg,Stream repsArg) {
        ST_latch stream;
        stream.init(sourceArg,repsArg);
        return stream;
    }
    
    fun ST_latch init(Stream sourceArg,Stream repsArg) {
        sourceArg @=> st_source;
        repsArg @=> st_reps;
        st_reps.nextInt() => repLeft;
        return this;
    }

    fun int more() {
        if (!st_source.more()) {
            repLeft--;
        }
        if (repLeft > 0) {
            return true;
        } 
        st_reps.nextInt() => repLeft;  
        if (repLeft < 0) 0 => repLeft;
        st_source.reset();
        return false;
    }
    
    fun float next() {
        return st_source.next();
    }
}
