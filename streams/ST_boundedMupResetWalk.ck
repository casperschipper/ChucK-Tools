/* 
this is a variant of the moudedMupwalk, with the change that it uses a stream to reset it's value
*/ 

public class ST_boundedMupResetWalk extends ST_boundedMupWalk {
    "ST_boundedMupResetWalk" @=> _type;
    
    null @=> Stream @ st_reset;
    1 => int shouldReset;
    0 => float resetValue;
    
    fun void wrap() {
        if (st_min != null) st_min.next() => _min;
        if (st_max != null) st_max.next() => _max;
        if (value < Math.min(_min,_max)) {
            1 => shouldReset;
        }
        if (value > Math.max(_min,_max)) {
            1 => shouldReset;
        }
        if (shouldReset) {
            0 => shouldReset;
            if (st_reset != null) {
                st_reset.next() => resetValue;
            }
            resetValue => value;
        }       
    }
    
    fun ST_boundedMupResetWalk reset(Stream arg) {
        arg @=> st_reset;
        return this;
    }
    
    fun ST_boundedMupResetWalk reset(float arg) {
        null @=> st_reset;
        arg => resetValue;
        return this;
    }
}