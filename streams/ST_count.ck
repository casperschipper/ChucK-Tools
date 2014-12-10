public class ST_count extends Stream 
{
    "ST_count" @=> _type;
    
    int value;
    int max;
    
    fun static ST_count make (int _max) {
        ST_count stream;
        stream.init(_max);
        return stream;
    }
    
    fun ST_count init (int _max) {
        Math.floor(_max) $ int => max;
        return this;
    }
    
    fun float next() {
        value => int tmp;
        (value + 1) % max => value;
        return tmp $ float;
    }
}