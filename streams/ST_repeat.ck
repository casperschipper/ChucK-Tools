public class ST_repeat extends Stream 
{
    "ST_repeat" @=> _type;
    
    Stream @ source;
    Stream @ reps;
    
    int repLeft;
    float memValue;
    
    fun void init(Stream _source,Stream _reps) {
        _source @=> source;
        _reps @=> reps;
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