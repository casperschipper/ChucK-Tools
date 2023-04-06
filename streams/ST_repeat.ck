public class ST_repeat extends Stream 
{
    "ST_repeat" @=> _type;
    
    Stream @ source;
    Stream @ reps;
    
    int repLeft;
    float memValue;
    
    0 => int _holdMode;
        
    fun ST_repeat holdMode(int arg) {
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
            
    
    fun static ST_repeat make(Stream _source,Stream _reps) {
        ST_repeat stream;
        stream.init(_source,_reps);
        return stream;
    }
    
    fun ST_repeat init(Stream _source,Stream _reps) {
        _source @=> source;
        _reps @=> reps;
        return this;
    }
    
    
    fun float next() {
        if (repLeft-- > 0) {
            return memValue;
        } else {
            reps.nextInt() => repLeft;
            source.next() => memValue;
        }
        repLeft--;
        return memValue;
    }
}