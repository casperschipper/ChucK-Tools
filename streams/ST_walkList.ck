public class ST_walkList extends Stream {
    float table[];
    null @=> Stream @ st_table[];
    null @=> Stream @ stepper;
    
    0 => index;
    
    "ST_walkList" @=> _type;
    
    fun ST_walkList init(float _values[],Stream _stepper) {
        _values @=> table;
        null @=> st_table;
        <<<table.size()>>> => size;
        _stepper @=> stepper;
        return this;
    }
    
    fun ST_walkList init(int _values[],Stream _stepper) {
        cs.int2float(_values) @=> table;
        null @=> st_table;
        table.size() => size;
        _stepper @=> stepper;
        return this;
    }
    
    fun ST_walkList init(Stream _values[],Stream _stepper) {
        _values @=> st_table;
        _stepper @=> stepper;
        st_table.size() => size;
        return this;
    }
    
    fun int safeIndex() {
        wrap(stepper.nextInt() + index,0,size-1) => index;
        return index;
    }
    
    fun int wrap(int x,int low, int high) {
        Math.abs(high - low + 1) => int range;
        ((x-low) % range) => x;
        if (x<0)
            return high + 1 + x;
        else 
            return low + x;
    }
    
    fun float next() {
        if (st_table != null) {
            return st_table[safeIndex()].next();
        }
        
        return table[safeIndex()];
    }
}      
    
        