public class ST_count extends Stream 
{
    "ST_count" @=> _type;
    
    float value;
    float max;
    
    fun void init (float _max) {
        _max => max;
    }
    
    fun float next() {
        value => float tmp;
        (value + 1) % max => value;
        return tmp;
    }
}