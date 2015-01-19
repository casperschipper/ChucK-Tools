public class ST_latch extends Stream 
{
    "ST_latch" @=> _type;
    
    Stream @ source;
    Stream @ reps;
    
    int repLeft;
    float memValue;
    
    fun static ST_latch make(Stream _source,Stream _reps) {
        ST_latch stream;
        stream.init(_source,_reps);
        return stream;
    }
    
    fun ST_latch init(Stream _source,Stream _reps) {
        _source @=> source;
        _reps @=> reps;
        reps.nextInt() => repLeft;
        return this;
    }

    fun int more() {
        if (repLeft > 0) {
            return true;
        } 
        reps.nextInt() => repLeft;    
        return false;
    }
    
    fun float next() {
        repLeft--;
        return source.next();
    }
}
