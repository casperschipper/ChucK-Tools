public class ST_trigReset extends Stream 
{
    "ST_reset" @=> _type;
    
    ST_walk @ st_walk;
    Stream @ st_source;
    Stream @ st_trigger;
    
    0 => int _holdMode;
    
    fun void holdMode(int arg) {
        arg @=> _holdMode;
    }
    
    fun void trigger(Stream trigArg)  {
        trigArg @=> st_trigger;
    }
    
    fun void walk(ST_walk walkArg) {
        walkArg @=> st_walk;
    }
    
    fun void source(Stream sourceArg) {
        sourceArg @=> st_source;
    }
    
    fun ST_trigReset init(ST_walk walkArg, Stream sourceArg,Stream triggerArg) {
        walk(walkArg);
        source(sourceArg);
        trigger(triggerArg);
        return this;
    }
    
    fun float next() {
        float x;
        if (st_trigger.next() != 0) {
            st_source.next() => st_walk._value => x;
        } else {
            st_walk.next() => x;
        }
        return x;
    }
}


