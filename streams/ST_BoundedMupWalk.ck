public class ST_BoundedMupWalk extends ST_mupWalk {
    "ST_boundedMupWalk" @=> _type;
    
    20 => float _min;
    20000 => float _max;
    
    null @=> Stream @ st_min;
    null @=> Stream @ st_max;
    
    fun void wrap() {
        if (st_min != null) st_min.next() => _min;
        if (st_max != null) st_max.next() => _max;
        
        (_max + _min) / 2 => float mean;
           
        if (value < Math.min(_min,_max)) mean => value;
        if (value > Math.max(_min,_max)) mean => value;
    }
    
    fun ST_BoundedMupWalk min(Stream arg) {
        arg @=> st_min;
        return this;
    }
    
    fun ST_BoundedMupWalk max(Stream arg) {
        arg @=> st_max;
        return this;
    }
    
    fun ST_BoundedMupWalk min(float arg) {
        arg => _min;
        null @=> st_min;
        return this;
    }
    
    fun ST_BoundedMupWalk max(float arg) {
        arg => _max;
        null @=> st_min;
        return this;
    }
}