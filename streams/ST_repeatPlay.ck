public class ST_repeatPlay extends Stream 
{
    // a repeat, but one that still consumes the stream underlying it
    // so let's say we have a stream 1 2 3 4 5 6 7 8 9
    // and we repeat we get
    // 1 2 3 3 3 7 8 9
    "ST_repeatplay" @=> _type;
    
    Stream @ source;
    Stream @ reps;
    
    int repLeft;
    float memValue;
    
    0 => int _holdMode;
    
    fun ST_repeatPlay holdMode(int arg) {
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
    
    
    fun static ST_repeatPlay make(Stream _source,Stream _reps) {
        ST_repeatPlay stream;
        stream.init(_source,_reps);
        return stream;
    }
    
    fun ST_repeatPlay init(Stream _source,Stream _reps) {
        _source @=> source;
        _reps @=> reps;
        return this;
    }
    
    
    fun float next() {
        if (repLeft-- > 0) {
            source.next(); // Just throw away
            return memValue;
            
        } else {
            reps.nextInt() => repLeft;
            source.next() => memValue;
        }
        repLeft--;
        return memValue;
    }
}