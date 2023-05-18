public class ST_walkList extends Stream {
    float table[];
    null @=> Stream @ st_table[];
    null @=> Stream @ stepper;
    
    0 => index;
    0 => int _max;
    0 => int _min;
    null @=> Stream @ st_max;
    null @=> Stream @ st_min;
    
    "ST_walkList" @=> _type;
    
    fun ST_walkList init(float _values[],Stream _stepper) {
        _values @=> table;
        null @=> st_table;
        table.size() => size => _max;
        _stepper @=> stepper;
        return this;
    }
    
    fun ST_walkList init(int _values[],Stream _stepper) {
        cs.int2float(_values) @=> table;
        null @=> st_table;
        table.size() => size => _max;
        _stepper @=> stepper;
        return this;
    }
    
    fun ST_walkList init(Stream _values[],Stream _stepper) {
        _values @=> st_table;
        _stepper @=> stepper;
        st_table.size() => size => _max;
        return this;
    }
    
    fun ST_walkList step(Stream arg) {
        arg @=> stepper;
        return this;
    }
    
    fun ST_walkList list(float arg[]) {
        arg @=> table;
        arg.size() => size => _max;
        null @=> st_table;
        return this;
    }
    
    fun ST_walkList list(int arg[]) {
        cs.int2float(arg) @=> table;
        arg.size() => size => _max;
        null @=> st_table;
        return this;
    }
    
    fun ST_walkList list(Stream arg[]) {
        arg @=> st_table;
        st_table.size() => size => _max;
        return this;
    }
    
    fun ST_walkList max(int arg) {
        Math.min(arg,size-1) $ int => _max;
        null @=> st_max;
        return this;
    }
    
    fun ST_walkList max(Stream arg) {
        arg @=> st_max;
        return this;
    }
    
    fun ST_walkList min(int arg) {
        Math.min(arg,size-1) $ int => _max; 
        null @=> st_min;     
        return this;
    }
    
    fun ST_walkList min(Stream arg) {
        arg @=> st_min;
        return this;
    }
    
    fun void sortMinMax() {
        Math.min(_min,_max) $ int => int tmp;
        Math.max(_min,_max) $ int => _max;
        tmp => _min;
        
        // make it safe
        Math.min(_min,size-1) $ int => _min;
        Math.max(_max,size-1) $ int => _max;
    }
    
    fun void safeIndex() {
        if (st_table != null) {
            if (st_table[index].more()) {
                return;
            }
        }
        
        if (st_max != null) st_max.nextInt() => _max;
        if (st_min != null) st_min.nextInt() => _min;
        
        sortMinMax();
        
        if (stepper == null) {
            chout <= "stepper is null" <= IO.newline(); return;
        }
        wrap(stepper.nextInt() + index,_min,_max-1) => index;
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
        safeIndex();
        
        if (st_table != null) {
            return st_table[index].next();
        }
        
        return table[index];
    }
}      
    
        