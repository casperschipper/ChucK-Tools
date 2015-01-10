public class ST_boundedCount extends ST_count 
{
    "ST_boundedCount" @=> _type;
    
    null @=> Stream @ st_max;
    null @=> Stream @ st_min;
    
    int min;
    
    fun ST_boundedCount max(Stream arg) {
        arg @=> st_max;
    }
    
    fun ST_boundedCount min(
    
    fun ST_boundedCount min(Stream arg) {
        arg @=> st_min;
    }
    
    fun float next() {
        if (st_min != null) st_min.next() => min;
        if (st_max != null) st_max.next() => max;
        
        Math.min(min,max) => float tmp;
        Math.max(min,max) => max;
        tmp => min;
        
        value => int tmp;
        
        value + 1 => value;
        
        if (value > max) {
            min => value;
        }
        if (value < min) {
            min => value;
        }
        return tmp;
    }
}