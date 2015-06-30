public class ST_count extends Stream 
{
    "ST_count" @=> _type;
    
    int value;
    int _max;
    
    null @=> Stream @ st_max;
    
    fun static ST_count make (int arg) {
        ST_count stream;
        stream.init(arg);
        return stream;
    }
    
    fun ST_count init (Stream arg) {
        arg @=> st_max;
        return this;
    }
    
    fun ST_count max (Stream arg) {
        arg @=> st_max;
        return this;
    }
    
    fun ST_count init (int arg) {
        Math.floor(arg) $ int => _max;
        null @=> st_max;
        return this;
    }
    
    fun float next() {
        if (st_max != null) {
            Math.floor(st_max.next()) $ int => _max;
        }
        value % _max => value => int tmp;
        value++;
        return tmp $ float;
    }
}