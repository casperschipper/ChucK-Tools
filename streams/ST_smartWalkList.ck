public class ST_smartWalkList extends Stream {
    float table[];
    null @=> Stream @ st_table[];
    null @=> Stream @ stepper;
    null @=> Stream @ st_direction;

    1 => int direction;
    
    0 => index;
    
    "ST_smartWalkList" @=> _type;
    
    fun ST_smartWalkList init(float _values[],Stream _stepper,Stream _direction) {
        _values @=> table;
        null @=> st_table;
        table.size() => size;
        _stepper @=> stepper;
        _direction @=> st_direction;
        return this;
    }
    
    fun ST_smartWalkList init(int _values[],Stream _stepper,Stream _direction) {
        cs.int2float(_values) @=> table;
        null @=> st_table;
        table.size() => size;
        _stepper @=> stepper;
        _direction @=> st_direction;
        return this;
    }
    
    fun ST_smartWalkList init(Stream _values[],Stream _stepper,Stream _direction) {
        _values @=> st_table;
        _stepper @=> stepper;
        _direction @=> st_direction;
        st_table.size() => size;
        return this;
    }
    
    fun ST_smartWalkList step(Stream arg) {
        arg @=> stepper;
        return this;
    }
    
    fun ST_smartWalkList list(float arg[]) {
        arg @=> table;
        arg.size() => size;
        null @=> st_table;
        return this;
    }
    
    fun ST_smartWalkList list(Stream arg[]) {
        arg @=> st_table;
        st_table.size() => size;
        return this;
    }
    
    fun void safeIndex() {
        if (st_table != null) {
            if (st_table[index].more()) {
                return;
            }
        }
        
        if (stepper == null) {
            chout <= "stepper is null" <= IO.newline(); return;
        }

        // update step
        (stepper.nextInt() * direction) + index => index;

        // boundary conditions
        if (st_direction != null) {
            if (index == 0 || index == (size - 1)) {
                if (st_direction.nextInt() > 0) {
                    1 => direction;
                } else {
                    -1 * direction => direction;
                }
            }
        }
        
        // wrap to keep index within array
        wrap(index,0,size-1) => index;
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
    
        